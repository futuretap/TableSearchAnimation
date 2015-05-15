//
//  PrivateAnimatedTransition.m
//  TableSearch
//
//  Created by Ortwin Gentz on 15.05.15.
//
//

#import "PrivateAnimatedTransition.h"

@implementation PrivateAnimatedTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
	return 1;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
	
	UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
	UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
	
	[[transitionContext containerView] addSubview:toViewController.view];
	toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];

	//	if (toViewController.presentedViewController) {
//		[toViewController.view addSubview:toViewController.presentedViewController.view];
//	}
	toViewController.view.alpha = 0;
	
	[UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
		toViewController.view.alpha = 1;
	} completion:^(BOOL finished) {
		[transitionContext completeTransition:![transitionContext transitionWasCancelled]];
	}];
}

@end
