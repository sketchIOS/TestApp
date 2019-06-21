//
//  ViewController.m
//  AppTest
//
//  Created by IOS DEVELOPER on 13/11/17.
//  Copyright © 2017 IOS DEVELOPER. All rights reserved.
//

#import "ViewController.h"
#import "LeftPanelView.h"

#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *viewPassword;
@property (weak, nonatomic) IBOutlet UIView *viewEmail;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UIButton *btnRegistration;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGSize size = [UIScreen mainScreen].bounds.size;
    if (size.width > size.height) {
        [self landscapeView:size.width];
    }else
        [self potraitView:size.width];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Some other code to set up the preview layer
    // ...
    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(deviceOrientationDidChange:)
//                                                 name:UIDeviceOrientationDidChangeNotification
//                                               object:nil];
//   // [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
}
-(void) viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    NSLog(@"Calling %@",NSStringFromCGSize(size));
//    switch ([UIDevice currentDevice].orientation) {
//        case <#constant#>:
//            <#statements#>
//            break;
//
//        default:
//            break;
//    }
    if (size.width > size.height) {
        [self landscapeView:size.width];
    }else
        [self potraitView:size.width];

}
-(void)potraitView:(float)width{
    self.viewEmail.frame = CGRectMake(16, 160, [UIScreen mainScreen].bounds.size.width - 2*16, 80);
    self.viewPassword.frame = CGRectMake(16, 250, [UIScreen mainScreen].bounds.size.width - 2*16, 80);
    NSLog(@"Screen Size %@",NSStringFromCGSize([UIScreen mainScreen].bounds.size));
    NSLog(@"P");
}
-(void)landscapeView:(float)width{
    self.viewEmail.frame = CGRectMake(16, 100, (width - 3*16) / 2, 80);
    self.viewPassword.frame = CGRectMake(16, 200, (width - 3*16) / 2, 80);

    NSLog(@"Screen Size %@",NSStringFromCGSize([UIScreen mainScreen].bounds.size));
    NSLog(@"L");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showLeftPanelView:(id)sender {
    LeftPanelView *vw = [[LeftPanelView alloc] init];
    [vw setFrame:CGRectMake(- [UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:vw];
    
    [UIView animateWithDuration:1.0 animations:^{
        [vw setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    } completion:^(BOOL done) {
        NSLog(@"Animation is completed");
    }];
}
- (IBAction)openDocumentController:(id)sender {
}


@end
