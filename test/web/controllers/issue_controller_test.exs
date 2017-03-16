defmodule StuffThatMatters.Web.IssueControllerTest do
  use StuffThatMatters.Web.ConnCase

  alias StuffThatMatters.Taxonomy

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:issue) do
    {:ok, issue} = Taxonomy.create_issue(@create_attrs)
    issue
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, issue_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing Issues"
  end

  test "renders form for new issues", %{conn: conn} do
    conn = get conn, issue_path(conn, :new)
    assert html_response(conn, 200) =~ "New Issue"
  end

  test "creates issue and redirects to show when data is valid", %{conn: conn} do
    conn = post conn, issue_path(conn, :create), issue: @create_attrs

    assert %{id: id} = redirected_params(conn)
    assert redirected_to(conn) == issue_path(conn, :show, id)

    conn = get conn, issue_path(conn, :show, id)
    assert html_response(conn, 200) =~ "Show Issue"
  end

  test "does not create issue and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, issue_path(conn, :create), issue: @invalid_attrs
    assert html_response(conn, 200) =~ "New Issue"
  end

  test "renders form for editing chosen issue", %{conn: conn} do
    issue = fixture(:issue)
    conn = get conn, issue_path(conn, :edit, issue)
    assert html_response(conn, 200) =~ "Edit Issue"
  end

  test "updates chosen issue and redirects when data is valid", %{conn: conn} do
    issue = fixture(:issue)
    conn = put conn, issue_path(conn, :update, issue), issue: @update_attrs
    assert redirected_to(conn) == issue_path(conn, :show, issue)

    conn = get conn, issue_path(conn, :show, issue)
    assert html_response(conn, 200) =~ "some updated name"
  end

  test "does not update chosen issue and renders errors when data is invalid", %{conn: conn} do
    issue = fixture(:issue)
    conn = put conn, issue_path(conn, :update, issue), issue: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit Issue"
  end

  test "deletes chosen issue", %{conn: conn} do
    issue = fixture(:issue)
    conn = delete conn, issue_path(conn, :delete, issue)
    assert redirected_to(conn) == issue_path(conn, :index)
    assert_error_sent 404, fn ->
      get conn, issue_path(conn, :show, issue)
    end
  end
end
