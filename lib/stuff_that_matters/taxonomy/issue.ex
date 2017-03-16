defmodule StuffThatMatters.Taxonomy.Issue do
  use Ecto.Schema

  schema "taxonomy_issues" do
    field :name, :string

    timestamps()
  end
end
