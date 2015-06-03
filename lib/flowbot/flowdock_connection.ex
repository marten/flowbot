defmodule Flowbot.FlowdockConnection do
  use GenServer

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    {:ok, organization} = Application.fetch_env(:flowdock, :organization)
    {:ok, flow}         = Application.fetch_env(:flowdock, :flow)
    {:ok, username}     = Application.fetch_env(:flowdock, :username)
    {:ok, password}     = Application.fetch_env(:flowdock, :password)

    {:ok, pid} = :eflowdock_sup.start_flowdock_client(self, organization, flow, username, password)
    {:ok, pid}
  end

  def handle_call(_Request, _From, State) do
    {:reply, :ignored, State}
  end

  def handle_cast(_Msg, State) do
    {:noreply, State}
  end

  def handle_info({:incoming_message, "ping"}, pid) do
    IO.inspect("Got Ping")
    GenServer.cast pid, {:send_message, "Bot", "PONG"}
    {:noreply, pid}
  end


  def handle_info(info, pid) do
    IO.inspect(info)
    {:noreply, pid}
  end
end
