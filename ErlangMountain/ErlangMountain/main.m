//
//  main.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/13.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"


NSInteger nthSuperUglyNumber(NSInteger n, NSArray *primes)
{
    if (n <= 0 || primes.count == 0) {
        return -1;
    }
    if (n == 1) {
        return 1;
    }
    
    NSInteger primesSize = primes.count;
    
    NSMutableArray *primesLocation = [NSMutableArray arrayWithCapacity:primesSize];
    
    for (id obj in primes) {
        [primesLocation addObject:@0];
    }
    
    NSMutableArray *uglyNums = [NSMutableArray arrayWithCapacity:n];
    
    for (int i = 0; i<n; i++) {
        [uglyNums addObject:@0];
    }
    
    [uglyNums replaceObjectAtIndex:0 withObject:@1];
    
    
    for (int i = 1; i < n; i++) {
        NSInteger min = [primes.firstObject integerValue] * [[uglyNums objectAtIndex:[primesLocation.firstObject integerValue]] integerValue];
        
        for (int j = 1; j < primesSize; j++) {
            NSInteger temp = [primes[j] integerValue] * [[uglyNums objectAtIndex:[primesLocation[j] integerValue]] integerValue];
            if (temp < min) {
                min = temp;
            }
        }
        
        for (int j = 0; j < primesSize; j++) {
            NSInteger temp = [primes[j] integerValue] * [[uglyNums objectAtIndex:[primesLocation[j] integerValue]] integerValue];
            if (temp == min) {
                [primesLocation replaceObjectAtIndex:j withObject:@([primesLocation[j] integerValue] + 1)];
            }
        }
        
        [uglyNums replaceObjectAtIndex:i withObject:@(min)];
    }
    
    return [uglyNums[n-1] integerValue];
}


NSArray *absoluteFactors(int n)
{
    NSMutableArray *absoluteFactors = [NSMutableArray array];
    for (int i = 2; i <= sqrt(n); i++) {
        if (n%i == 0) {
            if (i == sqrt(n) && n/i == i ) {
                [absoluteFactors addObject:@(i)];
            }else{
                [absoluteFactors addObject:@(n/i)];
                [absoluteFactors addObject:@(i)];
            }
        }
    }
    return absoluteFactors.copy;
}


NSArray *factors(int n)
{
    NSMutableArray *factors = absoluteFactors(n).mutableCopy;

    // 清除掉里面的素数
    NSMutableSet *needRemove = [NSMutableSet set];

    for (int i = 0; i < factors.count; i++) {
        int num = [factors[i] intValue];
        if (num == 2) {
            continue;
        }
        for (int j = 2; j <= sqrt(num); j++) {
            if (num%j == 0) {// 素数
                [needRemove addObject:@(num)];
                break;
            }
        }
    }
    [factors removeObjectsInArray:needRemove.allObjects];
    
    [factors addObject:@1];
    [factors addObject:@(n)];
    return factors.copy;
}

void logTheUglyNumber()
{
    NSArray *primes = @[@2, @7, @13, @19];
    
    for (int i = 1; i < 100; i++) {
        
        NSArray *factor = factors(i);
        
        BOOL contains = YES;
        for (NSNumber *number in factor) {
            if (number.intValue == 1) {
                continue;
            }
            
            if (number.intValue == i) {
                if (factor.count == 2) {
                    contains = [primes containsObject:number];continue;
                }
                continue;
            }
            
            if (![primes containsObject:number]) {
                contains = NO; break;
            }
        }
        
        if (contains) {
            NSLog(@"-->%@", @(i));
        }
    }
}

int main(int argc, char * argv[]) {
    
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
