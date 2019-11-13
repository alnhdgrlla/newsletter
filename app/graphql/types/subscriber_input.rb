module Types
  class SubscriberInput < BaseInputObject
    # the name is usually inferred by class name but can be overwritten
    graphql_name 'subscriber'

    argument :name, String, required: true
    argument :email, String, required: true
    argument :spam_id, ID, required: true
  end
end