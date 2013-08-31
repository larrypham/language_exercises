#import <Foundation/Foundation.h>
#import "Vertex.h"

@interface Edge : NSObject {
    Vertex *srcVertex;
    Vertex *dstVertex;
    int weight;
}

@property (nonatomic, retain) Vertex *srcVertex;
@property (nonatomic, retain) Vertex *dstVertex;
@property (readwrite, assign) int weight;

@end
