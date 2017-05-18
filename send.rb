require 'bunny'

connection = Bunny.new
connection.start

channel = connection.create_channel
queue   = channel.queue('hello')

message = "Hello, my little rabbit!"

channel.default_exchange.publish(message, :routing_key => queue.name)
puts " [x] Sent '#{message}'."

connection.close
