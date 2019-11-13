module Mutations
  class CreateTemplate < BaseMutation
    argument :inputs, Types::TempInput, required: true

    type Types::TemplateType

    def resolve(inputs: )
      Template.create!(inputs.to_h)
    end
  end
end