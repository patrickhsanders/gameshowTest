//
//  Trial.h
//  GameShowTest
//
//  Created by Aditya Narayan on 12/11/15.
//  Copyright © 2015 turntotech.io. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Trial : NSObject

@property (nonatomic, strong) NSMutableDictionary *doors;
@property (nonatomic) NSUInteger chosenDoor;

- (instancetype)init;
- (void)chooseDoor:(NSUInteger)doorNumber;
- (BOOL)selectedDoor;
- (BOOL)otherDoor;
+ (int)randomNumber;
- (NSString*)doorWithGoatNotSelectedDoor;

@end
