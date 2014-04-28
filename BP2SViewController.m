//
//  BP2SViewController.m
//  MyCartography
//
//  Created by Luciano Oliveira on 25/04/14.
//  Copyright (c) 2014 BNP Paribas Securities Services Portugal. All rights reserved.
//

#import "BP2SViewController.h"


@interface BP2SViewController ()<UIGestureRecognizerDelegate>{
    NSArray* categoryArray;
    
    NSArray* locationsArray;
    NSArray* rolesArray;
    NSArray* activitiesArray;
    NSArray* staffStatusesArray;
    NSArray* entitiesArray;
    
    NSArray* regionArray;
    NSArray* countryArray;
    NSArray* cityArray;
    NSArray* roleArray;
    NSArray* activityBusinessLineArray;
    NSArray* activityCategoryArray;
    NSArray* activitySubCategoryArray;
    NSArray* staffGlobalArray;
    NSArray* staffStatusArray;
    NSArray* entityArray;
    
    NSMutableArray* chosenFilters;
    NSMutableArray* sectionsToShow;


}

@end

@implementation BP2SViewController

- (void)viewDidLoad
{
    // Do any additional setup after loading the view, typically from a nib.
    [self.NumLabel setText:@"8000"];
    categoryArray = [[NSArray alloc] initWithObjects:@"Location", @"Role", @"Activity", @"Staff Status", @"Entity", nil];
    
    locationsArray = [[NSArray alloc] initWithObjects:@"Region", @"Country", @"City", nil];
    rolesArray = [[NSArray alloc] initWithObjects:@"Role", nil];
    activitiesArray = [[NSArray alloc] initWithObjects:@"Business Line", @"Category", @"Sub-category", nil];
    staffStatusesArray = [[NSArray alloc] initWithObjects:@"Global Status", @"Status", nil];
    entitiesArray = [[NSArray alloc] initWithObjects:@"Entity", nil];
    
    
    regionArray = [[NSArray alloc] initWithObjects:@"Afrique", @"Amerique", @"Asie", @"Europe", @"Oceanie", nil];
    roleArray = [[NSArray alloc] initWithObjects:@"Client dev", @"IT", @"mix", @"Mngt", @"MOA", @"Non IT", @"Ops", @"Products", @"Support", @"tbd", nil];
    //
    //
    entityArray = [[NSArray alloc] initWithObjects:@"BP2S", @"BPFS", @"SLIB", @"Wealth Management", nil];
    
    chosenFilters = [NSMutableArray new];
    
    
    
    
    [super viewDidLoad];
	
    
    //Gesture Left<-Right
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(SwipeRecognizer:)];
    recognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    recognizer.numberOfTouchesRequired = 1;
    recognizer.delegate = self;
    [self.view addGestureRecognizer:recognizer];
    
    //Gesture Left->Right
    UISwipeGestureRecognizer *recognizer2 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(SwipeRecognizer:)];
    recognizer2.direction = UISwipeGestureRecognizerDirectionRight;
    recognizer2.numberOfTouchesRequired = 1;
    recognizer2.delegate = self;
    [self.view addGestureRecognizer:recognizer2];


    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tableView:(UITableView *)tableView1 didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView2 setHidden:NO];
}

//Set the sections
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView1{
    return [categoryArray count];
}
-(NSString *)tableView:(UITableView *)tableView1 titleForHeaderInSection:(NSInteger)section {
    return [categoryArray objectAtIndex:section];
}


-(NSInteger)tableView:(UITableView *)tableView1 numberOfRowsInSection:(NSInteger)section
{
    
    switch (section)
    {
        case 0:
            return 3;
            break;
        case 1:
            return 1;
            break;
        case 2:
            return 3;
            break;
        case 3:
            return 2;
            break;
        case 4:
            return 1;
            break;
        default:
            return 0;
            break;
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    switch (indexPath.section)
    {
        case 0:
            {
                static NSString *CellIdentifier = @"Cell";
                UITableViewCell *cell = [tableView1 dequeueReusableCellWithIdentifier:CellIdentifier];
                if (cell == nil) {
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                }
                
                cell.textLabel.text = [locationsArray objectAtIndex:indexPath.row];
                return cell;
            }
            break;
        case 1:
            {
                static NSString *CellIdentifier = @"Cell";
                UITableViewCell *cell = [tableView1 dequeueReusableCellWithIdentifier:CellIdentifier];
                if (cell == nil) {
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                }
            
                cell.textLabel.text = [rolesArray objectAtIndex:indexPath.row];
                return cell;
                }
            break;
        case 2:
            {
                static NSString *CellIdentifier = @"Cell";
                UITableViewCell *cell = [tableView1 dequeueReusableCellWithIdentifier:CellIdentifier];
                if (cell == nil) {
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                }
            
                cell.textLabel.text = [activitiesArray objectAtIndex:indexPath.row];
                return cell;
            }
            break;
        case 3:
            {
                static NSString *CellIdentifier = @"Cell";
                UITableViewCell *cell = [tableView1 dequeueReusableCellWithIdentifier:CellIdentifier];
                if (cell == nil) {
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                }
            
                cell.textLabel.text = [staffStatusesArray objectAtIndex:indexPath.row];
                return cell;
            }
            break;
        case 4:
            {
                static NSString *CellIdentifier = @"Cell";
                UITableViewCell *cell = [tableView1 dequeueReusableCellWithIdentifier:CellIdentifier];
                if (cell == nil) {
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                }
            
                cell.textLabel.text = [entitiesArray objectAtIndex:indexPath.row];
                return cell;
            }
            break;
        default:
            return 0;
            break;
    }
    
    
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([touch.view isKindOfClass:[UIView class]])
    {
        return YES;
    }
    return NO;
}

- (void) SwipeRecognizer:(UISwipeGestureRecognizer *)sender {
    
    if ( sender.direction == UISwipeGestureRecognizerDirectionLeft ){
        
        //NSLog(@" *** WRITE CODE FOR SWIPE LEFT ***");
        CGRect tableView1TopFrame = self.tableView1.frame;
        //tableView1TopFrame.origin.x = tableView1TopFrame.origin.x-tableView1TopFrame.size.width;
        tableView1TopFrame.origin.x = 796;
        
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationDelay:0.3];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        
        self.tableView1.frame = tableView1TopFrame;
        
        [UIView commitAnimations];
        
    }
    if ( sender.direction == UISwipeGestureRecognizerDirectionRight ){
        
        //NSLog(@" *** WRITE CODE FOR SWIPE LEFT ***");
        CGRect tableView1TopFrame = self.tableView1.frame;
        //tableView1TopFrame.origin.x = tableView1TopFrame.origin.x+tableView1TopFrame.size.width;
        tableView1TopFrame.origin.x = 1025;
        
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationDelay:0.3];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        
        self.tableView1.frame = tableView1TopFrame;
        
        [UIView commitAnimations];
        
    }
}




@end
