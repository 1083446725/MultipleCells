//
//  Person.m
//  MutipleCells
//
//  Created by la0fu on 16/10/17.
//  Copyright © 2016年 la0fu. All rights reserved.
//

#import "Person.h"
#import "TextCell.h"
#import "ImageCell.h"
#import "TextImageCell.h"
#import "BaseCell.h"

@implementation Person

- (NSString *)cellIdentifier
{
    if (_showtype == PersonShowTextAndAvatar) {
        return NSStringFromClass([TextImageCell class]);
    } else if (_showtype == PersonShowAvatar){
        return NSStringFromClass([ImageCell class]);
    } else {
        return NSStringFromClass([TextCell class]);
    }
}

@end
