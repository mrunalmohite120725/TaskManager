#include <iostream>
using namespace std;

class Graph
{
    int n;
    int adj[10][10],visited[10];
    string city[10];

    int queue[10];
    int f=0,r=0;

    public:

    int getcityindex(string cityname)
    {
        for(int i=0;i<n;i++)
        {
            if(city[i]==cityname)
            {
                return i;
            }
        }
        return -1;
    }

    void creategraph()
    {
        cout<<"Enter the Number of Cities";
        cin>>n;
        
        cout<<"Enter the name of cities";
        for(int i=0;i<n;i++)
        {
            cin>>city[i];
        }

        for(int i=0;i<n;i++)
        {
            for(int j=0;j<n;j++)
            {
                adj[i][j]=0;
            }
        }

        int edges;
        cout<<"Enter the number of edges";
        cin>>edges;

        cout<<"Enter the road connection of cities";
        for(int i=0;i<edges;i++)
        {
            string c1,c2;
            cin>>c1>>c2;
            int u=getcityindex(c1);
            int v=getcityindex(c2);
             
            adj[u][v]=1;
            adj[v][u]=1;

        }

        
    }

    void resetvisted()
    {
        for(int i=0;i<n;i++)
        {
            visited[i]=0;
        }
    }

    void dfs(int v)
    {
        cout<<city[v]<<" ";
        visited[v]=1;
        for(int i=0;i<n;i++)
        {
            if(adj[v][i]==1 && visited[i]==0)
            {
                dfs(i);
            }
        }
    }

    void bfs(int v)
    {
        cout<<city[v]<<" ";
        visited[v]=1;
        for(int i=0;i<n;i++)
        {
            if(adj[v][i]==1 && visited[i]==0)
            {
                queue[r++]=i;
                visited[i]=1;
            }
        }

        if(f<r)
        {
            bfs(queue[f++]);
        }
    }

};

int main()
{
    Graph g;
    string startcity;
    g.creategraph();

    cout<<"Enter start city name";
    cin>>startcity;

    int start=g.getcityindex(startcity);

    cout<<"DFS Traversal";
    g.resetvisted();
    g.dfs(start);

    cout<<"BFS Traversal";
    g.resetvisted();
    g.bfs(start);

    return 0;

}