//
//  IntroductionController.m
//  ThinkingGoneWrong
//
//  Created by Kevin Akers on 12/28/13.
//  Copyright (c) 2013 Polemics Applications. All rights reserved.
//

#import "IntroductionController.h"

@interface IntroductionController ()

@end

@implementation IntroductionController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"hexellence_x2.png"]]];
    
    //Attempting Quartz Core
    [self.theText.layer setBorderColor:[[[UIColor blueColor] colorWithAlphaComponent:0.5] CGColor]];
    [self.theText.layer setBorderWidth:2.0];
    self.theText.layer.cornerRadius = 15;
    self.theText.clipsToBounds = YES;
}

- (IBAction)openFallacies:(id)sender {
    
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://en.wikipedia.org/wiki/List_of_fallacies"]];
    
}

- (IBAction)openBiases:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://en.wikipedia.org/wiki/List_of_cognitive_biases"]];
}

- (IBAction)polemicsSite:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://www.polemicsapps.com"]];
    
}

-(IBAction)feedback {
    MFMailComposeViewController *composer = [[MFMailComposeViewController alloc] init];
    [composer setMailComposeDelegate:self];
    if ([MFMailComposeViewController canSendMail]) {
        [composer setToRecipients:[NSArray arrayWithObjects:@"polemicsapp@yahoo.com", nil]];
        [composer setSubject:@"From Fallacies & Biases App"];
        [composer setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
        [self presentViewController:composer animated:YES completion:nil];
        
    }
    else
        [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"error"
                                                        message:[NSString stringWithFormat:@"error %@", [error description]]
                                                       delegate:nil cancelButtonTitle:@"dismiss" otherButtonTitles:nil, nil];
        [alert show];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
