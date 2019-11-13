module Mutations
  class CreateSpam < BaseMutation
    argument :name, String, required: true

    type Types::SpamType

    def resolve(name:)
      c_u = context[:current_user]
      c_u.spams.create!(
        name: name,
      )
    end
  end
end