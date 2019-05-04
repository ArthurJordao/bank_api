defmodule BankAPI.Accounts.Commands.OpenAccount do
  @moduledoc false
  @enforce_keys [:account_uuid]

  @uuid_regex ~r/[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/

  defstruct [:account_uuid, :initial_balance]

  def valid?(command) do
    Skooma.valid?(Map.from_struct(command), schema())
  end

  defp schema do
    %{
      account_uuid: [:string, Skooma.Validators.regex(@uuid_regex)],
      initial_balance: [:int, &positive_integer(&1)]
    }
  end

  def positive_integer(data) do
    if is_integer(data) do
      if data > 0 do
        :ok
      else
        {:error, "Argument must be bigger than zero"}
      end
    else
      {:error, "Argument must be an integer"}
    end
  end
end
