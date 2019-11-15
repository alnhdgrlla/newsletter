module Mutations
  class UpdateManager < BaseMutation
    argument :input, Types::ManagerInput, required: true
    argument :manager_id, ID, required: true

    type Types::ManagerType

    def resolve(input:, manager_id:)
      c_u = context[:current_user] 
      return GraphQL::ExecutionError.new("You must log in to create a spam") if !c_u

      mng = Manager.find_by(id: manager_id)
      return GraphQL::ExecutionError.new("No template exists with that ID") if !mng

      return GraphQL::ExecutionError.new("You have no right to update the manager") if !mng.id == c_u.id

      mng.update!(input.to_h)
      mng
    end
  end
end