module Mutations
  class DeleteSpam < BaseMutation
    argument :spam_id, ID, required: true

    type Types::SpamType

    def resolve(spam_id: )
      c_u = context[:current_user] 
      return GraphQL::ExecutionError.new("You must log in to create a spam") if !c_u

      spam = Spam.find_by(id:spam_id)
      return GraphQL::ExecutionError.new("No spam exists with that ID") if !spam

      return GraphQL::ExecutionError.new("You have no right to delete the spam") if !spam.manager.id == c_u.id

      spam.destroy
    end
  end
end