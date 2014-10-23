//
//  FlashCardController.h
//  FlashcardTest
//
//  Created by Kevin Akers on 10/1/12.
//  Copyright (c) 2012 Kevin Akers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface FlashCardController : UIViewController {
    
    NSArray *arrayQuestions;
    NSArray *arrayAnswers;
    int card;
    BOOL revealed;

}

@property (weak, nonatomic) IBOutlet UITextView *question;
@property (weak, nonatomic) IBOutlet UITextView *theAnswer;

@property (weak, nonatomic) IBOutlet UIButton *answerButton;

- (IBAction) previous;
- (IBAction) next;
- (IBAction) reveal;
- (IBAction) random;

@end
