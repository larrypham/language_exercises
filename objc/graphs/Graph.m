#import "Graph.h"

@implementation Graph

@synthesize edges, vertices;

-(id)init {
    self = [super init];

    self.edges = [[NSMutableArray alloc] initWithCapacity:10];
    self.vertices = [[NSMutableArray alloc] initWithCapacity:5];

    return self;
}

-(void)readWeightedGraphFromFile:(NSString *)filepath {
    NSError *error = nil;

    NSString *stringFromFileAtPath = [[NSString alloc]
                                        initWithContentsOfFile:filepath
                                        encoding:NSUTF8StringEncoding
                                        error:&error];
    if (stringFromFileAtPath == nil) {
        // An error occurred.
        NSLog(@"Error reading file at %@\n%@", filepath, [error localizedFailureReason]);
    }
    else {
        NSScanner *aScanner = [NSScanner scannerWithString:stringFromFileAtPath];
        NSString *srcLabel;
        NSString *dstLabel;
        int edgeCost;
        
        NSCharacterSet *cs = [NSCharacterSet characterSetWithCharactersInString:@" "];

        Vertex *v1 = nil, *v2 = nil;

        while([aScanner isAtEnd] == NO)
        {
            [aScanner scanUpToCharactersFromSet:cs intoString:&srcLabel];
            [aScanner scanUpToCharactersFromSet:cs intoString:&dstLabel];
            [aScanner scanInt:&edgeCost];
            NSLog(@"* In Graph.m: scanned %@ %@ %d", srcLabel, dstLabel, edgeCost);

            BOOL vertexOneExists = NO, vertexTwoExists = NO;
            for (Vertex *v in [self vertices])
            {
                if ([[v label] isEqualToString:srcLabel]) {
                    vertexOneExists = YES;
                    v1 = [v retain];
                    NSLog(@"* In Graph.m: src vertex %@ exists.", srcLabel);
                } else if ([[v label] isEqualToString:dstLabel]) {
                    vertexTwoExists = YES;
                    v2 = [v retain];
                    NSLog(@"* In Graph.m: dst vertex %@ exists.", dstLabel);
                }
            }

            if (!vertexOneExists)
            {
                v1 = [[Vertex alloc] init];
                [v1 setLabel:srcLabel];
                [self addVertex:v1];
            }
            
            if (!vertexTwoExists)
            {
                v2 = [[Vertex alloc] init];
                [v2 setLabel:dstLabel];
                [self addVertex:v2];
            }

            // Create our edge.
            if (v1 && v2)
            {
                [self connectVertices:v1 dst:v2 weight:edgeCost];
            }
            
            if (v1 == nil) {
                NSLog(@"* In Graph.m: missing v1"); 
            }

            if (v2 == nil) {
                NSLog(@"* In Graph.m: missing v2"); 
            }

            [v1 release];
            [v2 release];
        }
    }
}

-(void)addVertex:(Vertex *)v {
    [self.vertices addObject:v];
    NSLog(@"* In Graph.m: added vertex with label %@", v.label);
}

-(void)connectVertices:(Vertex *)src dst:(Vertex *)dst weight:(int)w
{
    Edge *e = [[Edge alloc] init];
    [e setSrcVertex:src];
    [e setDstVertex:dst];
    [e setWeight:w];
    [self.edges addObject:e];
    NSLog(@"* In Graph.m: %@ -> %@ with weight %d", src.label, dst.label, w);
    [e release];
}

-(void)runBellmanFord:(Vertex *)sv
{
    NSLog(@"Running BellmanFord on vertex %@", sv.label);

    // Step 1: initialize graph.
    //
    for (Vertex *v in self.vertices)
    {
       if (v == sv)
       {
           [v setDistance:0];
           NSLog(@"Set distance on %@ to 0", v.label);
       }
       else
       {
           [v setDistance:INT_MAX];
           NSLog(@"Set distance on %@ to %u", v.label, INT_MAX);
           [v setPredecessor:nil];
           NSLog(@"Set predecessor on %@ to null", v.label);
       }
    }

    // Step 2: relax edges repeatedly
    //
    //
    int i = 0;
    NSLog(@"Counted %d vertices.", [self.vertices count]);
    for (i = 0; i < [self.vertices count]; i++)
    {
        for (Edge *e in self.edges)
        {
            Vertex *u = [e srcVertex];
            Vertex *v = [e dstVertex];
            NSLog(@"Relaxing edge %@ with weight %u between %@ and %@", e, e.weight, u.label, v.label);

            NSLog(@"    u.distance: %u", u.distance);
            NSLog(@"    v.distance: %u", v.distance);
            NSLog(@"    candidate: %u", (u.distance + e.weight));

            if ((u.distance + e.weight) < v.distance)
            {
                [v setDistance:(u.distance + e.weight)];
                [v setPredecessor:u];
                NSLog(@"Set %@'s distance to %u and predecessor to %@", v.label, v.distance, u.label);
            }
        }
    }

    // Step 3: check for negative-weight cycles
    //
    //
    for (Edge *e in self.edges)
    {
        Vertex *u = [e srcVertex];
        Vertex *v = [e dstVertex];

        if ((u.distance + e.weight) < v.distance)
        {
            NSLog(@"Graph contains a negative-weight cycle");
        }
    }
}

-(void)dealloc {
    NSLog(@"* In Graph.m dealloc(): removing edges.");
    [edges removeAllObjects];
    [edges release];

    NSLog(@"* In Graph.m dealloc(): removing vertices.");
    [vertices removeAllObjects];
    [vertices release];

    [super dealloc];
}

@end
