module Types
  class ManagerInput < BaseInputObject
    # the name is usually inferred by class name but can be overwritten
    graphql_name 'manager'

    argument :name, String, required: false
    argument :email, String, required: false
    argument :password, String, required: false
  end
end