#import <MtProtoKit/MTLogging.h>
#import <MtProtoKit/MTRequest.h>
#import <MtProtoKit/MTRequestContext.h>

#import <MtProtoKit/MTRpcError.h>

#import <libkern/OSAtomic.h>

@interface MTRequestInternalId : NSObject <NSCopying>
{
    NSUInteger _value;
}

@end

@implementation MTRequestInternalId

- (instancetype)init
{
    self = [super init];
    if (self != nil)
    {
        static int32_t nextValue = 1;
        _value = OSAtomicIncrement32(&nextValue);
    }
    return self;
}

- (BOOL)isEqual:(id)object
{
    return [object isKindOfClass:[MTRequestInternalId class]] && ((MTRequestInternalId *)object)->_value == _value;
}

- (NSUInteger)hash
{
    return _value;
}

- (instancetype)copyWithZone:(NSZone *)__unused zone
{
    MTRequestInternalId *another = [[MTRequestInternalId alloc] init];
    if (another != nil)
        another->_value = _value;
    return another;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"MTRequestInternalId(%@)", @(_value)];
}

@end

@implementation MTRequest

- (instancetype)init
{
    self = [super init];
    if (self != nil)
    {
        _internalId = [[MTRequestInternalId alloc] init];
        _dependsOnPasswordEntry = true;
    }
    return self;
}

- (void)setPayload:(NSData *)payload metadata:(id)metadata shortMetadata:(id)shortMetadata responseParser:(id (^)(NSData *))responseParser
{
    _payload = payload;
    _metadata = metadata;
    _shortMetadata = shortMetadata;
    _responseParser = [responseParser copy];
}

- (void)setRequestContext:(MTRequestContext *)requestContext {
    _requestContext = requestContext;
    MTLog(@"%@ set request context: %@", self, requestContext);
}

- (NSString *)description {
    return [NSString stringWithFormat:@"MTRequest#%p(meta %@, requestContext %@, internalId %@)", self, self.metadata, self.requestContext, self.internalId];
}

@end
