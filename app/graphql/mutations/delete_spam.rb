module Mutations
  class DeleteSpam < BaseMutation
    argument :spam_id, ID, required: true

    type Types::SpamType

    def resolve(spam_id: )
      spam = Spam.find-by(id:spam_id)
      spam.destory
    end
  end
end