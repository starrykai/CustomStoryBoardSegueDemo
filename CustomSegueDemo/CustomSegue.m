//
//  CustomSegue.m
//  CustomSegueDemo
//
//  Created by 吴恺 on 14/12/8.
//  Copyright (c) 2014年 wukai. All rights reserved.
//

#import "CustomSegue.h"

@implementation CustomSegue

- (void)perform {
    UIViewController *src = (UIViewController *)self.sourceViewController;
    UIViewController *dest = (UIViewController *)self.destinationViewController;
    
    CGRect f = src.view.frame;
    CGRect originalSourceRect = src.view.frame;
    f.origin.x = f.size.height;
    
    
    [UIView animateWithDuration:0.3 animations:^{
        src.view.frame = f;
    } completion:^(BOOL finished) {
        src.view.alpha = 0;
        dest.view.frame = f;
        dest.view.alpha = 0;
        
        [[src.view superview] addSubview:dest.view];
        
        [UIView animateWithDuration:0.3 animations:^{
            dest.view.frame = originalSourceRect;
            dest.view.alpha = 1.0f;
        } completion:^(BOOL finished) {
            [dest.view removeFromSuperview];
            src.view.alpha = 1.0f;
            [src.navigationController pushViewController:dest animated:NO];
        }];
        
    }];
}

@end
