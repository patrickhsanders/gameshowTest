//
//  Trial.m
//  GameShowTest
//
//  Created by Aditya Narayan on 12/11/15.
//  Copyright © 2015 turntotech.io. All rights reserved.
//

#import "Trial.h"

@implementation Trial

- (instancetype)init{
  self = [super init];
  
  self.doors = [[NSMutableDictionary alloc] init];
  for(int i = 1; i <= 3; i++){
    [self.doors setObject:@"goat" forKey:[NSString stringWithFormat:@"%d",i]];
  }
  [self.doors setObject:@"car" forKey:[NSString stringWithFormat:@"%d",[Trial randomNumber]]];
  //NSLog(@"%@",self.doors);
  return self;
}

- (void)chooseDoor:(NSUInteger)doorNumber{
  self.chosenDoor = doorNumber;
}

- (BOOL)selectedDoor{
  if([[self.doors valueForKey:[NSString stringWithFormat:@"%lu",self.chosenDoor]] isEqualToString:@"car"]){
    return true;
  } else {
    return false;
  }
}

- (BOOL)otherDoor {
  [self.doors removeObjectForKey:[self doorWithGoatNotSelectedDoor]];
  [self.doors removeObjectForKey:[NSString stringWithFormat:@"%lu",self.chosenDoor]];
  NSArray *values = [self.doors allValues];
  for(NSString *contentOfDoor in values){
    if([contentOfDoor isEqualToString:@"car"]){
      return true;
    }
  }
  
  return false;
}

- (NSString*)doorWithGoatNotSelectedDoor {
  
//  NSLog(@"keys - %@",[self.doors allKeys]);
  NSArray *keys = [self.doors allKeysForObject:@"goat"];
  for(NSString *doorWithGoat in keys){
    if(![doorWithGoat isEqualToString:[NSString stringWithFormat:@"%lu",self.chosenDoor]]){
      return doorWithGoat;
    }
  }
  
  return @"x";

}

+ (int)randomNumber{
  int lowerBound = 1;
  int upperBound = 4;
  return lowerBound + arc4random() % (upperBound - lowerBound);
}

@end
