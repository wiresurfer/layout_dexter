//
//  SBDynamicLayoutView.h
//  DynamicLayoutTrial
//
//  Created by wiresurfer on 12/12/13.
//  Copyright (c) 2013 wiresurfer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SBDynamicLayoutView : UIControl
-(void)initWithJson:(NSDictionary*)json;
@property(nonatomic) NSDictionary* json;
@end

