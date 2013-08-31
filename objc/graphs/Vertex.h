#import <Foundation/Foundation.h>

@interface Vertex : NSObject {
  NSString *label;

  int distance;
  Vertex *predecessor;
}

@property (nonatomic, retain) NSString *label;
@property (readwrite, assign) int distance;
@property (nonatomic, retain) Vertex *predecessor;

@end
