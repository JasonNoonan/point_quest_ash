defmodule PointQuestAsh.Repo do
  use AshPostgres.Repo, otp_app: :point_quest_ash

  def installed_extensions do
    ["uuid-ossp", "citext"]
  end
end
