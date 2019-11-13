module Mutations
  class SignInManager < BaseMutation
    null true

    argument :email, Types::AuthProviderEmailInput, required: false

    field :token, String, null: true
    field :manager, Types::ManagerType, null: true

    def resolve(email: nil)
      # basic validation
      return unless email

      manager = Manager.find_by email: email[:email]

      # ensures we have the correct manager
      return unless manager
      return unless manager.authenticate(email[:password])

      # use Ruby on Rails - ActiveSupport::MessageEncryptor, to build a token
      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      token = crypt.encrypt_and_sign("manager-id:#{ manager.id }")

      { manager: manager, token: token }
    end
  end
end