#import <Foundation/Foundation.h>
#import "Graph.h"
#import "Vertex.h"

int main(int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    Graph *g = [[Graph alloc] init];

    [g readWeightedGraphFromFile:@"weighted_graph.txt"];

    int graphSize = [[g vertices] count];
    NSLog(@"Size of graph: %d", graphSize);

    NSArray *vertices = [g vertices];
    Vertex *sv = nil;
    for (Vertex *v in vertices)
    {
        NSLog(@"Vertex label: %@", v.label);
        if ([v.label isEqualToString:@"s"])
        {
            NSLog(@"Set source to vertex %@", v.label);
            sv = v;
        }
    }

    [g runBellmanFord:sv];
    for (Vertex *v in vertices)
    {
        NSLog(@"%@ distance: %d", v.label, v.distance);
    }


    [g release];
    [pool drain];
    return 0;
}
