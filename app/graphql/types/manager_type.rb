module Types
  class ManagerType < BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :spam, [Types::SpamType], null: true
    field :subscriber, [Types::SubscriberType], null: true
  end
end