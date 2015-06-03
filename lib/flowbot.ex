defmodule Flowbot do
  use Application

  def start(_type, _args) do
    Flowbot.Supervisor.start_link
  end
end
