public class StudentController {

    public studen__c stu {get; set;}

    public StudentController() {

        stu = new studen__c();
    }

    // Insert Student
    public void saveStudent() {

        insert stu;

        stu = new studen__c();
    }

    // Display Students
    public List<studen__c> getStudents() {

        return [SELECT Id, Name, roll__c, class__c, Mobile_no__c
                FROM studen__c];
    }

    // Delete Student
    public void deleteStudent() {

        String studentId = ApexPages.currentPage()
                        .getParameters()
                        .get('delId');

        studen__c s = [SELECT Id FROM studen__c
                       WHERE Id = :studentId];

        delete s;
    }
}
