module Resolvers
  class SingleSpam < Resolvers::Base
    argument :sub_id, ID, required: true
    argument :limit, Integer, required: false
    argument :offset, Integer, required: false

    type Types::SpamType, null: false

    def resolve(sub_id:, limit: 10, offset: 0 )
      byebug
      c_user = context[:current_user]
      return GraphQL::ExecutionError.new("You have to log in") if !c_user

      sub = Subscriber.find_by(id: sub_id)
      return GraphQL::ExecutionError.new("There is not spam with that ID") if !sub
      
      return GraphQL::ExecutionError.new("You do not have the right to see this subscriber") if !c_user.id = sub.manager_id
      
      spam
    end
  end
end