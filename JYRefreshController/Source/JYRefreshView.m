//
//  JYRefreshView.m
//  JYRefreshController
//
//  Created by Alvin on 14-6-16.
//
//

#import "JYRefreshView.h"

#define JY_UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface JYRefreshView ()

@property (nonatomic, assign) JYRefreshState refreshState;
@property (nonatomic, strong) NSMutableDictionary *titles;
@property (nonatomic, strong) NSMutableDictionary *subTitles;

@end

@implementation JYRefreshView
@synthesize refreshIndicator = _refreshIndicator;


- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    _refreshState = kJYRefreshStateStop;
    _titles = [NSMutableDictionary dictionary];
    _subTitles = [NSMutableDictionary dictionary];
  }
  return self;
}

#pragma mark - layout
- (void)layoutSubviews
{
  [super layoutSubviews];
  CGPoint boundsCenter = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
  [self.refreshIndicator setCenter:boundsCenter];
}

#pragma mark - getter
- (JYRefreshIndicator *)refreshIndicator
{
  if (!_refreshIndicator) {
    JYRefreshIndicator *indicator = [[JYRefreshIndicator alloc] initWithColor:JY_UIColorFromRGB(0x007AFF)];
    indicator.hidden = NO;
    [self addSubview:indicator];
    _refreshIndicator = indicator;
  }
  return _refreshIndicator;
}

#pragma mark - JYRefreshView Protocol
- (void)pullToRefreshController:(JYPullToRefreshController *)refreshController
   didShowRefreshViewPercentage:(CGFloat)percentage
{

}

- (void)pullToRefreshController:(JYPullToRefreshController *)refreshController
                   didSetEnable:(BOOL)enable
{

}

- (void)pullToRefreshController:(JYPullToRefreshController *)refreshController
               didChangeToState:(JYRefreshState)refreshState;
{
  _refreshState = refreshState;
  switch (refreshState) {
    case kJYRefreshStateStop:
      [self.refreshIndicator stopAnimating];
      break;

    case kJYRefreshStateLoading:
      [self.refreshIndicator startAnimating];
      break;

    default:
      break;
  }
  [self layoutIfNeeded];
}

@end
