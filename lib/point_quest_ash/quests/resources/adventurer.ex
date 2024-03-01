defmodule PointQuestAsh.Quests.Adventurer do
  use Ash.Resource, data_layer: AshPostgres.DataLayer

  @class_enum [:healer, :mage, :knight]

  actions do
    defaults [:create, :read, :update, :destroy]
  end

  attributes do
    uuid_primary_key :id

    attribute :name, :string do
      allow_nil? false
    end

    attribute :class, :atom do
      constraints one_of: @class_enum

      default Enum.random(@class_enum)

      allow_nil? false
    end
  end

  relationships do
    has_one :attack, PointQuestAsh.Quests.Attack
    belongs_to :quest, PointQuestAsh.Quests.Quest
  end
end
