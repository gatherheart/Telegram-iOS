#import <MtProtoKit/MTMessageTransaction.h>

#import <MtProtoKit/MTInternalId.h>
#import <MtProtoKit/MTLogging.h>

MTInternalIdClass(MTMessageTransaction)

@implementation MTMessageTransaction

- (instancetype)initWithMessagePayload:(NSArray *)messagePayload prepared:(void (^)(NSDictionary *messageInternalIdToPreparedMessage))prepared failed:(void (^)())failed completion:(void (^)(NSDictionary *messageInternalIdToTransactionId, NSDictionary *messageInternalIdToPreparedMessage, NSDictionary *messageInternalIdToQuickAckId))completion
{
    self = [super init];
    if (self != nil)
    {
        _internalId = [[MTInternalId(MTMessageTransaction) alloc] init];
        
        _messagePayload = messagePayload;
        _completion = [completion copy];
        _prepared = [prepared copy];
        _failed = [failed copy];
    }
    
    MTLog(@"%@: new instance", self);
    
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"MTMessageTransaction#%p(%@, messagePayload %@)", self, _internalId, _messagePayload];
}

@end
