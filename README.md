email_worker
============

Sends an email via your favorite email/smtp service, ie: Sengrid.

## Quick Start

First off, you need an [Iron.io](http://www.iron.io) account, if you don't have one go sign up for a free account.

Second, you need to have your [iron.json file setup](http://dev.iron.io/worker/reference/configuration/).

Now you can get cracking!

### 1. Add this worker to your account

First install the iron_worker_ng gem:

```
$ gem install iron_worker_ng
```

From the command line:

```
$ iron_worker upload https://github.com/treeder/email_worker/blob/master/email.worker
```

### 2. Start using it!

You can queue up tasks for it in any language. Check out our [Client Libraries](http://dev.iron.io/worker/)
in the language of your choice to make it easy, but here's an example using curl:

```
$ curl -d '{"tasks": [{"code_name": "email", "payload": "{ \"host\": \"smtp.sendgrid.net\", \"domain\": \"MY DOMAIN eg: iron.io\",
\"port\": 587,
\"username\": \"MY USERNAME\",
\"password\": \"MY PASSWORD\",
\"from\": \"MY EMAIL\",
\"to\": \"MY EMAIL\",
\"subject\": \"SUBJECT\",
\"body\": \"BODY\"
}"}]}' --header "Authorization: OAuth YOUR_TOKEN" --header "Content-Type: application/json" https://worker-aws-us-east-1.iron.io/2/projects/YOUR_PROJECT_ID/tasks
```

Now go look at [HUD](http://hud.iron.io) to see the task and the log.

And here's how to queue up tasks using Ruby (from enqueue.rb):

```ruby
require 'iron_worker_ng'
client = IronWorkerNG::Client.new()
client.tasks.create(
    'email', {
        host: "smtp.sendgrid.net",
        domain: "MY DOMAIN eg: iron.io",
        port: 587,
        username: "MY USERNAME",
        password: "MY PASSWORD",
        from: "MY EMAIL",
        to: "EMAIL TO SEND TO",
        subject: "SUBJECT",
        body: "BODY"
    }
)
```

For clients in other languages, see the [Iron.io Dev Center](http://dev.iron.io).
