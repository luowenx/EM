//
//  EMFollowsManager.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/7.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMFollowsManager.h"
#import "EMPeakAnchor.h"
#import "EMFollowAnchorReq.h"

@interface EMFollowsManager ()


@end

@implementation EMFollowsManager
{
    NSMutableDictionary *aParameters_;
}

static id followsPersistence = nil;
+(instancetype)sharePersistence
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        followsPersistence = [[[self class] alloc] init];
    });
    return followsPersistence;
}

- (void)persistenceObjWithDic:(NSDictionary*)localDic
{
    if (localDic.count == 0) {
        return;
    }
    [self.container removeAllObjects];
    [self.container addObjectsFromArray:[EMPeakAnchor objArrayWithDics:localDic[@"followAnchors"]]];
}

+ (NSString *)persistencePath
{
    return kEMPathFollowsData;
}

- (NSDictionary *)toJSON
{
    if (!aParameters_) {
        aParameters_ = [NSMutableDictionary dictionary];
    }
    [aParameters_ setObject:self.container.toJSON forKey:@"followAnchors"];

    return aParameters_.copy;
}


-(void)followAnchor:(EMAnchor *)anchor
{
    EMFollowAnchorReq *req = [[EMFollowAnchorReq alloc] init];
    req.toUid = anchor.uid;
    [req requestWithCompletion:^(LQHttpResponse *response) {
        EMFollowAnchorRes *res = (EMFollowAnchorRes *)response;
        EMPeakAnchor *peakAnchor = [[EMPeakAnchor alloc] init];
        startParser(res.data, peakAnchor, EMPeakAnchor)
        parserObjAttr(nickname)
        parserDiffObjAttr(smallLogo, @"mobileSmallLogo")
        parserBaseAttr(isVerified, boolValue)
        parserBaseAttr(uid, integerValue)
        inobj.isFollowed = YES;
        parserDiffObjAttr(largeLogo, @"mobileLargeLogo")
        parserDiffObjAttr(middleLogo, @"mobileMiddleLogo")
        parserObjAttr(personDescribe)
        parserDiffObjAttr(verifyType, @"verifyEntryType")
        parserDiffBaseAttr(tracksCounts, @"tracks", integerValue)
        parserDiffBaseAttr(followersCounts, @"followers", integerValue)
        
        peakAnchor.isFollowed = YES;
        anchor.isFollowed = !anchor.isFollowed;
        [EMFollows insertObj:peakAnchor compareKey:@"uid"];
    } error:^(LQHttpError *error) {
        
    }];
}

@end
