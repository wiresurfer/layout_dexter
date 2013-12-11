//
//  SBDynamicLayoutView.m
//  DynamicLayoutTrial
//
//  Created by wiresurfer on 12/12/13.
//  Copyright (c) 2013 wiresurfer. All rights reserved.
//

#import "SBDynamicLayoutView.h"

@implementation SBDynamicLayoutView
@synthesize json;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(void)initWithJson:(NSDictionary*)_json{
    json = _json;
    
}
-(UIColor*) returnColorFromArray:(NSArray*)color{
    float rgbR = [[color objectAtIndex:0] floatValue]/255 ;
    float rgbG = [[color objectAtIndex:1] floatValue]/255 ;
    float rgbB = [[color objectAtIndex:2] floatValue]/255 ;
    float rgbA = [[color objectAtIndex:3] floatValue] ;
    UIColor* _color = [UIColor colorWithRed:rgbR green:rgbG blue:rgbB alpha:rgbA];
    return _color;
}
-(void) parseDictionaryItem:(NSDictionary*) dict withParent:(UIView*) parent{
    
    for(NSDictionary *item in dict)
    {
        NSLog(@"Item: %@", item);
        NSDictionary* content = [dict objectForKey:item];
        NSLog(@"%@",[content objectForKey:@"class"]);
        NSLog(@"%@",[content objectForKey:@"format"]);
        NSString* className =[content objectForKey:@"class"];
        NSArray* frameArray = [content objectForKey:@"frame"];
        NSArray* color = [content objectForKey:@"background"];
        Class c = NSClassFromString(className);
        CGRect frame = CGRectMake([[frameArray objectAtIndex:0] floatValue],
                                  [[frameArray objectAtIndex:1] floatValue],
                                  [[frameArray objectAtIndex:2] floatValue],
                                  [[frameArray objectAtIndex:3] floatValue]
                                  );
                id obj = [[c alloc] initWithFrame:frame];
        ((UIView*)obj).backgroundColor = [self returnColorFromArray:color];
        
        if([className isEqualToString:@"UILabel"])
        {
            ((UILabel*)obj).text = [content objectForKey:@"text"];
            ((UILabel*)obj).textAlignment = NSTextAlignmentCenter;
            ((UILabel*)obj).textColor = [self returnColorFromArray:[content objectForKey:@"textColor"]];
        }
        
        if([className isEqualToString:@"UIButton"])
        {
            UIImage* shareImg = [UIImage  imageNamed:[content objectForKey:@"img"]];
            [((UIButton*)obj) setImage:shareImg forState:UIControlStateNormal]; ;
        }

        
        [parent addSubview:obj];
        NSString* remote_child = [content objectForKey:@"children_remote"];
        if( remote_child== nil){
        NSArray* children = [content objectForKey:@"children"];
            for (int i=0; i<[children count]; i++) {
                NSDictionary* childNode = [children objectAtIndex:i];
                [self parseDictionaryItem:childNode withParent:(UIView *)obj];
            }
        }
        else
        {
            NSData* response =[[NSMutableData alloc] initWithContentsOfURL:[[NSURL alloc] initWithString:remote_child]];
            NSDictionary* remoteChildren = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:Nil];
                [self parseDictionaryItem:remoteChildren withParent:(UIView *)obj];

        }

    }
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect{
    [self parseDictionaryItem:json withParent:self];
    
}


@end
