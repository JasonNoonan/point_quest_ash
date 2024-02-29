defmodule PointQuestAsh.Repo do
  use Ecto.Repo,
    otp_app: :point_quest_ash,
    adapter: Ecto.Adapters.Postgres
end
