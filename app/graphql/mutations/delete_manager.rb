module Mutations
  class DeleteManager < BaseMutation
    argument :manager_id, ID, required: true

    type Types::ManagerType

    def resolve(mafnager_id: )
      c_u = context[:current_user] 
      return GraphQL::ExecutionError.new("You must log in to create a spam") if !c_u

      manager = Manager.find_by(id:mafnager_id)
      return GraphQL::ExecutionError.new("No manager exists with that ID") if !manager

      return GraphQL::ExecutionError.new("You have no right to delete the manager") if !manager.id == c_u.id

      manager.destory
    end
  end
end