module Mutations
  class DeleteTemplate < BaseMutation
    argument :temp_id, ID, required: true

    type Types::TemplateType

    def resolve(temp_id:)

      c_u = context[:current_user] 
      return GraphQL::ExecutionError.new("You must log in to create a spam") if !c_u

      temp = Template.find_by(id:temp_id)
      return GraphQL::ExecutionError.new("No template exists with that ID") if !temp

      return GraphQL::ExecutionError.new("You have no right to delete the spam") if !temp.manager.id == c_u.id

      temp.destroy
      temp
    end
  end
end