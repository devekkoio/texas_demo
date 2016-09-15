defmodule Chat do
  def start_link do
    Agent.start_link(fn -> [] end, name: __MODULE__)
  end

  def add_message(message) do
    Agent.update(__MODULE__, &(List.insert_at(&1, -1, message)))
  end

  def get_messages(room\\:room_1) do
    Agent.get(__MODULE__, &(&1))
  end
end
