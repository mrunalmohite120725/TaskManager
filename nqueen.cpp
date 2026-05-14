// // N-Queens using Backtracking (Simple Version)

// #include <iostream>
// using namespace std;

// class NQueen
// {
//     int board[10][10];
//     int n;

// public:

//     void input()
//     {
//         cout<<"Enter number of Queens (N): ";
//         cin>>n;

//         for(int i=0;i<n;i++)
//         {
//             for(int j=0;j<n;j++)
//             {
//                 board[i][j]=0;
//             }
//         }
//     }

//     // Check safe position
//     bool isSafe(int row,int col)
//     {
//         // Check upper column
//         for(int i=0;i<row;i++)
//         {
//             if(board[i][col]==1)
//             {
//                 return false;
//             }
//         }

//         // Left diagonal
//         for(int i=row,j=col;i>=0 && j>=0;i--,j--)
//         {
//             if(board[i][j]==1)
//             {
//                 return false;
//             }
//         }

//         // Right diagonal
//         for(int i=row,j=col;i>=0 && j<n;i--,j++)
//         {
//             if(board[i][j]==1)
//             {
//                 return false;
//             }
//         }

//         return true;
//     }

//     // Backtracking
//     bool solve(int row)
//     {
//         if(row==n)
//         {
//             return true;
//         }

//         for(int col=0;col<n;col++)
//         {
//             if(isSafe(row,col))
//             {
//                 board[row][col]=1;

//                 if(solve(row+1))
//                 {
//                     return true;
//                 }

//                 // Backtracking
//                 board[row][col]=0;
//             }
//         }

//         return false;
//     }

//     void display()
//     {
//         cout<<"\nSolution:\n\n";

//         for(int i=0;i<n;i++)
//         {
//             for(int j=0;j<n;j++)
//             {
//                 if(board[i][j]==1)
//                 {
//                     cout<<"Q ";
//                 }
//                 else
//                 {
//                     cout<<". ";
//                 }
//             }

//             cout<<endl;
//         }
//     }
// };

// int main()
// {
//     NQueen q;

//     q.input();

//     if(q.solve(0))
//     {
//         q.display();
//     }
//     else
//     {
//         cout<<"Solution not possible";
//     }

//     return 0;
// }







#include <iostream>
using namespace std;

class NQueens
{
    int n;
    int board[10][10];

    public:

    void input()
    {
        cout<<"Enter Number of Queens :";
        cin>>n;
        for(int i=0;i<n;i++)
        {
            for(int j=0;j<n;j++)
            {
                board[i][j]=0;
            }
        }
    }

    void display()
    {
          cout<<"Solution :\n";
          for(int i=0;i<n;i++)
         {
            for(int j=0;j<n;j++)
            {
                if(board[i][j]==1)
                {
                    cout<<"Q ";
                }
                else{
                    cout<<". ";
                }
            }
            cout<<endl;
         }
    }

    bool issafe(int row,int col)
    {
        for(int i=0;i<row;i++)
        {
            if(board[i][col]==1)
            {
                return false;
            }
        }
        for(int i=row,j=col;i>=0 && j>=0 ; i--,j--)
        {
            if(board[i][j]==1)
            {
                return false;
            }
        }
         for(int i=row,j=col;i>=0 && j<n ; i--,j++)
        {
            if(board[i][j]==1)
            {
                return false;
            }
        }

        return true;
    }

    bool solve(int row)
    {
        if(row==n)
        {
            return true;
        }
        for(int col=0 ;col<n; col++)
        {
            if(issafe(row,col))
            {
                board[row][col]=1;
                
                if(solve(row+1))
                {
                    return true;
                }
                board[row][col]=0;
            }
        }
        return false;
    }

};
int main()
{
    NQueens n1;
    n1.input();
    if(n1.solve(0))
    {
        n1.display();
    }
    return 0;
}