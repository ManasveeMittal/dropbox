from twilio.rest import Client

# Your Account SID from twilio.com/console
account_sid = "AC017ee7915e32ec67fd1a7da37a8db258"
# Your Auth Token from twilio.com/console
auth_token  = "cd5c4494bd7009f504e332b606973338"

client = Client(account_sid, auth_token)

message = client.messages.create(
    to="+919997775373", 
    from_="+19046856850",
    body="Xiaomi invites application for first Mi Home store in UP(West) circle. Contact mi.home@xiaomi.com for details if interested")

print(message.sid)
