//
//  ViewController.m
//  test
//
//  Created by lbxia on 2020/12/15.
//

#import "ViewController.h"
#import "LBXPrompt.h"
#import "LBXProgressHUD+Prompt.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)btn1:(id)sender {
    [LBXPrompt showHudWating];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [LBXPrompt hiddeHudView];
        
        [LBXPrompt showHudWatingWithMessage:@"请稍候" delaySeconds:5];

    });
}
- (IBAction)btn2:(id)sender {
    
    [LBXProgressHUD showErrorMessage:@"err" onView:self.view];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      
        [LBXProgressHUD showSuccessMessage:@"success" onView:self.view];

    });
    
    
    [LBXPrompt showToastWithMessage:@"test"];
}

@end
