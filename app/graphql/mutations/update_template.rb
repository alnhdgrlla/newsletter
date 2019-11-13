module Mutations
  class UpdateTemplate < BaseMutation
    argument :input, Types::TempInput, required: true
    argument :temp_id, ID, required: true

    type Types::TemplateType

    def resolve(input:, temp_id:)
      return GraphQL::ExecutionError.new("You must log in to create a spam") if !c_u

      temp = Template.find_by(id:temp_id)
      return GraphQL::ExecutionError.new("No template exists with that ID") if !temp

      return GraphQL::ExecutionError.new("You have no right to delete the spam") if !temp.manager.id == c_u.id

      temp.update!(input.to_h)
      temp
    end
  end
end