#import <MtProtoKit/MTRequestContext.h>

@implementation MTRequestContext

- (instancetype)initWithMessageId:(int64_t)messageId messageSeqNo:(int32_t)messageSeqNo transactionId:(id)transactionId quickAckId:(int32_t)quickAckId
{
    self = [super init];
    if (self != nil)
    {
        _messageId = messageId;
        _messageSeqNo = messageSeqNo;
        _transactionId = transactionId;
        _quickAckId = quickAckId;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"MTRequestContext#%p(messageId %@, seq %@, transactionId %@, ackId %@)", self, @(_messageId), @(_messageSeqNo), _transactionId, @(_quickAckId)];
}

@end
