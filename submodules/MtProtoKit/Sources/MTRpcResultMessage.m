#import "MTRpcResultMessage.h"

@implementation MTRpcResultMessage

- (instancetype)initWithRequestMessageId:(int64_t)requestMessagId data:(NSData *)data
{
    self = [super init];
    if (self != nil)
    {
        _requestMessageId = requestMessagId;
        _data = data;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"MTRpcResultMessage#%p(requestMessagId %@, data %@)", self, @(_requestMessageId), _data];
}

@end
