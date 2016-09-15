defmodule TexasApplication.PageController do
  use TexasApplication.Web, :controller
  alias TexasApplication.PageView

  def index(conn, _params) do
    render conn, "index.html", data: PageView.data
  end

  def add_message(conn, %{"message" => message} = params) do
    Chat.add_message message
    redirect conn, to: "/"
  end
end
