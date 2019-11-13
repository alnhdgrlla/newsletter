module Mutations
  class CreateSpam < BaseMutation
    argument :name, String, required: true

    type Types::SpamType

    def resolve(name:)
      c_u = context[:current_user] 
      return GraphQL::ExecutionError.new("You must log in to create a spam") if !c_u
      c_u.spams.create!(
        name: name
      )
    end
  end
end