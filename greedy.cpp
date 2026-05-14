#include <iostream>
using namespace std;

class Graph{

   int n;

   public:

   void selectionsort()
   {
    cout<<"Enter the no of elements: ";
    cin>>n;
    
    int arr[n];
    cout<<"Enter the numbers";
    for(int i=0;i<n;i++)
    {
        cin>>arr[i];

    }
    for(int i=0;i<n;i++)
    {
        int min=i;
        for(int j=i+1;j<n;j++)
        {
            if(arr[j]<arr[min])
            {
                min=j;
            }
        }
        swap(arr[i],arr[min]);
    }

    cout<<"Sorted array is :";
    for(int i=0;i<n;i++)
    {
        cout<<arr[i]<<" ";

    }
    cout<<endl;

   }

   void prims()
   {
    int cost[10][10];
    int visited[10]={0};

    cout<<"Enter no of Cities";
    cin>>n;
    cout<<"Enter road matrix:";
    for(int i=0;i<n;i++)
    {
        for(int j=0;j<n;j++)
        {
            cin>>cost[i][j];

            if(i!=j && cost[i][j]==0)
            {
                cost[i][j]=999;
            }
        }
    }
    visited[0]=1;
    int mincost=0;
    int edge=0;
    cout<<"Selected Roads:";
    while(edge<n-1)
    {
        int min=999;
        int a=-1,b=-1;
        for(int i=0;i<n;i++)
        {
            if(visited[i]==1)
            {
                for(int j=0;j<n;j++)
                {
                    if(visited[j]==0 && cost[i][j]<min)
                    {
                        min=cost[i][j];
                        a=i;
                        b=j;
                    }
                }
            }
        }
        cout<<"City"<<a<<"-> City"<<b;
        cout<<"="<<min<<endl;

        visited[b]=1;
        mincost +=min;
        edge++;
    }
    cout<<"Minimum Road Cost="<<mincost<<endl;

   }

   void shortestpath()
   {
    int dist[10];
    int cost[10][10];
    int visited[10];
    int start;

    cout<<"Enter the number od cities:";
    cin>>n;

    cout<<"Enter the cities matrix";
    for(int i=0;i<n;i++)
    {
        for(int j=0;j<n;j++)
        {
            cin>>cost[i][j];
            if(i!=j && cost[i][j]==0)
            {
                cost[i][j]=999;
            }
        }
    }

    cout<<"Enter the city";
    cin>>start;
    for(int i=0;i<n;i++)
    {
        dist[i]=cost[start][i];
        visited[i]=0;
    }
    dist[start]=0;
    visited[start]=1;

    for(int count=0;count<n-1;count++)
    {
        int min=999;
        int next=-1;

        for(int i=0;i<n;i++)
        {
            if(!visited[i] && dist[i]<min)
            {
                min=dist[i];
                next=i;
            }
        }
        visited[next]=1;
        for(int i=0;i<n;i++)
        {
            if(!visited[i] && dist[next]+cost[next][i]<dist[i])
            {
                dist[i]=dist[next]+cost[next][i];
            }
        }
    }
    cout<<"Shortest Distance";
    for(int i=0;i<n;i++)
    {
        cout<<start<<"->"<<i<<"="<<dist[i]<<endl;
    }

   }

};
int main()
{
    Graph g;
    g.selectionsort();
    g.prims();
    g.shortestpath();
}