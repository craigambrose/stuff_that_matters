defmodule StuffThatMatters.Web.IssueController do
  use StuffThatMatters.Web, :controller

  alias StuffThatMatters.Taxonomy

  def index(conn, _params) do
    issues = Taxonomy.list_issues()
    render(conn, "index.html", issues: issues)
  end

  def new(conn, _params) do
    changeset = Taxonomy.change_issue(%StuffThatMatters.Taxonomy.Issue{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"issue" => issue_params}) do
    case Taxonomy.create_issue(issue_params) do
      {:ok, issue} ->
        conn
        |> put_flash(:info, "Issue created successfully.")
        |> redirect(to: issue_path(conn, :show, issue))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    issue = Taxonomy.get_issue!(id)
    render(conn, "show.html", issue: issue)
  end

  def edit(conn, %{"id" => id}) do
    issue = Taxonomy.get_issue!(id)
    changeset = Taxonomy.change_issue(issue)
    render(conn, "edit.html", issue: issue, changeset: changeset)
  end

  def update(conn, %{"id" => id, "issue" => issue_params}) do
    issue = Taxonomy.get_issue!(id)

    case Taxonomy.update_issue(issue, issue_params) do
      {:ok, issue} ->
        conn
        |> put_flash(:info, "Issue updated successfully.")
        |> redirect(to: issue_path(conn, :show, issue))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", issue: issue, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    issue = Taxonomy.get_issue!(id)
    {:ok, _issue} = Taxonomy.delete_issue(issue)

    conn
    |> put_flash(:info, "Issue deleted successfully.")
    |> redirect(to: issue_path(conn, :index))
  end
end
