module Resolvers
  class SingleSpam < Resolvers::Base
    argument :spam_id, ID, required: true
    argument :limit, Integer, required: false
    argument :offset, Integer, required: false

    type Types::SpamType, null: false

    def resolve(spam_id:, limit: 10, offset: 0 )
      c_user = context[:current_user]
      return GraphQL::ExecutionError.new("You have to log in") if !c_user

      spam = Spam.find_by(id: spam_id)
      return GraphQL::ExecutionError.new("There is not spam with that ID") if !spam
      
      return GraphQL::ExecutionError.new("You do not have the right to see this spam") if !c_user.id == spam.manager_id
      
      spam
    end
  end
end