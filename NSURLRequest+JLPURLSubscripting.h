/*
Created by @swizzlr on 31/07/2013.

Hereby released into the public domain, I renounce all claim to this source code, nor do I imply or assert any warranty or guarantee as to its fitfulness.

That said, it seems to work okay, and if you use this, let me know.
*/


#import <Foundation/Foundation.h>

@interface NSURLRequest (JLPURLSubscripting)

- (id)objectForKeyedSubscript:(id <NSCopying>)key;

@end

@interface NSMutableURLRequest (JLPMutableURLSubscripting)

- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key;


@end