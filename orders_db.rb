# frozen_string_literal: true

require "bundler"
Bundler.require(:default)

DB_CONFIG = {
  adapter: "postgresql",
  host: ENV.fetch("DB_HOST", "127.0.0.1"),
  port: ENV.fetch("DB_PORT", "5432"),
  pool: ENV.fetch("DB_POOL", "5"),
  username: ENV.fetch("DB_USERNAME", "alex"),
  password: ENV.fetch("DB_PASSWORD", ""),
  database: ENV.fetch("DB_DATABASE", "helsifit_orders_dev")
}.freeze
Sequel::Model.db = DB = Sequel.connect(DB_CONFIG)

class Order < Sequel::Model; end
class LineItem < Sequel::Model; end

puts "Orders count: #{Order.count}"
puts "LineItems count: #{LineItem.count}"
