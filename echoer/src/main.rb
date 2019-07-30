#!/usr/bin/env ruby
require 'bunny'

def send(message)
  connection = Bunny.new(hostname: ENV['BROKER_HOSTNAME'] || 'localhost')

  attempts = 0
  begin
    connection.start
  rescue Bunny::TCPConnectionFailed
    $stdout.flush
    sleep(2**attempts)
    retry if (attempts += 1) < 6
    raise IOError("Unable to connect")
  end

  channel = connection.create_channel
  queue = channel.queue('hello')
  channel.default_exchange.publish('Hello World!', routing_key: queue.name)
  puts " [x] Sent 'Hello World!'"

  connection.close
end

def receive
  connection = Bunny.new(hostname: ENV['BROKER_HOSTNAME'] || 'localhost')
  connection.start

  channel = connection.create_channel
  queue = channel.queue('hello')
  puts ' [*] Waiting for message.'
  queue.subscribe(block: true) do |_delivery_info, _properties, body|
    puts " [x] Received message: #{body}"
    connection.close
  end
end

if __FILE__ == $0
  puts 'starting'
  send 'hello bunny'
  puts "received: #{receive}"
end