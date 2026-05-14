// #include <iostream>
// #include <vector>
// #include <queue>
// #include <set>
// using namespace std;

// struct Node {
//     vector<vector<int>> state;
//     int g, h, f;
// };

// /* Goal State (will be taken from user) */
// vector<vector<int>> goal(3, vector<int>(3));

// /* Heuristic: Misplaced Tiles */
// int heuristic(vector<vector<int>> state) {
//     int count = 0;
//     for(int i=0;i<3;i++)
//         for(int j=0;j<3;j++)
//             if(state[i][j] != 0 && state[i][j] != goal[i][j])
//                 count++;
//     return count;
// }

// /* Compare states for visited set */
// bool operator<(const vector<vector<int>>& a,
//                const vector<vector<int>>& b) {
//     return a < b;
// }

// /* Print Puzzle State */
// void printState(vector<vector<int>> s) {
//     for(auto row : s) {
//         for(int v : row)
//             cout << v << " ";
//         cout << endl;
//     }
// }

// /* A* Algorithm with tie handling */
// void AStar(vector<vector<int>> start) {

//     queue<Node> open;
//     set<vector<vector<int>>> visited;

//     Node startNode;
//     startNode.state = start;
//     startNode.g = 0;
//     startNode.h = heuristic(start);
//     startNode.f = startNode.g + startNode.h;

//     open.push(startNode);

//     while(!open.empty()) {

//         /* Find minimum f(n) */
//         int minF = 100000;
//         queue<Node> temp = open;
//         while(!temp.empty()) {
//             minF = min(minF, temp.front().f);
//             temp.pop();
//         }

//         /* Expand ALL nodes with min f(n) */
//         int size = open.size();
//         for(int s=0; s<size; s++) {
//             Node current = open.front();
//             open.pop();

//             if(current.f != minF) {
//                 open.push(current);
//                 continue;
//             }

//             if(visited.count(current.state))
//                 continue;

//             visited.insert(current.state);

//             cout << "\nCurrent State (Expanded):\n";
//             printState(current.state);
//             cout << "g = " << current.g
//                  << "  h = " << current.h
//                  << "  f = " << current.f << endl;

//             if(current.state == goal) {
//                 cout << "\n🎯 Goal Reached!\n";
//                 return;
//             }

//             int x, y;
//             for(int i=0;i<3;i++)
//                 for(int j=0;j<3;j++)
//                     if(current.state[i][j] == 0) {
//                         x = i; y = j;
//                     }

//             int dx[4] = {-1,1,0,0};
//             int dy[4] = {0,0,-1,1};
//             string move[4] = {"UP","DOWN","LEFT","RIGHT"};

//             cout << "\nGenerated Successor States:\n";

//             for(int i=0;i<4;i++) {
//                 int nx = x + dx[i];
//                 int ny = y + dy[i];

//                 if(nx>=0 && ny>=0 && nx<3 && ny<3) {
//                     Node next = current;
//                     swap(next.state[x][y], next.state[nx][ny]);
//                     next.g = current.g + 1;
//                     next.h = heuristic(next.state);
//                     next.f = next.g + next.h;

//                     cout << "\nMove: " << move[i] << endl;
//                     printState(next.state);
//                     cout << "g = " << next.g
//                          << "  h = " << next.h
//                          << "  f = " << next.f << endl;

//                     if(!visited.count(next.state))
//                         open.push(next);
//                 }
//             }
//         }
//     }
// }

// int main() {

//     vector<vector<int>> start(3, vector<int>(3));

//     cout << "Enter Initial State (3x3 matrix, use 0 for blank):\n";
//     for(int i=0;i<3;i++)
//         for(int j=0;j<3;j++)
//             cin >> start[i][j];

//     cout << "\nEnter Goal State (3x3 matrix):\n";
//     for(int i=0;i<3;i++)
//         for(int j=0;j<3;j++)
//             cin >> goal[i][j];

//     cout << "\nInitial State:\n";
//     printState(start);

//     cout << "\nGoal State:\n";
//     printState(goal);

//     AStar(start);

//     return 0;
// }



// #include <iostream>
// using namespace std;

// class Puzzle
// {
//     int goal[3][3];

// public:

//     void display(int a[3][3])
//     {
//         for(int i=0;i<3;i++)
//         {
//             for(int j=0;j<3;j++)
//             {
//                 cout<<a[i][j]<<" ";
//             }
//             cout<<endl;
//         }
//     }

//     int heuristic(int a[3][3])
//     {
//         int h=0;

//         for(int i=0;i<3;i++)
//         {
//             for(int j=0;j<3;j++)
//             {
//                 if(a[i][j]!=0 && a[i][j]!=goal[i][j])
//                 {
//                     h++;
//                 }
//             }
//         }

//         return h;
//     }

//     void copy(int a[3][3], int b[3][3])
//     {
//         for(int i=0;i<3;i++)
//         {
//             for(int j=0;j<3;j++)
//             {
//                 b[i][j]=a[i][j];
//             }
//         }
//     }

//     void astar()
//     {
//         int current[3][3];

//         cout<<"Enter Initial State:\n";

