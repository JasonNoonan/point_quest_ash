defmodule PointQuestAsh.Accounts.Token do
  use Ash.Resource,
    data_layer: AshPostgres.DataLayer,
    extensions: [AshAuthentication.TokenResource]

  token do
    api PointQuestAsh.Accounts
  end

  postgres do
    table "tokens"
    repo PointQuestAsh.Repo
  end
end
