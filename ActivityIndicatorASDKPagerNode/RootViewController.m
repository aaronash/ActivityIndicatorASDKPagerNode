//
//  RootViewController.m
//  ActivityIndicatorASDKPagerNode
//
//  Created by Aaron Ash on 3/6/17.
//  Copyright © 2017 Ash Apps. All rights reserved.
//

#import "RootViewController.h"
#import "FullscreenCellNode.h"

@interface RootViewController ()  <ASPagerNodeDataSource>

@end

@implementation RootViewController


- (instancetype)init {
    self = [super initWithNode:[[ASPagerNode alloc] init]];
    if (self == nil) {
        return self;
    }
    
    self.node.dataSource = self;
    self.node.backgroundColor = [UIColor greenColor];
    
    return self;
}


#pragma mark - ASPagerNodeDataSource

- (NSInteger)numberOfPagesInPagerNode:(ASPagerNode *)pagerNode {
    return 50;
}

- (ASCellNodeBlock)pagerNode:(ASPagerNode *)pagerNode nodeBlockAtIndex:(NSInteger)index {
    return ^{
        FullscreenCellNode *page = [[FullscreenCellNode alloc] init];
        return page;
    };
}


@end
