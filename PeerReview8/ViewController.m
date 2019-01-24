//
//  ViewController.m
//  PeerReview8
//
//  Created by Ananta Shahane on 6/21/17.
//  Copyright © 2017 Ananta Shahane. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *personSelector;
@property (weak, nonatomic) IBOutlet UILabel *Label1;
@property (weak, nonatomic) IBOutlet UILabel *Label2;
@property (weak, nonatomic) IBOutlet UILabel *Label3;
@property (weak, nonatomic) IBOutlet UILabel *Label4;
@property (nonatomic) AppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet UITextField *Input1;
@property (weak, nonatomic) IBOutlet UITextField *Input2;
@property (weak, nonatomic) IBOutlet UITextField *Input3;
@property (weak, nonatomic) IBOutlet UITextField *Input4;
@property (weak, nonatomic) IBOutlet UILabel *Dataout;
@property (weak, nonatomic) IBOutlet UIButton *ClearButton;
@property (weak, nonatomic) IBOutlet UIButton *AddPerson;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [self Initialisation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) Initialisation
{
    self.personSelector.selectedSegmentIndex = 0;
    [self StudentSetup];
    [self updateList];
}

- (IBAction)personSelectorTapped:(id)sender {
    NSInteger choice = [self.personSelector selectedSegmentIndex];
    switch (choice)
    {
        case 0:
            [self StudentSetup];
            break;
        case 1:
            [self ProfessorSetup];
            break;
        default:
            break;
    }
}

- (IBAction)AddPersonClicked:(id)sender {
    if ([self.Input1 isFirstResponder])
    {
        [self.Input1 resignFirstResponder];
    }
    if ([self.Input2 isFirstResponder])
    {
        [self.Input2 resignFirstResponder];
    }
    if ([self.Input3 isFirstResponder])
    {
        [self.Input3 resignFirstResponder];
    }
    if ([self.Input4 isFirstResponder])
    {
        [self.Input4 resignFirstResponder];
    }

    NSInteger choice = [self.personSelector selectedSegmentIndex];
    if(choice == 0)
    {
        StudentMO *s = [self.appDelegate createStudent];
        s.id = self.Input1.text;
        s.personName =self.Input2.text;
        s.year = self.Input3.text;
        s.grades = [self.Input4.text integerValue];
        NSLog(@"Ingoing value: %ld",[self.Input4.text integerValue]);
    }
    else
    {
        ProfessorMO *p = [self.appDelegate createProfessor];
        p.id = self.Input1.text;
        p.personName =self.Input2.text;
        p.subject = self.Input3.text;
        p.researches = [self.Input4.text integerValue];
        NSLog(@"Ingoing value: %ld",[self.Input4.text integerValue]);
    }
    self.Input1.text = @"";
    self.Input2.text = @"";
    self.Input3.text = @"";
    self.Input4.text = @"";
    [self updateList];
    [self.appDelegate saveContext];
}

- (IBAction)ClearClicked:(id)sender {
    NSManagedObjectContext *moc = self.appDelegate.persistentContainer.viewContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Student"];
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    for(StudentMO *s in results)
    {
        [moc deleteObject:s];
    }
    request = [NSFetchRequest fetchRequestWithEntityName:@"Professor"];
    error = nil;
    results = [moc executeFetchRequest:request error:&error];
    for (ProfessorMO *p in results)
    {
        [moc deleteObject:p];
    }
    [self.appDelegate saveContext];
    [self updateList];
}

-(void) StudentSetup
{
    self.Label1.text = @"Identity Code";
    self.Label2.text = @"Student Name";
    self.Label3.text = @"Year";
    self.Label4.text = @"Grades";
}

-(void) ProfessorSetup
{
    self.Label1.text = @"Identity Code";
    self.Label2.text = @"Professor Name";
    self.Label3.text = @"Subject";
    self.Label4.text = @"Researches done";
}

-(void) updateList
{
    NSInteger num = 0;
    NSManagedObjectContext *moc = self.appDelegate.persistentContainer.viewContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Student"];
    
    NSError *error = nil;
    
    NSArray *results = [moc executeFetchRequest:request error:&error];
    if(!results)
    {
        NSLog(@"Error fetching student objects: %@\n%@",[error localizedDescription],[error userInfo]);
        return;
    }
    NSMutableString *buffer = [NSMutableString stringWithFormat:@"**Students**"];
    for (StudentMO *s in results)
    {
        [buffer appendFormat:@"\n%@",s,nil];
        num++;
    }
    request = [NSFetchRequest fetchRequestWithEntityName:@"Professor"];
    
    error = nil;
    
    results = [moc executeFetchRequest:request error:&error];
    if(!results)
    {
        NSLog(@"Error fetching professor objects: %@\n%@",[error localizedDescription],[error userInfo]);
        return;
    }
    [buffer appendFormat:@"\n**Professors**"];
    for (ProfessorMO *p in results)
    {
        [buffer appendFormat:@"\n%@",p,nil];
        num++;
    }
    NSLog(@"%@", buffer);
    buffer = (NSMutableString*)[buffer stringByAppendingFormat:@"\nCount: %ld", (long)num];
    self.Dataout.text = buffer;
    if (num == 0)
    {
        self.ClearButton.enabled = NO;
    }
    else
    {
        self.ClearButton.enabled = YES;
    }
}

@end
