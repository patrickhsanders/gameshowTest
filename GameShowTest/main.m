//
//  main.m
//  GameShowTest
//
//  Created by Aditya Narayan on 12/11/15.
//  Copyright © 2015 turntotech.io. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Trial.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    int trials = 1000000;
    int countSelectedDoor = 0;
    int countOtherDoor = 0;
    
    for(int i = 0; i < trials; i ++){
      Trial *trial = [[Trial alloc] init];
      [trial chooseDoor: [Trial randomNumber]];
      countSelectedDoor += [trial selectedDoor];
      countOtherDoor += [trial otherDoor];
    }
    
    NSLog(@"Of %d trials, the other door was the better choice %2.2f\%% of the time.",trials, (float)countOtherDoor/trials*100);
  }
  
    return 0;
}
