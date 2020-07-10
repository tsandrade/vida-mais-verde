//  Created by Mugunth on 21/03/11.
//  Read this: http://blog.mugunthkumar.com/coding/ios-code-block-based-uialertview-and-uiactionsheet



#import "NSObject+MKBlockAdditions.h"

static VoidBlock _block;

@implementation NSObject (MKBlockAdditions)

- (void) performBlock:(VoidBlock) aBlock
{
    _block = [aBlock copy];
    
    [self performSelector:@selector(callBlock)];
}

- (void) performBlock:(VoidBlock) aBlock afterDelay:(NSTimeInterval) delay
{
    _block = [aBlock copy];

    [self performSelector:@selector(callBlock) withObject:nil afterDelay:delay];
}

-(void) callBlock
{
    _block();
    _block = nil;
}

@end
