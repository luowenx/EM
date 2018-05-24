//
//  EMFocuseImage.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/19.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 轮播数据
 */
@interface EMFocuseImage : NSObject<LQDecode, LQDataTransformation>

@property (nonatomic, copy) NSString * url;
@property(nonatomic, copy) NSString *shortTitle;
@property(nonatomic, copy) NSString *longTitle;
@property(nonatomic, copy) NSString *pic;
@property(nonatomic) NSInteger type;  //类型(专辑 or 音频 or 广告)
//@property(nonatomic) NSInteger uid;
//@property(nonatomic) NSInteger trackId;
//@property(nonatomic) NSInteger albumId;
@property(nonatomic) BOOL isShare;
@property(nonatomic) BOOL is_External_url;

@property (nonatomic, copy) NSString * focusCurrentId;
@property (nonatomic) NSInteger id;
@property (nonatomic) NSInteger roomId;
@property (nonatomic) NSInteger specialId;
@property (nonatomic) NSInteger subType;

@end

/*
 focusCurrentId = 126087;
 id = 19005;
 isShare = 1;
 "is_External_url" = 0;
 longTitle = "\U2461\U3010\U9996\U9875\U3011\U7f51\U6587\U4e8c\U5341\U5e74\Uff0128\U90e8\U8d85\U71c3\U795e\U4f5c";
 pic = "http://fdfs.xmcdn.com/group33/M0B/0D/EB/wKgJTFmWYhGAZ-r2AALtEuhyjq4607_ios_large.jpg";
 roomId = 0;
 shortTitle = "\U2461\U3010\U9996\U9875\U3011\U7f51\U6587\U4e8c\U5341\U5e74\Uff0128\U90e8\U8d85\U71c3\U795e\U4f5c";
 specialId = 1289;
 subType = 1;
 type = 9;
 */
