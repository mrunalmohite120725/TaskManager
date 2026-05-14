Practical 22 — Email Notification System Using Visualforce

You need:

Apex Controller
Visualforce Frontend
Email Validation
Send Email using Messaging class

Features:

Enter recipient email
Enter subject
Enter message
Send email
Show error on invalid email
PART 1 — Create Apex Class
Step 1

Open:

Setup → Apex Classes

Click:

New
EmailController.cls

Paste this code.

public class EmailController {

    public String toEmail {get; set;}

    public String subject {get; set;}

    public String body {get; set;}

    // Send Email

    public PageReference sendMail() {

        // Email Validation

        if(toEmail == null ||
           !toEmail.contains('@'))
        {
            ApexPages.addMessage(
            new ApexPages.Message(
            ApexPages.Severity.ERROR,
            'Invalid Email Address'
            ));

            return null;
        }

        // Create Mail

        Messaging.SingleEmailMessage mail =
        new Messaging.SingleEmailMessage();

        mail.setToAddresses(
        new String[]
        {
            toEmail
        });

        mail.setSubject(subject);

        mail.setPlainTextBody(body);

        Messaging.sendEmail(
        new Messaging.SingleEmailMessage[]
        {
            mail
        });

        ApexPages.addMessage(
        new ApexPages.Message(
        ApexPages.Severity.CONFIRM,
        'Email Sent Successfully'
        ));

        return null;
    }
}

Save.

Class Name:

EmailController
PART 2 — Create Visualforce Page
Step 2

Search:

Visualforce Pages

Click:

New

Page Name:

EmailPage
EmailPage.page

Paste this code.

<apex:page controller="EmailController">

    <style>

        body{
            font-family: Arial;
            background:#f4f6f9;
        }

        .mainBox{
            width:50%;
            margin:auto;
            margin-top:40px;
            background:white;
            padding:25px;
            border-radius:10px;
            box-shadow:0px 0px 10px gray;
        }

        .title{
            text-align:center;
            font-size:28px;
            color:#2e6da4;
            margin-bottom:20px;
        }

    </style>

    <div class="mainBox">

        <div class="title">
            Email Notification System
        </div>

        <apex:form>

            <apex:pageMessages/>

            <apex:pageBlock title="Send Email">

                <apex:pageBlockSection columns="1">

                    <apex:inputText
                        value="{!toEmail}"
                        label="Recipient Email"/>

                    <apex:inputText
                        value="{!subject}"
                        label="Subject"/>

                    <apex:inputTextarea
                        value="{!body}"
                        label="Message Body"/>

                </apex:pageBlockSection>

                <apex:commandButton
                    value="Send Email"
                    action="{!sendMail}"/>

            </apex:pageBlock>

        </apex:form>

    </div>

</apex:page>

Save.

PART 3 — Enable Email Deliverability
Step 3

Search in Setup:

Deliverability

Open:

Deliverability

Set:

Access Level → All Email

Save.

PART 4 — Run Project
Step 4

Click:

Preview

OR open:

/apex/EmailPage
PART 5 — Test Valid Email

Enter:

Recipient Email
Subject
Message

Click:

Send Email

Message shown:

Email Sent Successfully
PART 6 — Test Invalid Email

Enter:

abc123

Click Send.

You will get:

Invalid Email Address
