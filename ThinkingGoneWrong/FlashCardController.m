//
//  FlashCardController.m
//  FlashcardTest
//
//  Created by Kevin Akers on 10/1/12.
//  Copyright (c) 2012 Kevin Akers. All rights reserved.
//

#import "FlashCardController.h"

@interface FlashCardController ()

@end

@implementation FlashCardController




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction) reveal {

    
    if (revealed) {
        
        [UIView animateWithDuration:0.2 animations:^
         {
             _theAnswer.alpha = 1;
             _question.alpha = 0;
         }];
        

        revealed = NO;
        
    }
    else {
        [UIView animateWithDuration:0.2 animations:^
         {
             _theAnswer.alpha = 0;
             _question.alpha = 1;
         }];
        

        revealed = YES;
    }
    
}

- (IBAction) random {
    
    //Change to fit number of questions
    card = arc4random () % [arrayQuestions count];

    _question.text = [arrayQuestions objectAtIndex:card];
    _theAnswer.text = [arrayAnswers objectAtIndex:card];
    _theAnswer.alpha = 1;
    _question.alpha = 0;
    revealed = NO;
}


- (IBAction) previous {
    
    if (card > 0) {
        card--;
        

    _question.text = [arrayQuestions objectAtIndex:card];
    _theAnswer.text = [arrayAnswers objectAtIndex:card];
    _theAnswer.alpha = 1;
    _question.alpha = 0;
    revealed = NO;

    }
    else {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Turn Around!"
                                                          message:@"This is the first card, hit next"
                                                         delegate:nil
                                                cancelButtonTitle:@"Close"
                                                otherButtonTitles:nil];
        
        [message show];
    }
    
    
}

