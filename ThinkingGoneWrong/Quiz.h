//
//  RibbonQuiz.h
//  NSRibbons
//
//  Created by Kevin Akers on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface Quiz : UIViewController {
    
    int fromNum;
    int selectedPic;
    int wrongAnswer1;
    int wrongAnswer2;
    int wrongAnswer3;
    int correctAnswer;
    NSArray *arrayPic;
    NSArray *arrayName;
    
}

@property NSInteger diff;

//-(IBAction)buttonA;
-(IBAction)buttonB;
-(IBAction)buttonC;
-(IBAction)buttonD;
-(IBAction)newRibbon;

@property (weak, nonatomic) IBOutlet UILabel *select1;
@property (weak, nonatomic) IBOutlet UILabel *select2;
@property (weak, nonatomic) IBOutlet UILabel *select3;
@property (weak, nonatomic) IBOutlet UILabel *select4;
@property (weak, nonatomic) IBOutlet UILabel *correct;
@property (weak, nonatomic) IBOutlet UILabel *wrong;
@property (weak, nonatomic) IBOutlet UIButton *ButtonA_Label;
@property (weak, nonatomic) IBOutlet UIButton *ButtonB_Label;
@property (weak, nonatomic) IBOutlet UIButton *ButtonC_Label;
@property (weak, nonatomic) IBOutlet UIButton *ButtonD_Label;
@property (weak, nonatomic) IBOutlet UITextView *theQuestion;

@end
