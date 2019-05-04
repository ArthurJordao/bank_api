defmodule BankAPI.ProjectorCase do
  @moduledoc false
  use ExUnit.CaseTemplate

  alias BankAPI.Test.ProjectorUtils

  using do
    quote do
      alias BankAPI.Repo

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
      import BankAPI.DataCase

      import ProjectorUtils
    end
  end

  setup _tags do
    :ok = ProjectorUtils.truncate_database()

    :ok
  end
end
