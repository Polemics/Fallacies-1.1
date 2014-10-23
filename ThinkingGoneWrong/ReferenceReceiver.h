//
//  ReferenceReceiver.h
//  ThinkingGoneWrong
//
//  Created by Kevin Akers on 12/27/13.
//  Copyright (c) 2013 Polemics Applications. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <QuartzCore/QuartzCore.h>

@interface ReferenceReceiver : UIViewController <MFMailComposeViewControllerDelegate>

@property (nonatomic, retain) NSString *theTitle;
@property (nonatomic, retain) NSString *theDefinition;
@property (weak, nonatomic) IBOutlet UILabel *theLabel;
@property (weak, nonatomic) IBOutlet UITextView *theText;

@end
