Practical 18 — Bank Account System (Console Based Salesforce)

You need to create:

Custom Object → Bank Account
Fields
Console-based CRUD operations using Apex

We will use:

Developer Console
PART 1 — Create Custom Object
Step 1

Open:

Setup → Object Manager
Step 2

Click:

Create → Custom Object

Fill:

Field	Value
Label	Bank Account
Plural Label	Bank Accounts
Object Name	Bank_Account

Click:

Save
PART 2 — Create Fields

Open:

Bank Account → Fields & Relationships

Create these fields.

Field 1 — Customer ID
Option	Value
Type	Text
Label	Customer ID
Length	20

Save.

Field 2 — Email
Option	Value
Type	Email
Label	Email

Save.

Field 3 — Birth Date
Option	Value
Type	Date
Label	Birth Date

Save.

Field 4 — Department
Option	Value
Type	Text
Label	Department
Length	30

Save.

PART 3 — Check API Names

After creating fields, check API names.

They may become:

Label	API Name
Customer ID	Customer_ID__c
Email	Email__c
Birth Date	Birth_Date__c
Department	Department__c

Object name:

Bank_Account__c
PART 4 — Open Developer Console
Step 4

Top right:

⚙️ → Developer Console
PART 5 — Open Execute Anonymous
Step 5

Inside Developer Console:

Debug → Open Execute Anonymous Window

Shortcut:

Ctrl + E
PART 6 — INSERT RECORD
Bank_Account__c acc = new Bank_Account__c();

acc.Name = 'Rohit';

acc.Customer_ID__c = 'C101';

acc.Email__c = 'rohit@gmail.com';

acc.Birth_Date__c = Date.newInstance(2001,4,15);

acc.Department__c = 'Finance';

insert acc;

System.debug('Bank Account Record Inserted');

Click:

Execute
PART 7 — DISPLAY RECORDS
List<Bank_Account__c> accList =
[
    SELECT Name,
           Customer_ID__c,
           Email__c,
           Birth_Date__c,
           Department__c
    FROM Bank_Account__c
];

for(Bank_Account__c a : accList)
{
    System.debug(
        a.Name + ' | ' +
        a.Customer_ID__c + ' | ' +
        a.Email__c + ' | ' +
        a.Birth_Date__c + ' | ' +
        a.Department__c
    );
}
PART 8 — UPDATE RECORD
Bank_Account__c acc =
[
    SELECT Id, Name
    FROM Bank_Account__c
    LIMIT 1
];

acc.Name = 'Aman';

update acc;

System.debug('Bank Account Updated');

PART 9 — DELETE RECORD
Bank_Account__c acc =
[
    SELECT Id
    FROM Bank_Account__c
    LIMIT 1
];

delete acc;

System.debug('Bank Account Deleted');


PART 10 — SEARCH RECORD
List<Bank_Account__c> accList =
[
    SELECT Name,
           Department__c
    FROM Bank_Account__c
    WHERE Department__c = 'Finance'
];

for(Bank_Account__c a : accList)
{
    System.debug(
        a.Name + ' - ' +
        a.Department__c
    );
}


PART 11 — COUNT RECORDS
Integer totalAccounts =
[
    SELECT Count()
    FROM Bank_Account__c
];

System.debug(
    'Total Accounts = ' +
    totalAccounts
);
How To View Output

After Execute:

Open:
Logs
Double click latest log
Search:
USER_DEBUG

You will see output.
