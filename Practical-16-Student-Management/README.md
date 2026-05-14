PART 1 — Open Salesforce Developer Org
Step 1: Login

Open:

Salesforce Developer Login

Login with your Salesforce account.

PART 2 — Create Custom Object
Step 2: Open Setup
Click ⚙️ (top right)
Click Setup
Step 3: Create Custom Object

Search:

“Objects”

Open:

Object Manager

Now:

Click Create
Select Custom Object

Fill:

Field	Value
Label	Student
Plural Label	Students
Object Name	Student
Record Name	Student Name

Then:

Click Save
PART 3 — Create Fields
Step 4: Create Roll Number Field

Inside Student object:

Click Fields & Relationships
Click New

Select:

Text

Next.

Fill:

Field Label → Roll No
Length → 20

Save.

Step 5: Create Class Field

Again click New.

Select:

Text

Fill:

Label → Class
Length → 20

Save.

Step 6: Create Mobile Number Field

Again click New.

Select:

Phone

Fill:

Label → Mobile No

Save.

PART 4 — Create Apex Controller
Step 7: Open Apex Classes

In Setup search:

Apex Classes

Click:

New

Delete old code.

Paste this code:

public class StudentController {

    public Student__c stu {get; set;}

    public StudentController() {
        stu = new Student__c();
    }

    public void saveStudent() {
        insert stu;
        stu = new Student__c();
    }

    public List<Student__c> getStudents() {
        return [SELECT Name, Roll_No__c, Class__c, Mobile_No__c 
                FROM Student__c];
    }
}

Click:

Save
PART 5 — Create Visualforce Page
Step 8: Open Visualforce Pages

Search:

Visualforce Pages

Click:

New

Page Name:

StudentPage

Paste code:

<apex:page controller="StudentController">

    <apex:form >

        <h1>Student Record Management</h1>

        <apex:pageBlock title="Add Student">

            <apex:pageBlockSection columns="1">

                <apex:inputField value="{!stu.Name}"/>

                <apex:inputField value="{!stu.Roll_No__c}"/>

                <apex:inputField value="{!stu.Class__c}"/>

                <apex:inputField value="{!stu.Mobile_No__c}"/>

            </apex:pageBlockSection>

            <apex:commandButton value="Save" action="{!saveStudent}"/>

        </apex:pageBlock>

        <apex:pageBlock title="Student Records">

            <apex:pageBlockTable value="{!students}" var="s">

                <apex:column value="{!s.Name}"/>
                <apex:column value="{!s.Roll_No__c}"/>
                <apex:column value="{!s.Class__c}"/>
                <apex:column value="{!s.Mobile_No__c}"/>

            </apex:pageBlockTable>

        </apex:pageBlock>

    </apex:form>

</apex:page>

Click:

Save
PART 6 — Run Practical
Step 9: Run Visualforce Page

After saving:

Click Preview

OR

Open URL:

/apex/StudentPage
PART 7 — Test
Step 10: Enter Data

Fill:

Student Name
Roll No
Class
Mobile No

Click:

Save

Record will display below in table.
