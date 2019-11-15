module Mutations
  class DeleteSubscriber < BaseMutation
    argument :subscriber_id, ID, required: true

    type Types::SubscriberType

    def resolve(subscriber_id:)

      c_u = context[:current_user] 
      return GraphQL::ExecutionError.new("You must log in to create a spam") if !c_u

      sub = Subscriber.find_by(id:subscriber_id)
      return GraphQL::ExecutionError.new("No subscriber exists with that ID") if !sub
      return GraphQL::ExecutionError.new("You have no right to delete the subscriber") if !sub.spam.manager.id == c_u.id

      sub.destroy
      sub
    end
  end
end