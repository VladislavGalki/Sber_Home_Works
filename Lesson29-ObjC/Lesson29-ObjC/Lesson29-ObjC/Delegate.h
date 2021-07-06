//
//  Delegate.h
//  Lesson29-ObjC
//
//  Created by Владислав Галкин on 06.07.2021.
//

#import <Foundation/Foundation.h>
#import "DelegateProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface Delegate : NSObject

@property (nonatomic, weak) id <DelegateProtocol> delegate;

- (void)getLettersArray;

@end

NS_ASSUME_NONNULL_END
