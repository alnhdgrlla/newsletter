module Mutations
  class CreateTemplate < BaseMutation
    argument :inputs, Types::TempInput, required: true

    type Types::TemplateType

    def resolve(inputs: )
      c_u = context[:current_user] 
      return GraphQL::ExecutionError.new("You must log in to create a spam") if !c_u
      
      temp = Template.create!(inputs.to_h)
      temp
    end
  end
end