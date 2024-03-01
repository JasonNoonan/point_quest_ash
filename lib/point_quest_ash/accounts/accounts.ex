defmodule PointQuestAsh.Accounts do
  use Ash.Api

  resources do
    resource PointQuestAsh.Accounts.User
    resource PointQuestAsh.Accounts.Token
  end
end
