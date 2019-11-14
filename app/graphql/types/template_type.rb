module Types
  class TemplateType < BaseObject
    field :id, ID, null: false
    field :title, ID, null: false
    field :name, String, null: false
    field :content, String, null: false
  end
end