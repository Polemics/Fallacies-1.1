//
//  ReferenceTableController.h
//  ThinkingGoneWrong
//
//  Created by Kevin Akers on 12/27/13.
//  Copyright (c) 2013 Polemics Applications. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReferenceTableController : UITableViewController {
    
    NSArray *currentTermsArray, *currentDefinitionsArray;
}

@property (nonatomic, retain) NSArray *arrayTerms;
@property (nonatomic, retain) NSArray *arrayDefinitions;


@property int passedNumber;
@property (nonatomic, retain) NSString *theTitle;

@end
