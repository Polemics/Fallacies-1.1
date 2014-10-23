//
//  IntroductionController.h
//  ThinkingGoneWrong
//
//  Created by Kevin Akers on 12/28/13.
//  Copyright (c) 2013 Polemics Applications. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface IntroductionController : UIViewController <MFMailComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextView *theText;

@end
