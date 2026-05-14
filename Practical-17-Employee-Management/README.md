PART 1 — Create Employee Object
Step 1

Open:

Setup → Object Manager
Step 2

Click:

Create → Custom Object

Fill:

Field	Value
Label	Employee
Plural Label	Employees
Object Name	Employee

Click:

Save
PART 2 — Create Fields
Step 3

Open:

Employee → Fields & Relationships

Create these fields one by one.

Field 1 — Emp ID
Option	Value
Data Type	Text
Field Label	Emp ID
Length	20

Save.

Field 2 — Email
Option	Value
Data Type	Email
Field Label	Email

Save.

Field 3 — Birth Date
Option	Value
Data Type	Date
Field Label	Birth Date

Save.

Field 4 — Department
Option	Value
Data Type	Text
Field Label	Department
Length	30

Save.

PART 3 — Check API Names

After creating fields, open:

Fields & Relationships

Check actual API names.

They may look like:

Label	API Name
Emp ID	Emp_ID__c
Email	Email__c
Birth Date	Birth_Date__c
Department	Department__c
PART 4 — Open Developer Console
Step 4

Top right:

⚙️ → Developer Console

Wait for new window.

PART 5 — Execute Anonymous Window
Step 5

Inside Developer Console:

Debug → Open Execute Anonymous Window

Shortcut:

Ctrl + E








1. Insert Employee Record

Open:

Developer Console → Debug → Open Execute Anonymous Window

Paste:

Employee__c emp = new Employee__c();

emp.Name = 'Rahul';

emp.Emp_ID__c = 'E101';

emp.Email__c = 'rahul@gmail.com';

emp.Birth_Date__c = Date.newInstance(2002,5,10);

emp.Department__c = 'IT';

insert emp;

System.debug('Employee Inserted Successfully');

Click:

Execute
2. Display Employee Records
List<Employee__c> empList =
[
    SELECT Name,
           Emp_ID__c,
           Email__c,
           Birth_Date__c,
           Department__c
    FROM Employee__c
];

for(Employee__c e : empList)
{
    System.debug(
        e.Name + ' | ' +
        e.Emp_ID__c + ' | ' +
        e.Email__c + ' | ' +
        e.Birth_Date__c + ' | ' +
        e.Department__c
    );
}

Execute.

3. Update Employee
Employee__c emp =
[
    SELECT Id, Name
    FROM Employee__c
    LIMIT 1
];

emp.Name = 'Amit';

update emp;

System.debug('Employee Updated Successfully');
4. Delete Employee
Employee__c emp =
[
    SELECT Id
    FROM Employee__c
    LIMIT 1
];

delete emp;

System.debug('Employee Deleted Successfully');

5. Search Employee
List<Employee__c> empList =
[
    SELECT Name,
           Department__c
    FROM Employee__c
    WHERE Department__c = 'IT'
];

for(Employee__c e : empList)
{
    System.debug(e.Name);
}

5. SEARCH EMPLOYEE BY DEPARTMENT
List<Employee__c> empList =
[
    SELECT Name,
           Department__c
    FROM Employee__c
    WHERE Department__c = 'IT'
];

for(Employee__c e : empList)
{
    System.debug(
        e.Name + ' - ' +
        e.Department__c
    );
}
6. COUNT TOTAL EMPLOYEES
Integer totalEmployees =
[
    SELECT Count()
    FROM Employee__c
];

System.debug(
    'Total Employees = ' +
    totalEmployees
);
7. DISPLAY ONLY NAMES
List<Employee__c> empList =
[
    SELECT Name
    FROM Employee__c
];

for(Employee__c e : empList)
{
    System.debug(e.Name);
}

