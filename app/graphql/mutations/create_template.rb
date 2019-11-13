module Mutations
  class CreateTemplate < BaseMutation
    argument :inputs, Types::TempInput, required: true

    type Types::TemplateType

    def resolve(inputs:)
      c_u = context[:current_user]
      c_u.templates.create!(inputs.to_h)
    end
  end
end