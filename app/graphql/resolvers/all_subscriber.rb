module Resolvers
  class AllSubscriber < Resolvers::Base
    argument :spam_id, ID, required: false
    argument :limit, Integer, required: false
    argument :offset, Integer, required: false

    type [Types::SubscriberType], null: false

    def resolve(spam_id:, limit: 10, offset: 0 )
      c_user = context[:current_user]
      return GraphQL::ExecutionError.new("You have to log in") if !c_user

      spam = Spam.find_by(id:spam_id)
      return GraphQL::ExecutionError.new("No spam exits with that ID") if !spam
      
      subscribers = c_user.subscribers.limit(limit).offset(offset)
      subscribers

    end
  end
end