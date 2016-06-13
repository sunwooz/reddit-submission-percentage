require 'redd'

client_id = 'reddit-client-id'

client_secret = 'reddit-client-secret'

username = 'reddit-username'
password = 'reddit-password'
your_sites = ['yourwebsite.io', 'yourwebsite.com']

r = Redd.it(:script, client_id, client_secret, username, password, user_agent: "Tesasdgaot v1.0.0")
r.authorize!

submissions = r.me.get_submitted

only_links = submissions.select do |submission|
  !submission[:domain].include?('self')
end

submitted_size = only_links.size

my_links = only_links.select do |link|
  your_sites.include?(link[:domain])
end

my_links_size = my_links.size

percentage = (my_links_size.to_f / submitted_size.to_f) * 100.0

puts "#{percentage}% of your submissions link to your own content (#{my_links_size}/#{submitted_size})"

