PART 1 — Open Developer Console
Step 1

Top right:

⚙️ → Developer Console
PART 2 — Open Execute Anonymous Window
Step 2

Inside Developer Console:

Debug → Open Execute Anonymous Window

Shortcut:

Ctrl + E
PART 3 — Send Simple Email
Step 3

Paste this code.

⚠️ Replace email with your own Gmail.

Messaging.SingleEmailMessage mail =
new Messaging.SingleEmailMessage();

mail.setToAddresses(
    new String[]
    {
        'yourgmail@gmail.com'
    }
);

mail.setSubject(
    'Salesforce Email Notification'
);

mail.setPlainTextBody(
    'Hello, this email is sent using Apex Console Program.'
);

Messaging.sendEmail(
    new Messaging.SingleEmailMessage[]
    {
        mail
    }
);

System.debug(
    'Email Sent Successfully'
);
PART 4 — Execute

Click:

Execute
PART 5 — Check Output
Step 5

Open:

Logs

Double click latest log.

Search:

USER_DEBUG

You will see:

Email Sent Successfully
PART 6 — Check Gmail Inbox

Open your Gmail.

You should receive:

Salesforce Email Notification
WITH ATTACHMENT VERSION

If teacher asks:

with attachment

use this code.

Send Email With Attachment
Messaging.EmailFileAttachment attach =
new Messaging.EmailFileAttachment();

attach.setFileName('demo.txt');

attach.setBody(
Blob.valueOf(
'This is attachment from Salesforce'
)
);

Messaging.SingleEmailMessage mail =
new Messaging.SingleEmailMessage();

mail.setToAddresses(
new String[]
{
    'yourgmail@gmail.com'
}
);

mail.setSubject(
'Email With Attachment'
);

mail.setPlainTextBody(
'Attachment Added Successfully'
);

mail.setFileAttachments(
new Messaging.EmailFileAttachment[]
{
    attach
}
);

Messaging.sendEmail(
new Messaging.SingleEmailMessage[]
{
    mail
}
);

System.debug(
'Email With Attachment Sent'
);

Execute.

Viva Questions
What is Messaging.SingleEmailMessage?

Used to create email object in Apex.

What is setToAddresses()?

Defines receiver email.

What is setSubject()?

Defines subject line.

What is setPlainTextBody()?

Defines email message body.

What is Messaging.sendEmail()?

Sends email from Salesforce.








Step 1 — Open Deliverability Settings

In Setup search:

Deliverability

Click:

Deliverability
Step 2 — Change Access Level

Find:

Access Level

Change it to:

All Email

Click:

Save
