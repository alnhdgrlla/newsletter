module Types
  class TempInput < BaseInputObject
    # the name is usually inferred by class name but can be overwritten
    graphql_name 'temp_input'

    argument :temp_id, ID, required: false
    argument :temp_name, String, required: true
    argument :temp_content, String, required: false
    argument :content, String, required: false
    argument :sub_name, String, required: false
    argument :spam_id, ID, required: false
  end
end