- (IBAction) next {
    
    //PUT MAX NUMBER OF CARDS HERE
    if (card < [arrayQuestions count] - 1 ) {
        card++;
        

        _question.text = [arrayQuestions objectAtIndex:card];
        _theAnswer.text = [arrayAnswers objectAtIndex:card];
        _theAnswer.alpha = 1;
        _question.alpha = 0;
        revealed = NO;

    }
    else {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Turn Back!"
                                                          message:@"This is the last card, hit previous"
                                                         delegate:nil
                                                cancelButtonTitle:@"Close"
                                                otherButtonTitles:nil];
        
        [message show];
    }
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"hexellence_x2.png"]]];
    
    //Attempting Quartz Core
    [self.question.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [self.question.layer setBorderWidth:2.0];
    self.question.layer.cornerRadius = 10;
    self.question.clipsToBounds = YES;
    
    [self.theAnswer.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [self.theAnswer.layer setBorderWidth:2.0];
    self.theAnswer.layer.cornerRadius = 10;
    self.theAnswer.clipsToBounds = YES;
	
    arrayQuestions = [NSArray arrayWithObjects:@"Affirmative conclusion from a negative premise",
                      @"Affirming the consequent",
                      @"Affirming a disjunct",
                      @"Appeal to probability",
                      @"Argument from fallacy",
                      @"Base Rate fallacy",
                      @"Conjunction fallacy",
                      @"Denying the antecedent",
                      @"Existential fallacy",
                      @"Fallacy of exclusive premises",
                      @"Fallacy of four terms",
                      @"Fallacy of the undistributed middle",
                      @"Illicit major",
                      @"Illicit minor",
                      @"Masked man fallacy",
                      @"Negative conclusion from affirmative premises",
                      @"Accident",
                      @"Abusive fallacy",
                      @"Ad hominem ",
                      @"Ambiguous middle term",
                      @"Appeal to accomplishment",
                      @"Appeal to authority",
                      @"Appeal to common sense",
                      @"Appeal to consequences",
                      @"Appeal to emotion",
                      @"Appeal to equality",
                      @"Appeal to motive",
                      @"Appeal to nature",
                      @"Appeal to novelty",
                      @"Appeal to poverty",
                      @"Appeal to tradition",
                      @"Appeal to wealth",
                      @"Argument from ignorance",
                      @"Argument from repetition",
                      @"Argument from silence",
                      @"Argument to moderation",
                      @"Argumentum ad baculum",
                      @"Argumentum ad hominem",
                      @"Argumentum ad populum",
                      @"Argumentum verbosium",
                      @"Association fallacy",
                      @"Bulverism",
                      @"Burden of proof",
                      @"Cherry picking",
                      @"Chronological snobbery",
                      @"Circular reasoning",
                      @"Circular cause and consequence",
                      @"Continuum fallacy",
                      @"Correlation proves causation",
                      @"Ecological fallacy",
                      @"Equivocation",
                      @"Etymological fallacy",
                      @"Fallacy of composition ",
                      @"Fallacy of division",
                      @"Fallacy of many questions",
                      @"Fallacy of quoting out of context",
                      @"Fallacy of relative privation",
                      @"Fallacy of the single cause",
                      @"False analogy",
                      @"False attribution",
                      @"False authority",
                      @"False dilemma",
                      @"Gambler's fallacy",
                      @"Genetic fallacy",
                      @"Hasty generalization",
                      @"Hedging",
                      @"Historian's fallacy",
                      @"Homunculus fallacy",
                      @"If-by-whiskey",
                      @"Ignoratio elenchi",
                      @"Incomplete comparison",
                      @"Inconsistent comparison",
                      @"Inductive fallacy",
                      @"Inflation of conflict",
                      @"Judgmental language",
                      @"Kettle logic",
                      @"Ludic fallacy",
                      @"Mind projection fallacy",
                      @"Misleading vividness",
                      @"Moralistic fallacy",
                      @"Moral high ground fallacy",
                      @"Moving the goalposts",
                      @"Naturalistic fallacy",
                      @"Naturalistic fallacy fallacy",
                      @"Nirvana fallacy",
                      @"No true Scotsman",
                      @"Onus probandi",
                      @"Overwhelming exception",
                      @"Pathetic fallacy",
                      @"Petitio principii ",
                      @"Poisoning the well",
                      @"Post hoc ergo propter hoc",
                      @"Proof by verbosity",
                      @"Prosecutor's fallacy",
                      @"Psychologist's fallacy",
                      @"Red herring",
                      @"Reductio ad Hitlerum",
                      @"Referential fallacy",
                      @"Regression fallacy",
                      @"Reification",
                      @"Retrospective determinism",
                      @"Shotgun argumentation",
                      @"Special pleading",
                      @"Straw man",
                      @"Suppressed correlative",
                      @"Texas sharpshooter fallacy",
                      @"Thought-terminating cliché",
                      @"Tu quoque",
                      @"Two wrongs make a right",
                      @"Wishful thinking",
                      @"Wrong direction",
        
                      
                      nil];
    
    arrayAnswers = [NSArray arrayWithObjects:@"(illicit negative) – when a categorical syllogism has a positive conclusion, but at least one negative premise.",
                    @"the antecedent in an indicative conditional is claimed to be true because the consequent is true; if A, then B; B, therefore A.",
                    @"concluded that one disjunct of a logical disjunction must be false because the other disjunct is true; A or B; A; therefore not B.",
                    @"takes something for granted because it would probably be the case (or might be the case).",
                    @"assumes that if an argument for some conclusion is fallacious, then the conclusion itself is false.",
                    @"making a probability judgement based on conditional probabilities, without taking into account the effect of prior probabilities.",
                    @"assumption that an outcome simultaneously satisfying multiple conditions is more probable than an outcome satisfying a single one of them.",
                    @"the consequent in an indicative conditional is claimed to be false because the antecedent is false; if A, then B; not A, therefore not B.",
                    @"an argument has a universal premise and a particular conclusion.",
                    @"a categorical syllogism that is invalid because both of its premises are negative.",
                    @"(quaternio terminorum) – a categorical syllogism that has four terms.",
                    @"the middle term in a categorical syllogism is not distributed.",
                    @"a categorical syllogism that is invalid because its major term is not distributed in the major premise but distributed in the conclusion.",
                    @"a categorical syllogism that is invalid because its minor term is not distributed in the minor premise but distributed in the conclusion.",
                    @"(illicit substitution of identicals) – the substitution of identical designators in a true statement can lead to a false one.",
                    @"(illicit affirmative) – when a categorical syllogism has a negative conclusion but affirmative premises. ",
                    @"an exception to a generalization is ignored.",
                    @"a subtype of 'ad hominem' when it turns into verbal abuse of the opponent rather than arguing about the originally proposed argument.",
                    @"attacking the arguer instead of the argument.",
                    @"a common ambiguity in syllogisms in which the middle term is equivocated.",
                    @"where an assertion is deemed true or false based on the accomplishments of the proposer.",
                    @"(argumentum ab auctoritate) – where an assertion is deemed true because of the position or authority of the person asserting it.",
                    @"(argument from personal incredulity, divine fallacy) - I cannot imagine how this could be true, therefore it must be false.",
                    @"(argumentum ad consequentiam) – the conclusion is supported by a premise that asserts positive or negative consequences from some course of action in an attempt to distract from the initial discussion.",
                    @"where an argument is made due to the manipulation of emotions, rather than the use of valid reasoning.",
                    @"where an assertion is deemed true or false based on an assumed pretense of equality.",
                    @"where a premise is dismissed by calling into question the motives of its proposer.",
                    @"attempts to prove a claim about ethics by appealing to a definition of the term 'good' in terms of either one or more claims about natural properties.  Judgment is based solely on whether the subject of judgment is 'natural' or 'unnatural'.",
                    @"(argumentum novitatis/antiquitatis) – where a proposal is claimed to be superior or better solely because it is new or modern.",
                    @"(argumentum ad Lazarum) – supporting a conclusion because the arguer is poor (or refuting because the arguer is wealthy). (Opposite of appeal to wealth.)",
                    @"(argumentum ad antiquitam) – a conclusion supported solely because it has long been held to be true.",
                    @"(argumentum ad crumenam) – supporting a conclusion because the arguer is wealthy (or refuting because the arguer is poor).  (Sometimes taken together with the appeal to poverty as a general appeal to the arguer's financial situation.)",
                    @"(appeal to ignorance, argumentum ad ignorantiam) – assuming that a claim is true (or false) because it has not been proven false (true) or cannot be proven false (true).",
                    @"(argumentum ad nauseam) – signifies that it has been discussed extensively until nobody cares to discuss it anymore.",
                    @"(argumentum e silentio) – where the conclusion is based on the absence of evidence, rather than the existence of evidence.",
                    @"(false compromise, middle ground, fallacy of the mean) – assuming that the compromise between two positions is always correct.",
                    @"(appeal to the stick, appeal to force, appeal to threat) – an argument made through coercion or threats of force to support position.",
                    @"the evasion of the actual topic by directing the attack at your opponent.",
                    @"(appeal to widespread belief, bandwagon argument, appeal to the majority, appeal to the people) – where a proposition is claimed to be true or good solely because many people believe it to be so.",
                    @"(proof by verbosity, proof by intimidation) – submission of others to an argument too complex and verbose to reasonably deal with in all its intimate details.",
                    @"(guilt by association) – arguing that because two things share a property they are the same.",
                    @"(Psychogenetic Fallacy) inferring why an argument is being used, associating it to some psychological reason, then assuming it is invalid as a result. It is wrong to assume that if the origin of an idea comes from a biased mind, then the idea itself must also be a false.",
                    @"(see – onus probandi) (shifting the burden of proof) – I need not prove my claim, you must prove it is false.",
                    @"(suppressed evidence, incomplete evidence) – act of pointing at individual cases or data that seem to confirm a particular position, while ignoring a significant portion of related cases or data that may contradict that position.",
                    @"where a thesis is deemed incorrect because it was commonly held when something else, clearly false, was also commonly held.",
                    @"(circulus in demonstrando) – when the reasoner begins with what he or she is trying to end up with; sometimes called assuming the conclusion.",
                    @"where the consequence of the phenomenon is claimed to be its root cause.",
                    @"(fallacy of the beard, line-drawing fallacy, sorites fallacy, fallacy of the heap, bald man fallacy) – improperly rejecting a claim for being imprecise.",
                    @"(cum hoc ergo propter hoc) – a faulty assumption that correlation between two variables implies that one causes the other.",
                    @"inferences about the nature of specific individuals are based solely upon aggregate statistics collected for the group to which those individuals belong.",
                    @"the misleading use of a term with more than one meaning (by glossing over which meaning is intended at a particular time).",
                    @"which reasons that the original or historical meaning of a word or phrase is necessarily similar to its actual present-day meaning.",
                    @"assuming that something true of part of a whole must also be true of the whole.",
                    @"assuming that something true of a thing must also be true of all or some of its parts.",
                    @"(complex question, fallacy of presupposition, loaded question, plurium interrogationum) – someone asks a question that presupposes something that has not been proven or accepted by all the people involved. This fallacy is often used rhetorically, so that the question limits direct replies to those that serve the questioner's agenda.",
                    @"(contextomy) – refers to the selective excerpting of words from their original context in a way that distorts the source's intended meaning.",
                    @"dismissing an argument due to the existence of more important, but unrelated, problems in the world.",
                    @"(causal oversimplification) – it is assumed that there is one, simple cause of an outcome when in reality it may have been caused by a number of only jointly sufficient causes.",
                    @"an argument by analogy in which the analogy is poorly suited.",
                    @"an advocate appeals to an irrelevant, unqualified, unidentified, biased or fabricated source in support of an argument.",
                    @"(single authority) – using an expert of dubious credentials and/or using only one opinion to sell a product or idea. Related to the appeal to authority fallacy.",
                    @"(false dichotomy, fallacy of bifurcation, black-or-white fallacy) – two alternative statements are held to be the only possible options, when in reality there are more.",
                    @"the incorrect belief that separate, independent events can affect the likelihood of another random event. If a coin flip lands on heads 10 times in a row, the belief that it is 'due to the number of times it had previously landed on tails' is incorrect.",
                    @"where a conclusion is suggested based solely on something or someone's origin rather than its current meaning or context.",
                    @"(fallacy of insufficient statistics, fallacy of insufficient sample, fallacy of the lonely fact, leaping to a conclusion, hasty induction, secundum quid, converse accident) – basing a broad conclusion on a small sample.",
                    @"using words with ambiguous meanings, then changing the meaning of them later.",
                    @"occurs when one assumes that decision makers of the past viewed events from the same perspective and having the same information as those subsequently analyzing the decision. (Not to be confused with presentism, which is a mode of historical analysis in which present-day ideas, such as moral standards, are projected into the past.)",
                    @" where a 'middle-man' is used for explanation, this sometimes leads to regressive middle-men. Explains without actually explaining the real nature of a function or a process. Instead, it explains the concept in terms of the concept itself, without first defining or explaining the original concept. Explaining thought as something produced by a little thinker, a sort of homunculus inside the head, merely explains it as another kind of thinking (as different but the same).",
                    @"an argument that supports both sides of an issue by using terms that are selectively emotionally sensitive.",
                    @"(irrelevant conclusion, missing the point) – an argument that may in itself be valid, but does not address the issue in question.",
                    @"in which insufficient information is provided to make a complete comparison.",
                    @"where different methods of comparison are used, leaving one with a false impression of the whole comparison.",
                    @"A more general name to some fallacies, such as hasty generalization. It happens when a conclusion is made of premises which lightly supports it.",
                    @"The experts of a field of knowledge disagree on a certain point, so the scholars must know nothing, and therefore the legitimacy of their entire field is put to question.",
                    @"insulting or pejorative language to influence the recipient's judgment.",
                    @"using multiple inconsistent arguments to defend a position.",
                    @"the belief that the outcomes of non-regulated random occurrences can be encapsulated by a statistic; a failure to take into account unknown unknowns in determining the probability of events taking place.",
                    @"when one considers the way one sees the world as the way the world really is.",
                    @"involves describing an occurrence in vivid detail, even if it is an exceptional occurrence, to convince someone that it is a problem.",
                    @"inferring factual conclusions from purely evaluative premises in violation of fact–value distinction. For instance, inferring is from ought is an instance of moralistic fallacy. Moralistic fallacy is the inverse of naturalistic fallacy.",
                    @"in which one assumes a 'holier-than-thou' attitude in an attempt to make oneself look good to win an argument.",
                    @"(raising the bar) – argument in which evidence presented in response to a specific claim is dismissed and some other (often greater) evidence is demanded.",
                    @"inferring evaluative conclusions from purely factual premises in violation of fact–value distinction.  The inverse of morallistic fallacy.",
                    @"(anti-naturalistic fallacy) – inferring impossibility to infer any instance of ought from is from the general invalidity of is-ought fallacy.  An example of argument from fallacy.",
                    @"(perfect solution fallacy) – when solutions to problems are rejected because they are not perfect.",
                    @"when a generalization is made true only when a counterexample is ruled out on shaky grounds.",
                    @"from Latin onus probandi incumbit ei qui dicit, non ei qui negat the burden of proof is on the person who makes the claim, not on the person who denies (or questions the claim). It is a particular case of the 'argumentum ad ignorantiam' fallacy, here the burden is shifted on the person defending against the assertion.",
                    @"an accurate generalization that comes with qualifications which eliminate so many cases that what remains is much less impressive than the initial statement might have led one to assume.",
                    @" when an inanimate object is declared to have characteristics of animate objects.",
                    @"providing what is essentially the conclusion of the argument as a premise.",
                    @"a type of ad hominem where adverse information about a target is presented with the intention of discrediting everything that the target person says.",
                    @"Latin for 'after this, therefore because of this' (faulty cause/effect, coincidental correlation, correlation without causation) – X happened then Y happened; therefore X caused Y. The Loch Ness Monster has been seen in this loch. Something tipped our boat over; it's obviously the Loch Ness Monster.",
                    @"(argumentum verbosium, proof by intimidation) – submission of others to an argument too complex and verbose to reasonably deal with in all its intimate details.",
                    @"a low probability of false matches does not mean a low probability of some false match being found.",
                    @"an observer presupposes the objectivity of his own perspective when analyzing a behavioral event.",
                    @"a speaker attempts to distract an audience by deviating from the topic at hand by introducing a separate argument which the speaker believes will be easier to speak to.",
                    @"(playing the Nazi card) – comparing an opponent or their argument to Hitler or Nazism in an attempt to associate a position with one that is universally reviled.",
                    @"assuming all words refer to existing things and that the meaning of words reside within the things they refer to, as opposed to words possibly referring no real object or that the meaning of words often comes from how we use them.",
                    @"ascribes cause where none exists. The flaw is failing to account for natural fluctuations. It is frequently a special kind of the post hoc fallacy.",
                    @"(hypostatization) – a fallacy of ambiguity, when an abstraction (abstract belief or hypothetical construct) is treated as if it were a concrete, real event or physical entity. In other words, it is the error of treating as a 'real thing' something which is not a real thing, but merely an idea.",
                    @"the argument that because some event has occurred, its occurrence must have been inevitable beforehand.",
                    @"the arguer offers such a large number of arguments for their position that the opponent can't possibly respond to all of them.",
                    @"where a proponent of a position attempts to cite something as an exemption to a generally accepted rule or principle without justifying the exemption.",
                    @"an argument based on misrepresentation of an opponent's position.",
                    @"where a correlative is redefined so that one alternative is made impossible.",
                    @"improperly asserting a cause to explain a cluster of data.",
                    @"a commonly used phrase, sometimes passing as folk wisdom, used to quell cognitive dissonance, conceal lack of thought-entertainment, move onto other topics etc. but in any case, end the debate with a cliche—not a point.",
                    @"('you too', appeal to hypocrisy, I'm rubber and you're glue) – the argument states that a certain position is false or wrong and/or should be disregarded because its proponent fails to act consistently in accordance with that position.",
                    @"occurs when it is assumed that if one wrong is committed, another wrong will cancel it out.",
                    @"a specific type of appeal to emotion where a decision is made according to what might be pleasing to imagine, rather than according to evidence or reason.",
                    @"cause and effect are reversed. The cause is said to be the effect and vice versa.",
                    
                    
                    nil];
    
    
    
    
    
    
    _question.text = [arrayQuestions objectAtIndex:0];
    _theAnswer.text = [arrayAnswers objectAtIndex:0];
    _theAnswer.alpha = 1;
    _question.alpha = 0;
    revealed = NO;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown && interfaceOrientation != UIInterfaceOrientationPortrait);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {

    [super viewDidUnload];
}
@end
