require 'mqtt'
require 'dotenv/load'

client = MQTT::Client.connect(
  :host => '192.168.1.42',
  :port => 1883,
  :username => ENV['USERNAME'],
  :password => ENV['PASSWORD'],
  :username => 'mosquitto',
  :password => 'hjojtT9f8hWB37vJOs8=',
)

client.connect do |client|
  client.get('#') do |topic,message|
    if topic == 'polly' && message == 'poweroff'
      system('poweroff')
    end
  end
end
