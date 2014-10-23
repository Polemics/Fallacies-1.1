//
//  CognitiveQuiz.m
//  ThinkingGoneWrong
//
//  Created by Kevin Akers on 12/27/13.
//  Copyright (c) 2013 Polemics Applications. All rights reserved.
//

#import "CognitiveQuiz.h"

@interface CognitiveQuiz ()

@end

@implementation CognitiveQuiz
@synthesize select1;
@synthesize select2;
@synthesize select3;
@synthesize select4;
@synthesize correct;
@synthesize wrong;
@synthesize diff;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)newRibbon {
    
    correct.hidden = YES;
    wrong.hidden = YES;
    
    selectedPic = (arc4random ()%[arrayName count]);
    wrongAnswer1 = (arc4random ()%[arrayName count]);
    wrongAnswer2 = (arc4random ()%[arrayName count]);
    wrongAnswer3 = (arc4random ()%[arrayName count]);
    
    while (selectedPic == wrongAnswer1 || selectedPic == wrongAnswer2 || selectedPic == wrongAnswer3 || wrongAnswer1 == wrongAnswer2 || wrongAnswer1 == wrongAnswer3 || wrongAnswer2 == wrongAnswer3) {
        
        selectedPic = (arc4random ()%[arrayName count]);
        wrongAnswer1 = (arc4random ()%[arrayName count]);
        wrongAnswer2 = (arc4random ()%[arrayName count]);
        wrongAnswer3 = (arc4random ()%[arrayName count]);
        
    }
    
    //Set the Pic
    self.theQuestion.text = [arrayPic objectAtIndex:selectedPic];
    correctAnswer = arc4random() % 4; //Choose correct answer
    
    if (correctAnswer == 0) {
        select1.text = [arrayName objectAtIndex:(selectedPic)];
        select2.text = [arrayName objectAtIndex:(wrongAnswer1)];
        select3.text = [arrayName objectAtIndex:(wrongAnswer2)];
        select4.text = [arrayName objectAtIndex:(wrongAnswer3)];
        [_ButtonA_Label setTitle:[arrayName objectAtIndex:(selectedPic)] forState:UIControlStateNormal];
        [_ButtonB_Label setTitle:[arrayName objectAtIndex:(wrongAnswer1)] forState:UIControlStateNormal];
        [_ButtonC_Label setTitle:[arrayName objectAtIndex:(wrongAnswer2)] forState:UIControlStateNormal];
        [_ButtonD_Label setTitle:[arrayName objectAtIndex:(wrongAnswer3)] forState:UIControlStateNormal];
        
        
    }
    
    if (correctAnswer == 1) {
        
        select1.text = [arrayName objectAtIndex:(wrongAnswer1)];
        select2.text = [arrayName objectAtIndex:(selectedPic)];
        select3.text = [arrayName objectAtIndex:(wrongAnswer2)];
        select4.text = [arrayName objectAtIndex:(wrongAnswer3)];
        [_ButtonA_Label setTitle:[arrayName objectAtIndex:(wrongAnswer1)] forState:UIControlStateNormal];
        [_ButtonB_Label setTitle:[arrayName objectAtIndex:(selectedPic)] forState:UIControlStateNormal];
        [_ButtonC_Label setTitle:[arrayName objectAtIndex:(wrongAnswer2)] forState:UIControlStateNormal];
        [_ButtonD_Label setTitle:[arrayName objectAtIndex:(wrongAnswer3)] forState:UIControlStateNormal];
    }
    
    if (correctAnswer == 2) {
        
        select1.text = [arrayName objectAtIndex:(wrongAnswer1)];
        select2.text = [arrayName objectAtIndex:(wrongAnswer2)];
        select3.text = [arrayName objectAtIndex:(selectedPic)];
        select4.text = [arrayName objectAtIndex:(wrongAnswer3)];
        [_ButtonA_Label setTitle:[arrayName objectAtIndex:(wrongAnswer1)] forState:UIControlStateNormal];
        [_ButtonB_Label setTitle:[arrayName objectAtIndex:(wrongAnswer2)] forState:UIControlStateNormal];
        [_ButtonC_Label setTitle:[arrayName objectAtIndex:(selectedPic)] forState:UIControlStateNormal];
        [_ButtonD_Label setTitle:[arrayName objectAtIndex:(wrongAnswer3)] forState:UIControlStateNormal];
    }
    
    if (correctAnswer == 3) {
        
        select1.text = [arrayName objectAtIndex:(wrongAnswer1)];
        select2.text = [arrayName objectAtIndex:(wrongAnswer2)];
        select3.text = [arrayName objectAtIndex:(wrongAnswer3)];
        select4.text = [arrayName objectAtIndex:(selectedPic)];
        [_ButtonA_Label setTitle:[arrayName objectAtIndex:(wrongAnswer1)] forState:UIControlStateNormal];
        [_ButtonB_Label setTitle:[arrayName objectAtIndex:(wrongAnswer2)] forState:UIControlStateNormal];
        [_ButtonC_Label setTitle:[arrayName objectAtIndex:(wrongAnswer3)] forState:UIControlStateNormal];
        [_ButtonD_Label setTitle:[arrayName objectAtIndex:(selectedPic)] forState:UIControlStateNormal];
    }
    
}

