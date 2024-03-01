defmodule PointQuestAsh.Accounts.Secrets do
  use AshAuthentication.Secret

  def secret_for(
        [:authentication, :tokens, :signing_secret],
        PointQuestAsh.Accounts.User,
        _third_arg?
      ) do
    case Application.fetch_env(:point_quest_ash, PointQuestAshWeb.Endpoint) do
      {:ok, endpoint_config} ->
        Keyword.fetch(endpoint_config, :secret_key_base)

      :error ->
        :error
    end
  end
end
