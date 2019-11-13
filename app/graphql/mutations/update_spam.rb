module Mutations
  class UpdateSpam < BaseMutation
    argument :spam_id, ID, required: true
    argument :name, String, required: true

    type Types::SpamType

    def resolve(spam_id:, name: )
      spam = Spam.find_by(id:spam_id)
      spam.update!(name: name)
      spam
    end
  end
end