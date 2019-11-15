module Types
  class QueryType < Types::BaseObject
    field :all_spam, resolver: Resolvers::AllSpam
    field :all_temp, resolver: Resolvers::AllTemp
    field :all_subscriber, resolver: Resolvers::AllSubscriber
    field :single_spam, resolver: Resolvers::SingleSpam
    field :single_subscriber, resolver: Resolvers::SingleSubscriber
  end
end
