module Resolvers
  class SingleTemplate < Resolvers::Base
    argument :temp_id, ID, required: true
    argument :limit, Integer, required: false
    argument :offset, Integer, required: false

    type Types::TemplateType, null: false

    def resolve(temp_id:, limit: 10, offset: 0 )
      byebug
      c_user = context[:current_user]
      return GraphQL::ExecutionError.new("You have to log in") if !c_user

      temp = Template.find_by(id: temp_id)
      return GraphQL::ExecutionError.new("There is not template with that ID") if !temp
      
      return GraphQL::ExecutionError.new("You do not have the right to see this subscriber") if !c_user.id = temp.spam.manager_id
      
      temp
    end
  end
end