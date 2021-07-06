//
//  ViewController.m
//  Lesson29-ObjC
//
//  Created by Владислав Галкин on 06.07.2021.
//

#import "ViewController.h"
#import "Delegate.h"

@interface ViewController () <DelegateProtocol>

@property (strong,nonatomic) Delegate* delegate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = [[Delegate alloc] init];
    self.delegate.delegate = self;
    
    [self.delegate getLettersArray];
}

- (void)getArrayLetters:(NSArray*)array {
    NSArray *sortedArray = [array sortedArrayUsingComparator: ^NSComparisonResult(id obj1, id obj2) {
        
        NSString *firstNameLetter = @"n";
        
        if ([[obj1 componentsSeparatedByString:firstNameLetter] count] > [[obj2 componentsSeparatedByString:firstNameLetter] count]) {
            return NSOrderedAscending;
        } else if ([[obj1 componentsSeparatedByString:firstNameLetter] count] < [[obj2 componentsSeparatedByString:firstNameLetter] count]) {
            return  NSOrderedDescending;
        } else {
            return NSOrderedSame;
        }
    }];
    
    NSLog(@"%@", sortedArray);
}

@end

