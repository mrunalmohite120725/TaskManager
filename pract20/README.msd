Practical 20 — Employee Management Lightning Application (WITHOUT LWC & VS Code)

We will do everything directly inside Salesforce using:

Custom Object
Fields
Validation Rules
Lightning App

No coding required.

WHAT YOU WILL CREATE
Object
Employee
Fields
Employee Name
Employee ID
Salary
Email
Department
Joining Date
Validations
Name minimum 3 characters
Employee ID > 0 and unique
Salary range
Email validation
Department required
Joining date not future
Lightning App
Employee Management App
STEP 1 — Login Salesforce

Open:

Salesforce Login

Login.

STEP 2 — Open Setup

Click:

⚙️ → Setup
STEP 3 — Create Employee Object

Go to:

Object Manager

Click:

Create → Custom Object

Fill:

Field	Value
Label	Employee
Plural Label	Employees

Keep default options checked.

Click:

Save
STEP 4 — Create Employee Fields

Go to:

Employee → Fields & Relationships → New

Create all fields below.

FIELD 1 — Employee ID

Type:

Number

Fill:

Property	Value
Field Label	Employee ID
Decimal Places	0

Check:

Unique

Save.

FIELD 2 — Salary

Type:

Currency

Field Label:

Salary

Save.

FIELD 3 — Email

Type:

Email

Field Label:

Email

Save.

FIELD 4 — Department

Type:

Picklist

Field Label:

Department

Values:

HR
IT
Sales
Marketing
Finance

Check:

Required

Save.

FIELD 5 — Joining Date

Type:

Date

Field Label:

Joining Date

Save.

STEP 5 — Employee Validation Rules

Go to:

Validation Rules → New
Validation 1 — Employee Name Minimum 3 Characters

Rule Name:

NameValidation

Formula:

LEN(Name) < 3

Error Message:

Employee name must contain at least 3 characters

Save.

Validation 2 — Employee ID Greater Than 0

Click New.

Rule Name:

EmployeeIDValidation

Formula:

Employee_ID__c <= 0

Error Message:

Employee ID must be greater than 0

Save.

Validation 3 — Salary Between 10000 and 500000

Click New.

Rule Name:

SalaryValidation

Formula:

OR(
Salary__c < 10000,
Salary__c > 500000
)

Error Message:

Salary must be between 10000 and 500000

Save.

Validation 4 — Joining Date Not Future

Click New.

Rule Name:

JoiningDateValidation

Formula:

Joining_Date__c > TODAY()

Error Message:

Joining date cannot be future date

Save.

STEP 6 — Email Validation

No extra validation needed.

Because field type is:

Email

Salesforce automatically checks valid email format.

STEP 7 — Create Lightning App

Go to:

Setup → App Manager

Click:

New Lightning App
STEP 8 — Configure App

App Name:

Employee Management

Next → Next → Next.

STEP 9 — Add Navigation Items

Move:

Employee

to Selected Items.

Next.

STEP 10 — Assign Profiles

Check:

System Administrator

Save & Finish.

STEP 11 — Open App

Click:

App Launcher (9 dots)

Search:

Employee Management

Open it.
