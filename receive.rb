require 'bunny'

connection = Bunny.new
connection.start

channel = connection.create_channel
queue   = channel.queue('hello')

begin
  puts " [*] Waiting for messages in #{queue.name}. Press CTRL+C to exit."

  queue.subscribe(:block => true) do |delivery_info, properties, body|
    puts " [x] Received #{body}"
  end

rescue Interrupt => _
  connection.close

  exit(0)
end
