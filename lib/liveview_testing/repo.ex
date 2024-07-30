defmodule LiveviewTesting.Repo do
  use Ecto.Repo,
    otp_app: :liveview_testing,
    adapter: Ecto.Adapters.MyXQL
end
