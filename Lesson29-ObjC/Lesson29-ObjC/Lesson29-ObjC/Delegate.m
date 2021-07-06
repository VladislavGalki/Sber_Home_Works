//
//  Delegate.m
//  Lesson29-ObjC
//
//  Created by Владислав Галкин on 06.07.2021.
//

#import "Delegate.h"

@implementation Delegate

- (void)getLettersArray {
    NSArray *array = @[
        @"Jockie has taken the parting kiss",
        @"Over the mountains he is gone,",
        @"And with him is all my bliss",
        @"Nothing but grief with me remain",
        @"Spare my love, you winds that blow",
        @"Driven sleets and beating rain!",
        @"Spare my love, you feathery snow"
    ];
    
    [self.delegate getArrayLetters:array];
}

@end
