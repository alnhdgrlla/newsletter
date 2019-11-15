module Types
  class MutationType < Types::BaseObject
    field :create_manager, mutation: Mutations::CreateManager
    field :sign_in_manager, mutation: Mutations::SignInManager
    field :create_spam, mutation: Mutations::CreateSpam
    field :create_template, mutation: Mutations::CreateTemplate
    field :create_subscriber, mutation: Mutations::CreateSubscriber
    field :delete_manager, mutation: Mutations::DeleteManager
    field :delete_spam, mutation: Mutations::DeleteSpam
    field :delete_template, mutation: Mutations::DeleteTemplate
    field :delete_subscriber, mutation: Mutations::DeleteSubscriber
    field :update_spam, mutation: Mutations::UpdateSpam
    field :update_template, mutation: Mutations::UpdateTemplate
    field :send_spam, mutation: Mutations::SendSpam
  end
end
