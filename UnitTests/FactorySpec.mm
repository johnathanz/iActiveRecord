//
//  FactorySpec.mm
//  iActiveRecord
//
//  Created by Alex Denisov on 01.08.12.
//  Copyright (c) 2012 CoreInvader. All rights reserved.
//

#import "Cedar-iOS/SpecHelper.h"
#import "ARDatabaseManager.h"
#import "ARFactory.h"
#import "User.h"

using namespace Cedar::Matchers;

SPEC_BEGIN(ARFactorySpecs)

beforeEach(^{
    [[ARDatabaseManager sharedInstance] clearDatabase];
});
afterEach(^{
    [[ARDatabaseManager sharedInstance] clearDatabase];
});

describe(@"Factory", ^{
    it(@"should return non zero records", ^{
        NSArray *records = [ARFactory buildFew:10
                                       records:[User class]];
        [records count] should_not equal(0);
    });
    it(@"should return 10 records", ^{
        NSArray *records = [ARFactory buildFew:10
                                       records:[User class]];
        NSInteger count = [records count];
        NSInteger userCount = [User count];
        count should equal(userCount);
    });
});

SPEC_END
