/*
Created by @swizzlr on 31/07/2013.

Hereby released into the public domain, I renounce all claim to this source code, nor do I imply or assert any warranty or guarantee as to its fitfulness.

That said, it seems to work okay, and if you use this, let me know.
*/

#import "NSURLRequest+JLPURLSubscripting.h"

@implementation NSURLRequest (JLPURLSubscripting)

- (id)objectForKeyedSubscript:(id <NSCopying>)key {
    NSParameterAssert([(id <NSObject>)key isKindOfClass:[NSString class]]);

    return [self valueForHTTPHeaderField:(NSString *)key];
}

@end


@implementation NSMutableURLRequest (JLPMutableURLSubscripting)

- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key {
    NSParameterAssert([(id <NSObject>)key isKindOfClass:[NSString class]]);

    NSString * httpHeader = (NSString *)key;
    NSString * httpValue;
    id <NSFastEnumeration> httpValueCollection;
    if ([obj isKindOfClass:[NSString class]]) {
        httpValue = obj;
    } else if ([obj conformsToProtocol:@protocol(NSFastEnumeration)]) {
        httpValueCollection = obj;
    } else if (!httpValue && !httpValueCollection) {
        NSParameterAssert(([obj isKindOfClass:[NSString class]])||([obj conformsToProtocol:@protocol(NSFastEnumeration)])); //only do the assert after we've attempted the assignment. no point in wasting cycles on an assert otherwise.
    }

    if (httpValueCollection) {
        [self setValue:nil forHTTPHeaderField:httpHeader];
        for (NSString * value in httpValueCollection) {
            [self addValue:value forHTTPHeaderField:httpHeader];
        }
    }

    if (httpValue) {
        [self setValue:httpValue forHTTPHeaderField:httpHeader];
    }

    return;

}

@end