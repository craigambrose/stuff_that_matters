defmodule StuffThatMatters.TaxonomyTest do
  use StuffThatMatters.DataCase

  alias StuffThatMatters.Taxonomy
  alias StuffThatMatters.Taxonomy.Issue

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:issue, attrs \\ @create_attrs) do
    {:ok, issue} = Taxonomy.create_issue(attrs)
    issue
  end

  test "list_issues/1 returns all issues" do
    issue = fixture(:issue)
    assert Taxonomy.list_issues() == [issue]
  end

  test "get_issue! returns the issue with given id" do
    issue = fixture(:issue)
    assert Taxonomy.get_issue!(issue.id) == issue
  end

  test "create_issue/1 with valid data creates a issue" do
    assert {:ok, %Issue{} = issue} = Taxonomy.create_issue(@create_attrs)
    assert issue.name == "some name"
  end

  test "create_issue/1 with invalid data returns error changeset" do
    assert {:error, %Ecto.Changeset{}} = Taxonomy.create_issue(@invalid_attrs)
  end

  test "update_issue/2 with valid data updates the issue" do
    issue = fixture(:issue)
    assert {:ok, issue} = Taxonomy.update_issue(issue, @update_attrs)
    assert %Issue{} = issue
    assert issue.name == "some updated name"
  end

  test "update_issue/2 with invalid data returns error changeset" do
    issue = fixture(:issue)
    assert {:error, %Ecto.Changeset{}} = Taxonomy.update_issue(issue, @invalid_attrs)
    assert issue == Taxonomy.get_issue!(issue.id)
  end

  test "delete_issue/1 deletes the issue" do
    issue = fixture(:issue)
    assert {:ok, %Issue{}} = Taxonomy.delete_issue(issue)
    assert_raise Ecto.NoResultsError, fn -> Taxonomy.get_issue!(issue.id) end
  end

  test "change_issue/1 returns a issue changeset" do
    issue = fixture(:issue)
    assert %Ecto.Changeset{} = Taxonomy.change_issue(issue)
  end
end
