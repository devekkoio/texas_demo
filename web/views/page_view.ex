defmodule TexasApplication.PageView do
  use TexasApplication.Web, :view
  import Chat
  alias Texas.BoilerplateWriter, as: Writer

  Writer.metadata("chat", ["message_form"])

  def data, do: %{chat: chat_children}
  defp chat_children, do: %{messages: messages_children, message_form: form_children}
  defp messages_children, do: Chat.get_messages
  defp form_children, do: {form_input, [action: "/add_message", method: "post"]}
  defp form_input, do: %{ message_input: [type: "text", name: "message", placeholder: "Enter a message"],
                          csrf: [type: "hidden", name: "_csrf_token", value: Phoenix.Controller.get_csrf_token]
                        }
end