//         for(int i=0;i<3;i++)
//         {
//             for(int j=0;j<3;j++)
//             {
//                 cin>>current[i][j];
//             }
//         }

//         cout<<"\nEnter Goal State:\n";

//         for(int i=0;i<3;i++)
//         {
//             for(int j=0;j<3;j++)
//             {
//                 cin>>goal[i][j];
//             }
//         }

//         int g=0;

//         int dx[]={-1,1,0,0};
//         int dy[]={0,0,-1,1};

//         string move[]={"UP","DOWN","LEFT","RIGHT"};

//         while(true)
//         {
//             int h=heuristic(current);

//             cout<<"\nCurrent State:\n";
//             display(current);

//             cout<<"g="<<g<<" h="<<h<<" f="<<g+h<<endl;

//             if(h==0)
//             {
//                 cout<<"\nGoal Reached!";
//                 break;
//             }

//             int x,y;

//             for(int i=0;i<3;i++)
//             {
//                 for(int j=0;j<3;j++)
//                 {
//                     if(current[i][j]==0)
//                     {
//                         x=i;
//                         y=j;
//                     }
//                 }
//             }

//             int best[3][3];
//             int bestH=999;

//             cout<<"\nSuccessor States:\n";

//             for(int k=0;k<4;k++)
//             {
//                 int nx=x+dx[k];
//                 int ny=y+dy[k];

//                 if(nx>=0 && nx<3 && ny>=0 && ny<3)
//                 {
//                     int temp[3][3];

//                     copy(current,temp);

//                     swap(temp[x][y],temp[nx][ny]);

//                     int newH=heuristic(temp);

//                     cout<<"\nMove "<<move[k]<<endl;

//                     display(temp);

//                     cout<<"g="<<g+1;
//                     cout<<" h="<<newH;
//                     cout<<" f="<<g+1+newH<<endl;

//                     if(newH<bestH)
//                     {
//                         bestH=newH;
//                         copy(temp,best);
//                     }
//                 }
//             }

//             copy(best,current);

//             g++;
//         }
//     }
// };

// int main()
// {
//     Puzzle p;

//     p.astar();

//     return 0;
// }
// /*----------
// Enter Initial State:
// 2 8 3
// 1 6 4
// 7 0 5

// Enter Goal State:
// 1 2 3
// 8 0 4
// 7 6 5
// */



#include <iostream>
using namespace std;

class Puzzle{

    int current[3][3];
    int goal[3][3];

    public:

    void display(int a[3][3])
    {
        for (int i=0;i<3;i++)
        {
            for(int j=0;j<3;j++)
            {
                cout<<a[i][j]<<" ";
            }
            cout<<endl;

        }
    }

    void copy(int a[3][3],int b[3][3])
    {
        for (int i=0;i<3;i++)
        {
            for(int j=0;j<3;j++)
            {
                b[i][j]=a[i][j];
            }

        }
    }

    int heuristic(int a[3][3])
    {
        int h=0;
        for(int i=0;i<3;i++)
        {
            for(int j=0;j<3;j++)
            {
               if(a[i][j]!=0 && a[i][j]!=goal[i][j])
               {
                  h++;
               }
            }

        }
        return h;
    }

    void astar()
    {
        cout<<"\n Enter Current State";
        for (int i=0;i<3;i++)
        {
            for(int j=0;j<3;j++)
            {
                cin>>current[i][j];
            }

        }

        cout<<"\n Enter Goal State";
        for (int i=0;i<3;i++)
        {
            for(int j=0;j<3;j++)
            {
                cin>>goal[i][j];
            }

        }

        int g=0;
        int dx[]={-1,1,0,0};
        int dy[]={0,0,-1,1};
        string move[]={"UP","DOWN","LEFT","RIGHT"};

        while(true)
        {
            int h=heuristic(current);
            cout<<"\n Current state \n";
            display(current);

            cout<<"g="<<g<<", h="<<h<<", f="<<g+h<<endl;

            if(h==0)
            {
                cout<<"\n Goal State reached !";
                break;
            }

            int x,y;
            for(int i=0;i<3;i++)
            {
               for(int j=0;j<3;j++)
               {
                   if(current[i][j]==0)
                   {
                       x=i;
                       y=j;
                   }
                }

            }

            int best[3][3];
            int bestH=999;

            cout<<"\nSucessor States:\n";
            for(int k=0;k<4;k++)
            {
                int nx=x+dx[k];
                int ny=y+dy[k];

                if(nx>=0 && nx<3 && ny>=0 && ny<3)
                {
                    int temp[3][3];
                    copy(current,temp);
                    swap(temp[x][y],temp[nx][ny]);
                    int newH=heuristic(temp);
                    cout<<"\n MOVE "<<move[k]<<"\n";
                    display(temp);

                    cout<<"g="<<g+1<<", h="<<newH<<", f="<<g+1+newH;

                    if(newH<bestH)
                    {
                        bestH=newH;
                        copy(temp,best);
                    }
                }
            }
                 copy(best,current);
                 g++;

        }

    }
};
int main()
{
    Puzzle p;
    p.astar();
    return 0;
}




