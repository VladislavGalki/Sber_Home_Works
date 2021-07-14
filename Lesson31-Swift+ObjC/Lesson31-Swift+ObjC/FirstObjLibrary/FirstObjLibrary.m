//
//  FirstObjLibrary.m
//  FirstObjLibrary
//
//  Created by Владислав Галкин on 14.07.2021.
//

#import "FirstObjLibrary.h"
#import "FirstSwiftLibrary-Swift.h"

@implementation FirstObjLibrary

-(NSString*) firstObjLibraryFunc {
    return @"First objective-C library";
}

-(NSString*) callSecondIbjLibrary {
    SecondObjLibrary *secondObjLibrary = [SecondObjLibrary new];
    return [secondObjLibrary secondObjLibraryFunc];
}

-(NSString*) callFirstSwiftLibrary {
    FirstSwiftLibrary *firstSwiftLibrary = [FirstSwiftLibrary new];
    return [firstSwiftLibrary firstSwiftLibraryFunc];
    
}

@end
