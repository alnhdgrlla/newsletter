module Types
  class QueryType < Types::BaseObject
    field :all_spam, resolver: Resolvers::AllSpam
    field :all_temp, resolver: Resolvers::AllTemp
    field :all_subscriber, resolver: Resolvers::AllSubscriber
  end
end
