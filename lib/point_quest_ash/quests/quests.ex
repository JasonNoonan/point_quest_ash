defmodule PointQuestAsh.Quests do
  use Ash.Api

  resources do
    resource PointQuestAsh.Quests.Adventurer
    resource PointQuestAsh.Quests.Attack
    resource PointQuestAsh.Quests.Quest
  end
end
