//
//  SBViewController.m
//  DynamicLayoutTrial
//
//  Created by wiresurfer on 12/12/13.
//  Copyright (c) 2013 wiresurfer. All rights reserved.
//

#import "SBViewController.h"
#include "SBDynamicLayoutView.h"
@interface SBViewController ()

@end

@implementation SBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    SBDynamicLayoutView* dynamicLayout = [[SBDynamicLayoutView alloc] initWithFrame:self.view.bounds];
    NSString* path = [[NSBundle mainBundle] pathForResource:@"layout" ofType:@"json"];
    NSData* response =[[NSMutableData alloc] initWithContentsOfFile:path];
    [dynamicLayout initWithJson:[NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:Nil]];
    [self.view addSubview: dynamicLayout];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
