defmodule PointQuestAsh.Accounts.User do
  use Ash.Resource,
    data_layer: AshPostgres.DataLayer,
    extensions: [AshAuthentication]

  attributes do
    uuid_primary_key :id
    attribute :email, :ci_string, allow_nil?: false
    attribute :hashed_password, :string, allow_nil?: false, sensitive?: true
  end

  authentication do
    api PointQuestAsh.Accounts

    strategies do
      password :password do
        identity_field :email
        sign_in_tokens_enabled? true
      end
    end

    tokens do
      enabled? true
      token_resource PointQuestAsh.Accounts.Token

      signing_secret PointQuestAsh.Accounts.Secrets
    end
  end

  postgres do
    table "users"
    repo PointQuestAsh.Repo
  end

  identities do
    identity :unique_email, [:email]
  end
end
