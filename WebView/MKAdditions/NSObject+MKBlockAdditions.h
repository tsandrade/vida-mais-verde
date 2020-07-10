//  Created by Mugunth on 21/03/11.
//  Read this: http://blog.mugunthkumar.com/coding/ios-code-block-based-uialertview-and-uiactionsheet



#import <Foundation/Foundation.h>
#import "MKBlockAdditions.h"

@interface NSObject (MKBlockAdditions)

- (void) performBlock:(VoidBlock) block;
- (void) performBlock:(VoidBlock) block afterDelay:(NSTimeInterval) delay;

@end
