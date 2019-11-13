module Types
  class MutationType < Types::BaseObject
    field :create_manager, mutation: Mutations::CreateManager
    field :sign_in_manager, mutation: Mutations::SignInManager
    field :create_spam, mutation: Mutations::CreateSpam
    field :create_template, mutation: Mutations::CreateTemplate
    field :delete_spam, mutation: Mutations::DeleteSpam
    field :update_spam, mutation: Mutations::UpdateSpam
  end
end
