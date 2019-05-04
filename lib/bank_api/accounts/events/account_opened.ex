defmodule BankAPI.Accounts.Events.AccountOpened do
  @moduledoc false
  @derive [Jason.Encoder]

  defstruct [
    :account_uuid,
    :initial_balance
  ]
end
