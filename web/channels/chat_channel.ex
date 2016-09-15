defmodule TexasApplication.ChatChannel do
  use TexasApplication.Web, :channel
  alias TexasApplication.PageView

  def join("prop:message_form", payload, socket) do
    {:ok, socket}
  end

  def handle_in("prop:message_form", payload = %{"query" => params}, socket) do
    %{"message" => message} = URI.decode_query(params)
    Chat.add_message(message)
    html = Phoenix.View.render_to_string(PageView, "index.html", data: PageView.data)
    broadcast! socket, "prop:message_form", %{message: html}
    {:reply, {:ok, payload}, socket}
  end
end
