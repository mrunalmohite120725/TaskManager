Practical 23 Using ONLY Lightning App (No LWC, No VS Code)

This is the easiest and fastest method.

You will do everything directly inside Salesforce.

WHAT YOU WILL CREATE

You will create:

Objects
Student
Faculty
Validations

For:

Marks
Roll number
Salary
Faculty ID
Joining date
Name validations
Lightning App
College Management App

No coding required.

STEP 1 — Login Salesforce

Open:

Salesforce Login

Login.

STEP 2 — Open Setup

Click:

⚙️ → Setup
STEP 3 — Create Student Object

Go to:

Object Manager

Click:

Create → Custom Object

Fill:

Field	Value
Label	Student
Plural Label	Students

Click:

Save
STEP 4 — Create Student Fields

Go to:

Student → Fields & Relationships → New
FIELD 1 — Roll Number

Type:

Number

Fill:

Property	Value
Field Label	Roll Number
Decimal Places	0

Save.

FIELD 2 — Marks

Type:

Number

Field Label:

Marks

Save.

FIELD 3 — Email

Type:

Email

Field Label:

Email

Save.

STEP 5 — Student Validation Rules

Go to:

Validation Rules → New
Validation 1 — Marks Between 0 and 100

Rule Name:

MarksValidation

Formula:

OR(
Marks__c < 0,
Marks__c > 100
)

Error Message:

Marks should be between 0 and 100

Save.

Validation 2 — Roll Number Greater Than 0

Click New.

Rule Name:

RollValidation

Formula:

Roll_Number__c <= 0

Error Message:

Roll number must be greater than 0

Save.

Validation 3 — Student Name Cannot Be Blank

Rule Name:

StudentNameValidation

Formula:

ISBLANK(Name)

Error Message:

Student name cannot be blank

Save.

STEP 6 — Create Faculty Object

Go to:

Object Manager → Create → Custom Object

Fill:

Field	Value
Label	Faculty
Plural Label	Faculties

Save.

STEP 7 — Create Faculty Fields

Go to:

Faculty → Fields & Relationships → New
FIELD 1 — Faculty ID

Type:

Number

Field Label:

Faculty ID

Check:

Unique

Save.

FIELD 2 — Salary

Type:

Currency

Field Label:

Salary

Save.

FIELD 3 — Department

Type:

Picklist

Values:

Computer
IT
ENTC
Mechanical
Civil

Check:

Required

Save.

FIELD 4 — Joining Date

Type:

Date

Save.

STEP 8 — Faculty Validation Rules

Go to:

Validation Rules → New
Validation 1 — Faculty Name Minimum 3 Characters

Rule Name:

FacultyNameValidation

Formula:

LEN(Name) < 3

Error Message:

Faculty name must contain at least 3 characters

Save.

Validation 2 — Faculty ID Greater Than 0

Rule Name:

FacultyIDValidation

Formula:

Faculty_ID__c <= 0

Error Message:

Faculty ID must be greater than 0

Save.

Validation 3 — Salary Between 10000 and 500000

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

Rule Name:

JoiningDateValidation

Formula:

Joining_Date__c > TODAY()

Error Message:

Joining date cannot be future date

Save.

STEP 9 — Create Lightning App

Go to:

Setup → App Manager

Click:

New Lightning App
STEP 10 — Configure App

App Name:

College Management

Next → Next → Next.

STEP 11 — Add Navigation Items

Add:

Student
Faculty

Move them to Selected Items.

Next → Save & Finish.

STEP 12 — Open App

Click:

App Launcher

Search:

College Management

Open it.

Now:

Create Student records
Create Faculty records
Validations work automatically
Viva Explanation

You can say:

"I created Student and Faculty custom objects in Salesforce and implemented validations using Validation Rules, required fields, unique fields, and datatype validations. Then I created a Lightning App called College Management to manage records."

what if we diidnt find app we need to do something in admisnstrtaor na

Yes. After creating the Lightning App, sometimes it does not appear immediately in App Launcher because you must assign visibility/access.

Do these steps.

If Lightning App Is Not Visible

Go to:

Setup → App Manager

Find:

College Management

Click dropdown arrow on right side.

Click:

Edit
STEP 1 — Utility Items

Keep default.

Click:

Next
STEP 2 — Navigation Items

Move these to Selected:

Student
Faculty

Click:

Next
STEP 3 — User Profiles (IMPORTANT)

Here many students miss the step.

Check:

System Administrator

This gives access to your profile.

Click:

Save & Finish
STEP 4 — Open App Launcher

Click:

9-dot App Launcher

Search:

College Management

Now app appears.

If Still Not Visible

Refresh browser once.

OR logout/login again.

Another Important Thing

While creating object:

Ensure:

Allow Reports
Allow Activities
Launch New Custom Tab Wizard

are checked.

Otherwise object tabs may not appear in app.

If Student/Faculty Tabs Missing

Go to:

Setup → Tabs

Create:

Student Tab
Faculty Tab

Then again edit Lightning App and add those tabs.