-(IBAction)buttonA {
    
    if (correctAnswer == 0) {
        
        correct.hidden = NO;
        wrong.hidden = YES;
    }
    else {
        wrong.hidden = NO;
        correct.hidden = YES;
    }
}

-(IBAction)buttonB {
    
    if (correctAnswer == 1) {
        
        correct.hidden = NO;
        wrong.hidden = YES;
    }
    else {
        wrong.hidden = NO;
        correct.hidden = YES;
    }
}

-(IBAction)buttonC {
    
    if (correctAnswer == 2) {
        
        correct.hidden = NO;
        wrong.hidden = YES;
    }
    else {
        wrong.hidden = NO;
        correct.hidden = YES;
    }
}

-(IBAction)buttonD {
    
    if (correctAnswer == 3) {
        
        correct.hidden = NO;
        wrong.hidden = YES;
    }
    else {
        wrong.hidden = NO;
        correct.hidden = YES;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"hexellence_x2.png"]]];
    
    //Attempting Quartz Core
    [self.theQuestion.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [self.theQuestion.layer setBorderWidth:2.0];
    self.theQuestion.layer.cornerRadius = 10;
    self.theQuestion.clipsToBounds = YES;
    
	
    arrayPic = [NSArray arrayWithObjects:@"The tendency to avoid options for which missing information makes the probability seem 'unknown.'",
                @"The tendency to rely too heavily, or 'anchor,' on one trait or piece of information when making decisions.",
                @"The tendency of our perception to be affected by our recurring thoughts. ",
                @"The tendency to overestimate the likelihood of events with greater 'availability' in memory, which can be influenced by how recent the memories are or how unusual or emotionally charged they may be.",
                @"A self-reinforcing process in which a collective belief gains more and more plausibility through its increasing repetition in public discourse (or 'repeat something long enough and it will become true').",
                @"When people react to disconfirming evidence by strengthening their beliefs.",
                @"The tendency to do (or believe) things because many other people do (or believe) the same. Related to groupthink and herd behavior.",
                @"The tendency to ignore base rate information (generic, general information) and focus on specific information (information only pertaining to a certain case).",
                @"An effect where someone's evaluation of the logical strength of an argument is biased by the believability of the conclusion.",
                @"The tendency to see oneself as less biased than other people, or to be able to identify more cognitive biases in others than in oneself.",
                @"The tendency for people to appear more attractive in a group than in isolation.",
                @"The tendency to remember one's choices as better than they actually were.",
                @"The tendency to over-expect small runs, streaks, or clusters in large samples of random data (that is, seeing phantom patterns).",
                @"The tendency to search for, interpret, focus on and remember information in a way that confirms one's preconceptions.",
                @"The tendency to test hypotheses exclusively through direct testing, instead of testing possible alternative hypotheses.",
                @"The tendency to assume that specific conditions are more probable than general ones.",
                @"A certain state of mind wherein high values and high likelihoods are overestimated while low values and low likelihoods are underestimated.",
                @"The tendency to insufficiently revise one's belief when presented with new evidence.",
                @"The enhancement or reduction of a certain perception's stimuli when compared with a recently observed, contrasting object.",
                @"When better-informed people find it extremely difficult to think about problems from the perspective of lesser-informed people.",
                @"Preferences for either option A or B changes in favor of option B when option C is presented, which is similar to option B but in no way better.",
                @"The tendency to spend more money when it is denominated in small amounts (e.g. coins) rather than large amounts (e.g. bills).",
                @"The tendency to view two options as more dissimilar when evaluating them simultaneously than when evaluating them separately.",
                @"The neglect of the duration of an episode in determining its value",
                @"The tendency to underestimate the influence or strength of feelings, in either oneself or others.",
                @"The fact that people often demand much more to give up an object than they would be willing to pay to acquire it.",
                @"Based on the estimates, real-world evidence turns out to be less extreme than our expectations (conditionally inverse of the conservatism bias).",
                @"The tendency for experimenters to believe, certify, and publish data that agree with their expectations for the outcome of an experiment, and to disbelieve, discard, or downgrade the corresponding weightings for data that appear to conflict with those expectations.",
                @"Limits a person to using an object only in the way it is traditionally used.",
                @"The tendency to place too much importance on one aspect of an event.",
                @"The observation that individuals will give high accuracy ratings to descriptions of their personality that supposedly are tailored specifically for them, but are in fact vague and general enough to apply to a wide range of people. This effect can provide a partial explanation for the widespread acceptance of some beliefs and practices, such as astrology, fortune telling, graphology, and some types of personality tests.",
                @"Drawing different conclusions from the same information, depending on how or by whom that information is presented.",
                @"The illusion in which a word, a name or other thing that has recently come to one's attention suddenly seems to appear with improbable frequency shortly afterwards (see also recency illusion).",
                @"The tendency to think that future probabilities are altered by past events, when in reality they are unchanged. Results from an erroneous conceptualization of the law of large numbers. For example, 'I've flipped heads with this coin five times consecutively, so the chance of tails coming out on the sixth flip is much greater than heads.'",
                @"Based on a specific level of task difficulty, the confidence in judgments is too conservative and not extreme enough",
                @"Sometimes called the 'I-knew-it-all-along' effect, the tendency to see past events as being predictable at the time those events happened.",
                @"The tendency to see a media report as being biased, owing to one's own strong partisan views.",
                @"The 'hot-hand fallacy' (also known as the 'hot hand phenomenon' or 'hot hand') is the fallacious belief that a person who has experienced success has a greater chance of further success in additional attempts.",
                @"The tendency for people to have a stronger preference for more immediate payoffs relative to later payoffs, where the tendency increases the closer to the present both payoffs are.  Also known as current moment bias, present-bias, and related to Dynamic inconsistency.",
                @"The tendency to respond more strongly to a single identified person at risk than to a large group of people at risk.",
                @"The tendency to overestimate one's degree of influence over other external events.",
                @"Belief that additional acquired information generates additional relevant data for predictions, even when it evidently does not.",
                @"Inaccurately perceiving a relationship between two unrelated events.",
                @"The tendency for people to place a disproportionately high value on objects that they partially assembled themselves, such as furniture from IKEA, regardless of the quality of the end result.",
                @"The tendency to overestimate the length or the intensity of the impact of future feeling states.",
                @"The tendency to seek information even when it cannot affect action.",
                @"The tendency to under-expect variation in small samples",
                @"The phenomenon where people justify increased investment in a decision, based on the cumulative prior investment, despite new evidence suggesting that the decision was probably wrong.",
                @"The tendency for people to want to believe that the world is fundamentally just, causing them to rationalize an otherwise inexplicable injustice as deserved by the victim(s).",
                @"The tendency to prefer a smaller set to a larger set judged separately, but not jointly",
                @"the disutility of giving up an object is greater than the utility associated with acquiring it.  (see also Sunk cost effects and endowment effect).",
                @"The misuse of games to model real-life situations.",
                @"The tendency to express undue liking for things merely because of familiarity with them.",
                @"The tendency to concentrate on the nominal (face value) of money rather than its value in terms of purchasing power.",
                @"The tendency of a track record of non-prejudice to increase subsequent prejudice.",
                @"The tendency of people, when evaluating the causes of the behaviors of a person they dislike, to attribute their positive behaviors to the environment and their negative behaviors to the person's inherent nature or of young people to be more negative information in the descriptions of others",
                @"Psychological phenomenon by which humans have a greater recall of unpleasant memories compared with positive memories.",
                @"The tendency to completely disregard probability when making a decision under uncertainty.",
                @"The refusal to plan for, or react to, a disaster which has never happened before.",
                @"The effect of suddenly noticing things that were not noticed previously – and as a result wrongly assuming that the frequency has increased.",
                @"When a researcher expects a given result and therefore unconsciously manipulates an experiment or misinterprets data in order to find it (see also subject-expectancy effect).",
                @"The tendency to judge harmful actions as worse, or less moral, than equally harmful omissions (inactions).",
                @"The tendency to be over-optimistic, overestimating favorable and pleasing outcomes (see also wishful thinking, valence effect, positive outcome bias).",
                @"Ignoring an obvious (negative) situation.",
                @"The tendency to judge a decision by its eventual outcome instead of based on the quality of the decision at the time it was made.",
                @"Excessive confidence in one's own answers to questions.",
                @"A vague and random stimulus (often an image or sound) is perceived as significant, e.g., seeing images of animals or faces in clouds, the man in the moon, and hearing non-existent hidden messages on records played in reverse.",
                @"The tendency for some people, especially those suffering from depression, to overestimate the likelihood of negative things happening to them.",
                @"The tendency to underestimate task-completion times.",
                @"The tendency to persuade oneself through rational argument that a purchase was a good value.",
                @"The tendency to have an excessive optimism towards an invention or innovation's usefulness throughout society, while often failing to identify its limitations and weaknesses.",
                @"The tendency to make risk-averse choices if the expected outcome is positive, but make risk-seeking choices to avoid negative outcomes.",
                @"The urge to do the opposite of what someone wants you to do out of a need to resist a perceived attempt to constrain your freedom of choice.",
                @"Devaluing proposals only because they are purportedly originated with an adversary.",
                @"The illusion that a word or language usage is a recent innovation when it is in fact long-established (see also frequency illusion).",
                @"The tendency to overestimate one's ability to show restraint in the face of temptation.",
                @"Rhyming statements are perceived as more truthful. A famous example being used in the O.J Simpson trial with the defense's use of the phrase 'If the gloves don't fit, then you must acquit.'",
                @"The tendency to take greater risks when perceived safety increases.",
                @"The tendency for expectations to affect perception.",
                @"The tendency to reject new evidence that contradicts a paradigm.",
                @"The tendency, when making hiring decisions, to favour potential candidates who don't compete with one's own particular strengths.",
                @"The tendency to over-report socially desirable characteristics or behaviours in one self and under-report socially undesirable characteristics or behaviours.",
                @"The tendency to like things to stay relatively the same (see also loss aversion, endowment effect, and system justification).",
                @"Expecting a member of a group to have certain characteristics without having actual information about that individual.",
                @"The tendency to judge probability of the whole to be less than the probabilities of the parts.",
                @"Perception that something is true if a subject's belief demands it to be true. Also assigns perceived connections between coincidences.",
                @"Concentrating on the people or things that 'survived' some process and inadvertently overlooking those that didn't because of their lack of visibility.",
                @"Underestimations of the time that could be saved (or lost) when increasing (or decreasing) from a relatively low speed and overestimations of the time that could be saved (or lost) when increasing (or decreasing) from a relatively high speed.",
                @"The tendency to want to finish a given unit of a task or an item. Strong effects on the consumption of food in particular.",
                @"Underestimation of the duration taken to traverse oft-traveled routes and overestimation of the duration taken to traverse less familiar routes.",
                @"Preference for reducing a small risk to zero over a greater reduction in a larger risk.",
                @"Intuitively judging a situation to be zero-sum (i.e., that gains and losses are correlated). Derives from the zero-sum game in game theory, where wins and losses sum to zero.  The frequency with which this bias occurs may be related to the social dominance orientation personality factor.",
                @"The tendency for explanations of other individuals' behaviors to overemphasize the influence of their personality and underemphasize the influence of their situation (see also Fundamental attribution error), and for explanations of one's own behaviors to do the opposite (that is, to overemphasize the influence of our situation and underemphasize the influence of our own personality).",
                @"Attributing more blame to a harm-doer as the outcome becomes more severe or as personal or situational similarity to the victim increases.",
                @"An effect in which incompetent people fail to realise they are incompetent because they lack the skill to distinguish between competence and incompetence. Actual competence may weaken self-confidence, as competent individuals may falsely assume that others have an equivalent understanding.",
                @"Occurs when people claim more responsibility for themselves for the results of a joint action than an outside observer would credit them.",
                @"An exception to the fundamental attribution error, when people view others as having (situational) extrinsic motivations and (dispositional) intrinsic motivations for oneself",
                @"The tendency for people to overestimate the degree to which others agree with them.",
                @"The tendency to give high accuracy ratings to descriptions of their personality that supposedly are tailored specifically for them, but are in fact vague and general enough to apply to a wide range of people. For example, horoscopes.",
                @"The tendency for people to over-emphasize personality-based explanations for behaviors observed in others while under-emphasizing the role and power of situational influences on the same behavior (see also actor-observer bias, group attribution error, positivity effect, and negativity effect).",
                @"The biased belief that the characteristics of an individual group member are reflective of the group as a whole or the tendency to assume that group decision outcomes reflect the preferences of group members, even when information is available that clearly suggests otherwise.",
                @"The tendency for a person's positive or negative traits to 'spill over' from one personality area to another in others' perceptions of them (see also physical attractiveness stereotype).",
                @"People perceive their knowledge of their peers to surpass their peers' knowledge of them.",
                @"When people view self-generated preferences as instead being caused by insightful, effective and benevolent agents",
                @"People overestimate others' ability to know them, and they also overestimate their ability to know others.",
                @"Overestimating one's desirable qualities, and underestimating undesirable qualities, relative to other people. (Also known as 'Lake Wobegon effect,' 'better-than-average effect,' or 'superiority bias').",
                @"The tendency for people to give preferential treatment to others they perceive to be members of their own groups.",
                @"The tendency for people to believe that the world is just and therefore people 'get what they deserve.'",
                @"The tendency for people to ascribe greater or lesser moral standing based on the outcome of an event",
                @"Expecting more egocentric bias in others than in oneself",
                @"Individuals see members of their own group as being relatively more varied than members of other groups.",
                @"The tendency to unconsciously assume that others (or one's future selves) share one's current emotional states, thoughts and values.",
                @"The tendency to claim more responsibility for successes than failures. It may also manifest itself as a tendency for people to evaluate ambiguous information in a way beneficial to their interests (see also group-serving bias).",
                @"Known as the tendency for group members to spend more time and energy discussing information that all members are already familiar with (i.e., shared information), and less time and energy discussing information that only some members are aware of (i.e., unshared information).",
                @"The tendency to defend and bolster the status quo. Existing social, economic, and political arrangements tend to be preferred, and alternatives disparaged sometimes even at the expense of individual and collective self-interest.",
                @"The tendency for people to view themselves as relatively variable in terms of personality, behavior, and mood while viewing others as much more predictable.",
                @"Similar to the fundamental attribution error, in this error a person is likely to make an internal attribution to an entire group instead of the individuals within the group.",
                @"A tendency to believe ourselves to be worse than others at tasks which are difficult.",
                @"Bizarre material is better remembered than common material.",
                @"In a self-justifying manner retroactively ascribing one's choices to be more informed than they were when they were made.",
                @"After an investment of effort in producing change, remembering one's past performance as more difficult than it actually was.",
                @"The retention of few memories from before the age of four.",
                @"Tendency to remember high values and high likelihoods/probabilities/frequencies lower than they actually were and low ones higher than they actually were. ",
                @"Incorrectly remembering one's past attitudes and behaviour as resembling present attitudes and behaviour.",
                @"That cognition and memory are dependent on context, such that out-of-context memories are more difficult to retrieve than in-context memories (e.g., recall time and accuracy for a work-related memory will be lower at home, and vice versa)",
                @"The tendency for people of one race to have difficulty identifying members of a race other than their own.",
                @"A form of misattribution where a memory is mistaken for imagination, because there is no subjective experience of it being a memory.",
                @"Recalling the past in a self-serving manner, e.g., remembering one's exam grades as being better than they were, or remembering a caught fish as bigger than it really was.",
                @"A bias in which the emotion associated with unpleasant memories fades more quickly than the emotion associated with positive events.",
                @"A form of misattribution where imagination is mistaken for a memory.",
                @"That self-generated information is remembered best. For instance, people are better able to recall memories of statements that they have generated than similar statements generated by others.",
                @"The tendency to forget information that can be found readily online by using Internet search engines .",
                @"The inclination to see past events as being more predictable than they actually were; also called the 'I-knew-it-all-along' effect.",
                @"That humorous items are more easily remembered than non-humorous ones, which might be explained by the distinctiveness of humor, the increased cognitive processing time to understand the humor, or the emotional arousal caused by the humor.",
                @"That people are more likely to identify as true statements those they have previously heard (even if they cannot consciously remember having heard them), regardless of the actual validity of the statement. In other words, a person is more likely to believe a familiar statement than an unfamiliar one.",
                @"Inaccurately remembering a relationship between two events.",
                @"Memory distortions introduced by the loss of details in a recollection over time, often concurrent with sharpening or selective recollection of certain details that take on exaggerated significance in relation to the details or aspects of the experience lost through leveling. Both biases may be reinforced over time, and by repeated recollection or re-telling of a memory.",
                @"That different methods of encoding information into memory have different levels of effectiveness.",
                @"A smaller percentage of items are remembered in a longer list, but as the length of the list increases, the absolute number of items remembered increases as well.",
                @"Memory becoming less accurate because of interference from post-event information.",
                @"That memory recall is higher for the last items of a list when the list items were received via speech than when they were received through writing.",
                @"The improved recall of information congruent with one's current mood.",
                @"That a person in a group has diminished recall for the words of others who spoke immediately before himself, if they take turns speaking.",
                @"That being shown some items from a list and later retrieve one item causes it to become harder to retrieve the other items",
                @"That people seem to perceive not the sum of an experience but the average of how it was at its peak (e.g. pleasant or unpleasant) and how it ended.",
                @"The unwanted recurrence of memories of a traumatic event.",
                @"The notion that concepts that are learned by viewing pictures are more easily and frequently recalled than are concepts that are learned by viewing their written word form counterparts.",
                @"That older adults favor positive over negative information in their memories.",
                @"That items near the end of a sequence are the easiest to recall, followed by the items at the beginning of a sequence; items in the middle are the least likely to be remembered.",
                @"That information which is read longer time and more thought about (more diffculty processed) is easier remembered.",
                @"The recalling of more personal events from adolescence and early adulthood than personal events from other lifetime periods",
                @"The remembering of the past as having been better than it really was.",
                @"That memories relating to the self are better recalled than similar information relating to others.",
                @"Confusing episodic memories with other information, creating distorted memories.",
                @"(Lag Effect) That information is better recalled if exposure to it is repeated over a long span of time rather than a short one.",
                @"Memory distorted towards stereotypes (e.g. racial or gender)",
                @"Diminish of the recency effect  because  a sound item is appended to the list that the subject is not required to recall.",
                @"A form of misattribution where ideas suggested by a questioner are mistaken for memory.",
                @"The tendency to displace recent events backward in time and remote events forward in time, so that recent events appear more remote, and remote events, more recent.",
                @"The fact that you easier remember information you have read by rewriting it instead of rereading it.",
                @"When a subject is able to recall parts of an item, or related information, but is frustratingly unable to recall the whole item. This is thought an instance of 'blocking' where multiple similar memories are being recalled and interfere with each other.",
                @"That the 'gist' of what someone has said is better remembered than the verbatim wording.  This is because memories are representations and not carbon copy clones.",
                @"That an item that sticks out is more likely to be remembered than other items",
                @"That uncompleted or interrupted tasks are remembered better than completed ones.",
                nil];
    
    arrayName = [NSArray arrayWithObjects:
                 @"Ambiguity effect",
                 @"Anchoring or focalism",
                 @"Attentional bias",
                 @"Availability heuristic",
                 @"Availability cascade",
                 @"Backfire effect",
                 @"Bandwagon effect",
                 @"Base rate fallacy or base rate neglect",
                 @"Belief bias",
                 @"Bias blind spot",
                 @"Cheerleader effect",
                 @"Choice-supportive bias",
                 @"Clustering illusion",
                 @"Confirmation bias",
                 @"Congruence bias",
                 @"Conjunction fallacy",
                 @"Conservatism or regressive bias",
                 @"Conservatism (Bayesian)",
                 @"Contrast effect",
                 @"Curse of knowledge",
                 @"Decoy effect",
                 @"Denomination effect",
                 @"Distinction bias",
                 @"Duration neglect",
                 @"Empathy gap",
                 @"Endowment effect",
                 @"Exaggerated expectation",
                 @"Experimenter's or expectation bias",
                 @"Functional fixedness",
                 @"Focusing effect",
                 @"Forer effect or Barnum effect",
                 @"Framing effect",
                 @"Frequency illusion",
                 @"Gambler's fallacy",
                 @"Hard-easy effect",
                 @"Hindsight bias",
                 @"Hostile media effect",
                 @"Hot-hand fallacy",
                 @"Hyperbolic discounting",
                 @"Identifiable victim effect",
                 @"Illusion of control",
                 @"Illusion of validity",
                 @"Illusory correlation",
                 @"IKEA effect",
                 @"Impact bias",
                 @"Information bias",
                 @"Insensitivity to sample size",
                 @"Irrational escalation",
                 @"Just-world hypothesis",
                 @"Less-is-better effect",
                 @"Loss aversion",
                 @"Ludic fallacy",
                 @"Mere exposure effect",
                 @"Money illusion",
                 @"Moral credential effect",
                 @"Negativity effect",
                 @"Negativity bias",
                 @"Neglect of probability",
                 @"Normalcy bias",
                 @"Observation selection bias",
                 @"Observer-expectancy effect",
                 @"Omission bias",
                 @"Optimism bias",
                 @"Ostrich effect",
                 @"Outcome bias",
                 @"Overconfidence effect",
                 @"Pareidolia",
                 @"Pessimism bias",
                 @"Planning fallacy",
                 @"Post-purchase rationalization",
                 @"Pro-innovation bias",
                 @"Pseudocertainty effect",
                 @"Reactance",
                 @"Reactive devaluation",
                 @"Recency illusion",
                 @"Restraint bias",
                 @"Rhyme as reason effect",
                 @"Risk compensation / Peltzman effect",
                 @"Selective perception",
                 @"Semmelweis reflex",
                 @"Social comparison bias",
                 @"Social desirability bias",
                 @"Status quo bias",
                 @"Stereotyping",
                 @"Subadditivity effect",
                 @"Subjective validation",
                 @"Survivorship bias",
                 @"Time-saving bias",
                 @"Unit bias",
                 @"Well travelled road effect",
                 @"Zero-risk bias",
                 @"Zero-sum heuristic",
                 @"Actor-observer bias",
                 @"Defensive attribution hypothesis",
                 @"Dunning–Kruger effect",
                 @"Egocentric bias",
                 @"Extrinsic incentives bias",
                 @"False consensus effect",
                 @"Forer effect (aka Barnum effect)",
                 @"Fundamental attribution error",
                 @"Group attribution error",
                 @"Halo effect",
                 @"Illusion of asymmetric insight",
                 @"Illusion of external agency",
                 @"Illusion of transparency",
                 @"Illusory superiority",
                 @"Ingroup bias",
                 @"Just-world phenomenon",
                 @"Moral luck",
                 @"Naive cynicism",
                 @"Outgroup homogeneity bias",
                 @"Projection bias",
                 @"Self-serving bias",
                 @"Shared information bias",
                 @"System justification",
                 @"Trait ascription bias",
                 @"Ultimate attribution error",
                 @"Worse-than-average effect",
                 @"Bizarreness effect",
                 @"Choice-supportive bias",
                 @"Change bias",
                 @"Childhood amnesia",
                 @"Conservatism or Regressive Bias",
                 @"Consistency bias",
                 @"Context effect",
                 @"Cross-race effect",
                 @"Cryptomnesia",
                 @"Egocentric bias",
                 @"Fading affect bias",
                 @"False memory",
                 @"Generation effect (Self-generation effect)",
                 @"Google effect",
                 @"Hindsight bias",
                 @"Humor effect",
                 @"Illusion of truth effect",
                 @"Illusory correlation",
                 @"Leveling and Sharpening",
                 @"Levels-of-processing effect",
                 @"List-length effect",
                 @"Misinformation effect",
                 @"Modality effect",
                 @"Mood-congruent memory bias",
                 @"Next-in-line effect",
                 @"Part-list cueing effect",
                 @"Peak-end rule",
                 @"Persistence",
                 @"Picture superiority effect",
                 @"Positivity effect",
                 @"Primacy effect, Recency effect & Serial position effect",
                 @"Processing difficulty effect",
                 @"Reminiscence bump",
                 @"Rosy retrospection",
                 @"Self-relevance effect",
                 @"Source confusion",
                 @"Spacing effect",
                 @"Stereotypical bias",
                 @"Suffix effect",
                 @"Suggestibility",
                 @"Telescoping effect",
                 @"Testing effect",
                 @"Tip of the tongue phenomenon",
                 @"Verbatim effect",
                 @"Von Restorff effect",
                 @"Zeigarnik effect", nil];
    
    correct.hidden = YES;
    wrong.hidden = YES;
    
    //Set arc4random range
    diff = 1;
    if (diff == 1) fromNum = [arrayName count];
    if (diff == 2) fromNum = 22;
    if (diff == 3) fromNum = 0;
    
    selectedPic = (arc4random ()%[arrayName count]);
    wrongAnswer1 = (arc4random ()%[arrayName count]);
    wrongAnswer2 = (arc4random ()%[arrayName count]);
    wrongAnswer3 = (arc4random ()%[arrayName count]);
    
    while (selectedPic == wrongAnswer1 || selectedPic == wrongAnswer2 || selectedPic == wrongAnswer3 || wrongAnswer1 == wrongAnswer2 || wrongAnswer1 == wrongAnswer3 || wrongAnswer2 == wrongAnswer3) {
        
        selectedPic = (arc4random ()%[arrayName count]);
        wrongAnswer1 = (arc4random ()%[arrayName count]);
        wrongAnswer2 = (arc4random ()%[arrayName count]);
        wrongAnswer3 = (arc4random ()%[arrayName count]);
        
    }
    
    //Set the Pic
    self.theQuestion.text = [arrayPic objectAtIndex:selectedPic];
    correctAnswer = arc4random() % 4; //Choose correct answer
    
    if (correctAnswer == 0) {
        select1.text = [arrayName objectAtIndex:(selectedPic)];
        select2.text = [arrayName objectAtIndex:(wrongAnswer1)];
        select3.text = [arrayName objectAtIndex:(wrongAnswer2)];
        select4.text = [arrayName objectAtIndex:(wrongAnswer3)];
        [_ButtonA_Label setTitle:[arrayName objectAtIndex:(selectedPic)] forState:UIControlStateNormal];
        [_ButtonB_Label setTitle:[arrayName objectAtIndex:(wrongAnswer1)] forState:UIControlStateNormal];
        [_ButtonC_Label setTitle:[arrayName objectAtIndex:(wrongAnswer2)] forState:UIControlStateNormal];
        [_ButtonD_Label setTitle:[arrayName objectAtIndex:(wrongAnswer3)] forState:UIControlStateNormal];
    }
    
    if (correctAnswer == 1) {
        
        select1.text = [arrayName objectAtIndex:(wrongAnswer1)];
        select2.text = [arrayName objectAtIndex:(selectedPic)];
        select3.text = [arrayName objectAtIndex:(wrongAnswer2)];
        select4.text = [arrayName objectAtIndex:(wrongAnswer3)];
        [_ButtonA_Label setTitle:[arrayName objectAtIndex:(wrongAnswer1)] forState:UIControlStateNormal];
        [_ButtonB_Label setTitle:[arrayName objectAtIndex:(selectedPic)] forState:UIControlStateNormal];
        [_ButtonC_Label setTitle:[arrayName objectAtIndex:(wrongAnswer2)] forState:UIControlStateNormal];
        [_ButtonD_Label setTitle:[arrayName objectAtIndex:(wrongAnswer3)] forState:UIControlStateNormal];
    }
    
    if (correctAnswer == 2) {
        
        select1.text = [arrayName objectAtIndex:(wrongAnswer1)];
        select2.text = [arrayName objectAtIndex:(wrongAnswer2)];
        select3.text = [arrayName objectAtIndex:(selectedPic)];
        select4.text = [arrayName objectAtIndex:(wrongAnswer3)];
        [_ButtonA_Label setTitle:[arrayName objectAtIndex:(wrongAnswer1)] forState:UIControlStateNormal];
        [_ButtonB_Label setTitle:[arrayName objectAtIndex:(wrongAnswer2)] forState:UIControlStateNormal];
        [_ButtonC_Label setTitle:[arrayName objectAtIndex:(selectedPic)] forState:UIControlStateNormal];
        [_ButtonD_Label setTitle:[arrayName objectAtIndex:(wrongAnswer3)] forState:UIControlStateNormal];
    }
    
    if (correctAnswer == 3) {
        
        select1.text = [arrayName objectAtIndex:(wrongAnswer1)];
        select2.text = [arrayName objectAtIndex:(wrongAnswer2)];
        select3.text = [arrayName objectAtIndex:(wrongAnswer3)];
        select4.text = [arrayName objectAtIndex:(selectedPic)];
        [_ButtonA_Label setTitle:[arrayName objectAtIndex:(wrongAnswer1)] forState:UIControlStateNormal];
        [_ButtonB_Label setTitle:[arrayName objectAtIndex:(wrongAnswer2)] forState:UIControlStateNormal];
        [_ButtonC_Label setTitle:[arrayName objectAtIndex:(wrongAnswer3)] forState:UIControlStateNormal];
        [_ButtonD_Label setTitle:[arrayName objectAtIndex:(selectedPic)] forState:UIControlStateNormal];
    }
    
}

- (void)viewDidUnload
{
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
