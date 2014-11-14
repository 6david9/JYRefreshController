//
//  JYPullToRefreshController.h
//  JYRefreshController
//
//  Created by Alvin on 14/11/13.
//
//

#import <Foundation/Foundation.h>
#import "JYRefreshView.h"

@interface JYPullToRefreshController : NSObject

@property (nonatomic, readonly, strong) UIScrollView *scrollView;

@property (nonatomic, assign) BOOL enable;

@property (nonatomic, readonly, assign) JYRefreshState refreshState;

@property (nonatomic, copy) void(^pullToRefreshHandleAction)();

- (instancetype)initWithScrollView:(UIScrollView *)scrollView;

- (void)triggerRefreshWithAnimated:(BOOL)animated;

- (void)stopRefreshWithAnimated:(BOOL)animated completion:(void(^)())completion;

- (void)setRefreshView:(UIView <JYRefreshView> *)customView;

@end
