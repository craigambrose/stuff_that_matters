defmodule StuffThatMatters.Repo.Migrations.CreateStuffThatMatters.Taxonomy.Issue do
  use Ecto.Migration

  def change do
    create table(:taxonomy_issues) do
      add :name, :string

      timestamps()
    end

  end
end
