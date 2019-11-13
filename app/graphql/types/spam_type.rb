module Types
  class SpamType < BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :manager, Types::ManagerType, null: false
    field :subscriber, [Types::SubscriberType], null: true
    field :template, Types::TemplateType, null: true
  end
end