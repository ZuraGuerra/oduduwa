ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Oduduwa.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Oduduwa.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Oduduwa.Repo)

