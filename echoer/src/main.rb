#!/usr/bin/env ruby
require 'bunny'
require 'pg'

def send(message)
  broker_connection = Bunny.new(hostname: ENV['BROKER_HOSTNAME'] || 'localhost')

  attempts = 0
  begin
    broker_connection.start
  rescue Bunny::TCPConnectionFailed
    $stdout.flush
    sleep(2**attempts)
    retry if (attempts += 1) < 6
    raise IOError("Unable to connect")
  end

  channel = broker_connection.create_channel
  queue = channel.queue('hello')
  channel.default_exchange.publish('Hello World!', routing_key: queue.name)
  puts " [x] Sent 'Hello World!'"

  broker_connection.close
end

def receive
  broker_connection = Bunny.new(hostname: ENV['BROKER_HOSTNAME'] || 'localhost')
  broker_connection.start

  channel = broker_connection.create_channel
  queue = channel.queue('hello')
  puts ' [*] Waiting for message.'
  queue.subscribe(block: true) do |_delivery_info, _properties, body|
    puts " [x] Received message: #{body}"
    write_to_db(body)
    broker_connection.close
  end
end

def write_to_db(message)
  db_connection = PG.connect(:host => ENV['DB_HOSTNAME'] || 'localhost', :user => 'postgres', :password => ENV['DB_PASSWORD'] || 'password')
  db_connection.exec('CREATE TABLE received(body TEXT);')
  db_connection.exec("INSERT INTO received VALUES('#{message}');")

  db_connection.close

  puts " [x] Wrote to db: #{message}"
end

if __FILE__ == $0
  puts 'starting'
  send 'hello bunny'
  receive
end