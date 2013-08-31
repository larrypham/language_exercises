#import <Foundation/Foundation.h>
#import "Edge.h"
#import "Vertex.h"

@interface Graph : NSObject {
    NSMutableArray *edges;
    NSMutableArray *vertices;
    int weight;
}

@property (nonatomic, retain) NSMutableArray *edges;
@property (nonatomic, retain) NSMutableArray *vertices;

-(void)readWeightedGraphFromFile:(NSString *)filepath;
-(void)addVertex:(Vertex *)v;
-(void)connectVertices:(Vertex *)src dst:(Vertex *)dst weight:(int) weight;

-(void)runBellmanFord:(Vertex *)sv;

@end
