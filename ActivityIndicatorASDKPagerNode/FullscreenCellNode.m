//
//  FullscreenCellNode.m
//  ActivityIndicatorASDKPagerNode
//
//  Created by Aaron Ash on 3/6/17.
//  Copyright © 2017 Ash Apps. All rights reserved.
//

#import "FullscreenCellNode.h"

@interface FullscreenCellNode ()

@property(nonatomic, strong) ASDisplayNode *spinnerNode;

@end


@implementation FullscreenCellNode

- (id)init {
    self = [super init];
    if (self != nil) {
        
        self.spinnerNode = [[ASDisplayNode alloc] initWithViewBlock:^UIView * _Nonnull {
            UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
            [spinner sizeToFit];
            [spinner startAnimating];
            spinner.backgroundColor = [UIColor clearColor];
            NSLog(@"spinner: %@", spinner);
            return spinner;
            
            //it seems like this view doesn't disappear
//            UIView *purple = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//            purple.backgroundColor = [UIColor purpleColor];
//            return purple;
        }];
        
        _spinnerNode.style.preferredSize = CGSizeMake(37, 37);
        
        self.backgroundColor = [UIColor orangeColor];
        self.automaticallyManagesSubnodes = true;
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    return [ASCenterLayoutSpec centerLayoutSpecWithCenteringOptions:ASCenterLayoutSpecCenteringXY
                                                      sizingOptions:ASCenterLayoutSpecSizingOptionDefault
                                                              child:_spinnerNode];
}

//- (CGSize)calculateSizeThatFits:(CGSize)constrainedSize
//{
//    return constrainedSize;
//}

@end
