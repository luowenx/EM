//
//  EMRecommendListViewModel.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/20.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMViewModel.h"
#import "EMFocuseImage.h"
#import "EMRecommendItem.h"
#import "EMHotRecommendObj.h"

/**
 推荐
 */
@interface EMRecommendListViewModel : EMViewModel
// --------------  data -----------------//
/** 轮播 */
@property (nonatomic, strong, readonly) NSArray <EMFocuseImage *>*focusImages;

/**  推荐数据  */
@property (nonatomic, strong, readonly) NSArray<EMHotRecommendObj *> * hotRecommends;

// --------------  command -----------------//
/**  item回调事件，参数为EMRecommendItem类型  */
@property (nonatomic, strong) RACCommand *didItemCommand;

/**  更多回调事件，参数为EMHotRecommendObj类型  */
@property (nonatomic, strong) RACCommand *moreRecommendCommand;

@end
