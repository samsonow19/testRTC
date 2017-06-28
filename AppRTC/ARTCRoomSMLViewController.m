//
//  ARTCRoomSMLViewController.m
//  AppRTC
//
//  Created by Evgeniy Samsonov on 21.06.17.
//  Copyright © 2017 ISBX. All rights reserved.
//

#import "ARTCRoomSMLViewController.h"

#import "ARTCVideoChatViewController.h"

@interface ARTCRoomSMLViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;

@property (weak, nonatomic) IBOutlet UILabel *labelHideMe;
@property (weak, nonatomic) IBOutlet UITextField *roomTextFild;

@end

@implementation ARTCRoomSMLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.roomTextFild.delegate = self;
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}
- (IBAction)loginClick:(id)sender {
    if([self ValidateRoom: self.roomTextFild.text]) {
       [self performSegueWithIdentifier:@"ARTCVideoChatViewController" sender:self.roomTextFild.text];
    } else {
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil
                                                            message:[NSString stringWithFormat:@"RRoom name must be 5 or more characters and include only letters, numbers, underscore and hyphen." ]
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
        [alertView show];
    }
    
}

- (void)alertView:(UIAlertView *)alertView
    clickedButtonAtIndex:(NSInteger) buttonIndex{
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ARTCVideoChatViewController *viewController = (ARTCVideoChatViewController *)[segue destinationViewController];
    [viewController setRoomName:sender];
}

-(void) textFieldDidBeginEditing:(UITextField *)textField {
    [UIView animateWithDuration:0.4f animations:^{
        self.labelHideMe.hidden = true;
        [self.topConstraint setConstant:10.0f];
        
        [self.view layoutIfNeeded];
    }];
}


- (BOOL)ValidateRoom:(NSString *)string {
    if(string.length<5) {
        return NO;
    }
    if([string length]==0){
        return NO;
    }
    NSArray *array = [string componentsSeparatedByString:@" "];
    if([array count] >1) {
        return NO;
    }
    NSString *regExPattern = @"[A-Z0-9a-z_-]";
    
    NSRegularExpression *regEx = [[NSRegularExpression alloc] initWithPattern:regExPattern options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger regExMatches = [regEx numberOfMatchesInString:string options:0 range:NSMakeRange(0, [string length])];
 
    if (regExMatches != [string length]) {
        return NO;
    } else {
        return YES;
    }


}



@end
