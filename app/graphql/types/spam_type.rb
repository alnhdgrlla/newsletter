module Types
  class SpamType < BaseObject
    field :id, ID, null: true
    field :name, String, null: true
    field :manager, Types::ManagerType, null: true
    field :subscriber, [Types::SubscriberType], null: true
    field :templates, [Types::TemplateType], null: true
  end
end