# This worker requires the following parameters:
# username, password, domain, host, port, from, to, subject, body

require 'mail'

p params

# Configures smtp settings to send email.
def init_mail(params)
  username = params['username']
  password = params['password']
  domain = params['domain']
  host = params['host']
  port = params['port']

  puts "Preparing mail configuration"
  mail_conf = {:address => host,
               :port => port,
               :domain => domain, #custom domain
               :user_name => username,
               :password => password,
               :authentication => 'plain',
               :enable_starttls_auto => true} #gmail require this option
  Mail.defaults do
    delivery_method :smtp, mail_conf
  end
  puts "Mail service configured"
end

def send_mail(to, from, subject, content)
  puts "Preparing email from: #{from}, to: #{to}, subject: #{subject}, body: #{content}"
  msg = Mail.new do
    to to
    from from
    subject subject
    html_part do |m|
      content_type 'text/html'
      body content
    end
  end
  puts "Mail ready, delivering"
  details = msg.deliver
  puts "Mail delivered!"
  details
end

# Sample worker that sends an email.
puts "Worker started"

init_mail(params)

to = params['to']
unless to.is_a?(Array)
  to = [to]
end

to.each do |email|
  message_details = send_mail(email, params['from'], params['subject'], params['body'])
  puts "message_details: " + message_details.inspect
end

puts "Worker finished"
