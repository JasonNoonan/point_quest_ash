defmodule PointQuestAsh.Quests.Quest do
  use Ash.Resource, data_layer: AshPostgres.DataLayer

  actions do
    defaults [:create, :read, :update, :destroy]
  end

  attributes do
    uuid_primary_key :id

    attribute :name, :string do
      allow_nil? false
    end

    attribute :lead_from_the_front, :boolean do
      default false
    end
  end

  relationships do
    has_many :adventurers, PointQuestAsh.Quests.Adventurer
    has_one :party_leader, PointQuestAsh.Quests.Adventurer
  end
end
