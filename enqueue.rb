require 'iron_worker_ng'
client = IronWorkerNG::Client.new()
client.tasks.create(
    'email',
    {
        host: "smtp.sendgrid.net",
        domain: "MY DOMAIN eg: yahoo.com",
        port: 587,
        username: "MY USERNAME",
        password: "MY PASSWORD",
        from: "MY EMAIL",
        to: "EMAIL TO SEND TO",
        subject: "SUBJECT",
        body: "BODY"
    }
)
