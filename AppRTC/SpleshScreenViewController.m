//
//  SpleshScreenViewController.m
//  AppRTC
//
//  Created by Evgeniy Samsonov on 21.06.17.
//  Copyright © 2017 ISBX. All rights reserved.
//

#import "SpleshScreenViewController.h"
#import "ARTCRoomSMLViewController.h"


@interface SpleshScreenViewController ()

@end

@implementation SpleshScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue = [NSNumber numberWithFloat:0.0f];
    animation.toValue = [NSNumber numberWithFloat: 2*M_PI];
    animation.duration = 3.0f;
    animation.repeatCount = INFINITY;
    [self.loadImage.layer addAnimation:animation forKey:@"SpinAnimation"];
    
    [self performSelector:@selector(showNavigationContrioller) withObject:self afterDelay:4];

}

- (void)showNavigationContrioller {
    
    [UIView animateWithDuration:0.4f animations:^{
       [self performSegueWithIdentifier:@"ARTCRoomSMLViewController" sender:nil];
    }];

   /*
    ARTCRoomSMLViewController *menu = [[ARTCRoomSMLViewController alloc] init];
    [self.navigationController pushViewController:menu animated:NO];*/
    
  
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
