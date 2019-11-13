module Types
  class TemplateType < BaseObject
    field :id, ID, null: false
    field :temp_name, String, null: false
    field :content, String, null: true
    field :temp_content, String, null: true
    field :custom_name, String, null: true
  end
end