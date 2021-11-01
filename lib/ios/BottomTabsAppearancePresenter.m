#import "BottomTabsAppearancePresenter.h"
#import "UIColor+RNNUtils.h"

@implementation BottomTabsAppearancePresenter

# pragma mark - public

- (void)applyBackgroundColor:(UIColor *)backgroundColor translucent:(BOOL)translucent {
    if (translucent) [self setTabBarTranslucent:YES];
    else if (backgroundColor.isTransparent) [self setTabBarTransparentBackground];
    else if (backgroundColor) [self setTabBarBackgroundColor:backgroundColor];
    else [self setTabBarDefaultBackground];
}

 - (void)setTabBarBackgroundColor:(UIColor *)backgroundColor {
     [self setTabBarOpaqueBackground];
    for (UIViewController *childViewController in self.tabBarController.childViewControllers) {
         childViewController.tabBarItem.standardAppearance.backgroundColor = backgroundColor;
        if (@available(iOS 15.0, *)) {
            childViewController.tabBarItem.scrollEdgeAppearance.backgroundColor = backgroundColor;
        }
    }
 }
 

- (void)setTabBarTranslucent:(BOOL)translucent {
    if (translucent) [self setTabBarTranslucentBackground];
    else [self setTabBarOpaqueBackground];
}

 - (void)setTabBarTranslucentBackground {
    for (UIViewController *childViewController in self.tabBarController.childViewControllers) {
         [childViewController.tabBarItem.standardAppearance configureWithDefaultBackground];
        if (@available(iOS 15.0, *)) {
            [childViewController.tabBarItem.scrollEdgeAppearance configureWithDefaultBackground];
        }
    }
 }

# pragma mark - private

- (void)setTabBarDefaultBackground {
    [self setTabBarOpaqueBackground];
}

 - (void)setTabBarTransparentBackground {
    for (UIViewController *childViewController in self.tabBarController.childViewControllers) {
         [childViewController.tabBarItem.standardAppearance configureWithTransparentBackground];
        if (@available(iOS 15.0, *)) {
            [childViewController.tabBarItem.scrollEdgeAppearance configureWithTransparentBackground];
        }
    }     
 }

 - (void)setTabBarOpaqueBackground {
    for (UIViewController *childViewController in self.tabBarController.childViewControllers) {
         [childViewController.tabBarItem.standardAppearance configureWithOpaqueBackground];
        if (@available(iOS 15.0, *)) {
            [childViewController.tabBarItem.scrollEdgeAppearance configureWithOpaqueBackground];
        }
    }
 }

@end
