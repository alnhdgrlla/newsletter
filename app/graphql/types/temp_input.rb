module Types
  class TempInput < BaseInputObject
    # the name is usually inferred by class name but can be overwritten
    graphql_name 'temp_input'

    argument :name, String, required: true
    argument :title, String, required: true
    argument :content, String, required: false
    argument :spam_id, ID, required: true
  end
end