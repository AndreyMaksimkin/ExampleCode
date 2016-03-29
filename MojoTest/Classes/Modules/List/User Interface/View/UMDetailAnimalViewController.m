//
//  UMDetailAnimalViewController.m
//  MojoTest
//
//  Created by Андрей on 13.03.16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "UMDetailAnimalViewController.h"

@interface UMDetailAnimalViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation UMDetailAnimalViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:self.url];
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
