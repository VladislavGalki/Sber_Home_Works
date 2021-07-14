//
//  FirstObjLibrary.h
//  FirstObjLibrary
//
//  Created by Владислав Галкин on 14.07.2021.
//

#import <Foundation/Foundation.h>
#import "SecondObjLibrary.h"

@interface FirstObjLibrary : NSObject

-(NSString*) firstObjLibraryFunc;
-(NSString*) callSecondIbjLibrary;
-(NSString*) callFirstSwiftLibrary;

@end
