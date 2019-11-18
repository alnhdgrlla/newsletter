module Mutations
  class DeleteManager < BaseMutation
    
    type Types::ManagerType

    def resolve(mafnager_id: )
      c_u = context[:current_user] 
      return GraphQL::ExecutionError.new("You must log in to create a spam") if !c_u

      manager = Manager.find_by(id:c_u.id)
      return GraphQL::ExecutionError.new("No manager exists with that ID") if !manager

      manager.destroy
    end
  end
end