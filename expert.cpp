#include <iostream>
using namespace std;

class Hospital
{
public:

    // Orthopedic
    void orthopedic()
    {
        char ans;
        int score=0;

        cout<<"\n--- Orthopedic Department ---\n";

        cout<<"Do you have bone pain? (y/n): ";
        cin>>ans;
        if(ans=='y') score+=2;

        cout<<"Do you have joint pain? (y/n): ";
        cin>>ans;
        if(ans=='y') score+=2;

        cout<<"Do you have swelling? (y/n): ";
        cin>>ans;
        if(ans=='y') score+=3;

        cout<<"Do you have fracture history? (y/n): ";
        cin>>ans;
        if(ans=='y') score+=3;

        cout<<"Do you have difficulty walking? (y/n): ";
        cin>>ans;
        if(ans=='y') score+=2;

        cout<<"\nTotal Score = "<<score<<endl;

        if(score<=4)
        {
            cout<<"Disease: Minor Bone Problem\n";
            cout<<"Suggestion: Calcium and Rest\n";
        }

        else if(score<=8)
        {
            cout<<"Disease: Moderate Orthopedic Problem\n";
            cout<<"Suggestion: X-Ray Required\n";
        }

        else
        {
            cout<<"Disease: Severe Bone Disorder\n";
            cout<<"Suggestion: Immediate Orthopedic Consultation\n";
        }
    }

    // Gynecology
    void gynecology()
    {
        char ans;
        int score=0;

        cout<<"\n--- Gynecology Department ---\n";

        cout<<"Do you have irregular periods? (y/n): ";
        cin>>ans;
        if(ans=='y') score+=2;

        cout<<"Do you have stomach pain? (y/n): ";
        cin>>ans;
        if(ans=='y') score+=2;

        cout<<"Are you pregnant? (y/n): ";
        cin>>ans;
        if(ans=='y') score+=3;

        cout<<"Do you feel weakness? (y/n): ";
        cin>>ans;
        if(ans=='y') score+=2;

        cout<<"Do you have dizziness? (y/n): ";
        cin>>ans;
        if(ans=='y') score+=2;

        cout<<"\nTotal Score = "<<score<<endl;

        if(score<=4)
        {
            cout<<"Disease: Minor Health Issue\n";
            cout<<"Suggestion: Regular Checkup\n";
        }

        else if(score<=8)
        {
            cout<<"Disease: Moderate Gynecology Problem\n";
            cout<<"Suggestion: Sonography Required\n";
        }

        else
        {
            cout<<"Disease: Severe Gynecology Condition\n";
            cout<<"Suggestion: Immediate Doctor Consultation\n";
        }
    }

    // Cardiology
    void cardiology()
    {
        char ans;
        int score=0;

        cout<<"\n--- Cardiology Department ---\n";

        cout<<"Do you have chest pain? (y/n): ";
        cin>>ans;
        if(ans=='y') score+=3;

        cout<<"Do you have high BP? (y/n): ";
        cin>>ans;
        if(ans=='y') score+=2;

        cout<<"Do you have breathing problem? (y/n): ";
        cin>>ans;
        if(ans=='y') score+=3;

        cout<<"Do you feel fast heartbeat? (y/n): ";
        cin>>ans;
        if(ans=='y') score+=2;

        cout<<"Do you feel tired frequently? (y/n): ";
        cin>>ans;
        if(ans=='y') score+=2;

        cout<<"\nTotal Score = "<<score<<endl;

        if(score<=4)
        {
            cout<<"Disease: Minor Heart Issue\n";
            cout<<"Suggestion: Exercise Regularly\n";
        }

        else if(score<=8)
        {
            cout<<"Disease: Moderate Cardiac Problem\n";
            cout<<"Suggestion: ECG Required\n";
        }

        else
        {
            cout<<"Disease: Severe Heart Disease\n";
            cout<<"Suggestion: Immediate Hospitalization\n";
        }
    }

    // ENT
    void ent()
    {
        char ans;
        int score=0;

        cout<<"\n--- ENT Department ---\n";

        cout<<"Do you have cough? (y/n): ";
        cin>>ans;
        if(ans=='y') score+=2;

        cout<<"Do you have cold? (y/n): ";
        cin>>ans;
        if(ans=='y') score+=2;

        cout<<"Do you have throat pain? (y/n): ";
        cin>>ans;
        if(ans=='y') score+=2;

        cout<<"Do you have ear pain? (y/n): ";
        cin>>ans;
        if(ans=='y') score+=3;

        cout<<"Do you have fever? (y/n): ";
        cin>>ans;
        if(ans=='y') score+=2;

        cout<<"\nTotal Score = "<<score<<endl;

        if(score<=4)
        {
            cout<<"Disease: Minor ENT Infection\n";
            cout<<"Suggestion: Warm Water and Rest\n";
        }

        else if(score<=8)
        {
            cout<<"Disease: Moderate ENT Problem\n";
            cout<<"Suggestion: ENT Consultation Required\n";
        }

        else
        {
            cout<<"Disease: Severe Infection\n";
            cout<<"Suggestion: Immediate Medical Attention\n";
        }
    }

    // Neurology
    void neurology()
    {
        char ans;
        int score=0;

        cout<<"\n--- Neurology Department ---\n";

        cout<<"Do you have headache? (y/n): ";
        cin>>ans;
        if(ans=='y') score+=2;

        cout<<"Do you feel dizziness? (y/n): ";
        cin>>ans;
        if(ans=='y') score+=2;

        cout<<"Do you have memory loss? (y/n): ";
        cin>>ans;
        if(ans=='y') score+=3;

        cout<<"Do you have seizures? (y/n): ";
        cin>>ans;
        if(ans=='y') score+=3;

        cout<<"Do you feel weakness? (y/n): ";
        cin>>ans;
        if(ans=='y') score+=2;

        cout<<"\nTotal Score = "<<score<<endl;

        if(score<=4)
        {
            cout<<"Disease: Minor Neurological Problem\n";
            cout<<"Suggestion: Proper Sleep and Rest\n";
        }

        else if(score<=8)
        {
            cout<<"Disease: Moderate Neurological Disorder\n";
            cout<<"Suggestion: Brain Scan Required\n";
        }

        else
        {
            cout<<"Disease: Severe Neurological Disorder\n";
            cout<<"Suggestion: Immediate Neurologist Consultation\n";
        }
    }

    // Menu
    void menu()
    {
        int dept;

        cout<<"============================\n";
        cout<<"   Hospital Expert System\n";
        cout<<"============================\n";

        cout<<"\nDepartments:\n";

        cout<<"1. Orthopedic\n";
        cout<<"2. Gynecology\n";
        cout<<"3. Cardiology\n";
        cout<<"4. ENT\n";
        cout<<"5. Neurology\n";

        cout<<"\nEnter your choice: ";
        cin>>dept;

        if(dept==1)
        {
            orthopedic();
        }

        else if(dept==2)
        {
            gynecology();
        }

        else if(dept==3)
        {
            cardiology();
        }

        else if(dept==4)
        {
            ent();
        }

        else if(dept==5)
        {
            neurology();
        }

        else
        {
            cout<<"\nInvalid Department\n";
        }
    }
};

int main()
{
    Hospital h;

    h.menu();

    return 0;
}


