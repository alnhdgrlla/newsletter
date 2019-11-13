module Mutations
  class CreateSubscriber < BaseMutation
    argument :input, Types::SubscriberInput, required: false

    type Types::SubscriberType

    def resolve(input:)
      spam = Spam.find_by(id: input.spam_id)
      return GraphQL::ExecutionError.new("No spam exist with that ID") if !spam
      
      Subscriber.create!(input.to_h)
    end
  end
end