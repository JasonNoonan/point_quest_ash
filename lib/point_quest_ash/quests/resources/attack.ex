defmodule PointQuestAsh.Quests.Attack do
  use Ash.Resource, data_layer: AshPostgres.DataLayer

  actions do
    defaults [:create, :read, :update, :destroy]
  end

  attributes do
    uuid_primary_key :id

    attribute :attack, :integer do
      allow_nil? false
    end
  end

  relationships do
    belongs_to :adventurer, PointQuestAsh.Quests.Adventurer
  end
end
