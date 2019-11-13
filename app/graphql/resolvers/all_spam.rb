module Resolvers
  class AllSpam < Resolvers::Base
    argument :manager_id, ID, required: true
    argument :limit, Integer, required: false
    argument :offset, Integer, required: false

    type [Types::SpamType], null: false

    def resolve(manager_id:, limit: 10, offset: 0 )
      c_user = context[:current_user]
      return GraphQL::ExecutionError.new("You have to log in") if !c_user
      
      Spam.where(id: c_user.id).limit(limit).offset(offset)
    end
  end
end