//
//  ViewController.m
//  Otto
//
//  Created by Cheng Sun on 7/31/19.
//  Copyright © 2019 EF. All rights reserved.
//

#import "ViewController.h"
#import "Otto-Swift.h"
#import "JPEngine.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *sourcePath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"Resource/demo-swift.js"];
    [JPEngine evaluateScriptWithPath:sourcePath];    
}

- (IBAction)tap:(id)sender {
    TableViewController *tab = [TableViewController new];
    [self.navigationController pushViewController:tab animated:YES];
}

@end
