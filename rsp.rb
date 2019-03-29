require 'redd'

#CHANGE THESE FIELDS
client_id = '****'
client_secret = '****'
username = '****'
password = '****'
your_sites = ['remotecorgi.com', 'sunwoo.io', 'sunwooyang.com', 'vrmachine.io']
#CHANGE THESE FIELDS

#DONT TOUCH ANYTHING BEYOND THIS
session = Redd.it(
    user_agent: 'Tesasdgaot v1.0.0"',
    client_id:  client_id,
    secret:     client_secret,
    username:   username,
    password:   password
)
submissions = session.me.listing(:submitted, { limit: 100000 })

submitted_size = submissions.to_a.size

my_links = submissions.collect do |submission|
    return_item = nil
    if your_sites.include?(submission.domain)
        return_item = submission
    end
    return_item
end

my_links_size = my_links.compact.size

percentage = (my_links_size.to_f / submitted_size.to_f) * 100.0

puts "#{percentage}% of your submissions link to your own content (#{my_links_size}/#{submitted_size})"
