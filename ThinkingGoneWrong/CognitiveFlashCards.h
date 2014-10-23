//
//  CognitiveFlashCards.h
//  ThinkingGoneWrong
//
//  Created by Kevin Akers on 12/27/13.
//  Copyright (c) 2013 Polemics Applications. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CognitiveFlashCards : UIViewController {
    
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
