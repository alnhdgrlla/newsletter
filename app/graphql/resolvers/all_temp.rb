module Resolvers
  class AllTemp < Resolvers::Base
    argument :manager_id, ID, required: true
    argument :limit, Integer, required: false
    argument :offset, Integer, required: false

    type [Types::TemplateType], null: false

    def resolve(manager_id:, limit: 10, offset: 0 )
      c_user = context[:current_user]
      return GraphQL::ExecutionError.new("You have to log in") if !c_user
      
      Template.where(id: c_user.id).limit(limit).offset(offset)
    end
  end
end