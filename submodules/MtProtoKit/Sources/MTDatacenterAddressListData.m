#import <MtProtoKit/MTDatacenterAddressListData.h>

@implementation MTDatacenterAddressListData

- (instancetype)initWithAddressList:(NSDictionary<NSNumber *, NSArray *> *)addressList
{
    self = [super init];
    if (self != nil)
    {
        _addressList = addressList;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"MTDatacenterAddressListData#%p(%@)", self, _addressList];
}

@end
