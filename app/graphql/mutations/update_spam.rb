module Mutations
  class UpdateSpam < BaseMutation
    argument :spam_id, ID, required: true
    argument :name, String, required: true

    type Types::SpamType

    def resolve(spam_id:, name: )

      c_u = context[:current_user] 
      return GraphQL::ExecutionError.new("You must log in to create a spam") if !c_u

      spam = Spam.find_by(id:spam_id)
      return GraphQL::ExecutionError.new("No spam exists with that ID") if !spam

      return GraphQL::ExecutionError.new("You have no right to update the spam") if !spam.manager.id == c_u.id

      spam.update!(name: name)
      spam
    end
  end
end