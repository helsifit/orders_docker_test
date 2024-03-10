# frozen_string_literal: true

Pry.config.hooks.add_hook(:when_started, :load_app) do
  load "orders_db.rb"
end
