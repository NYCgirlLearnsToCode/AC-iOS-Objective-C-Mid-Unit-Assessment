//
//  myViewController.m
//  Crayons
//
//  Created by Lisa J on 5/18/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

#import "myViewController.h"
#import "Crayon.h"
#import "DetailViewController.h"
#import "AppDelegate.h"

@interface myViewController ()

@end

@implementation myViewController
NSArray *selectedColor;
int *selectedRow;
NSArray *colors;

- (void)viewWillAppear:(BOOL)animated{
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    selectedColor = appDelegate.selectedText;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackground];
    [self configureTableView];
    [self loadData];
    
}


#pragma mark - Setup UI

-(void)setBackground {
    self.view.backgroundColor = UIColor.cyanColor;
}


-(void)configureTableView {
    self.colorsTableView.dataSource = self;
    self.colorsTableView.delegate = self;
    [self.colorsTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:(@"colorCell")];
   
}

-(void)loadData {
    colors = [Crayon allTheCrayons];
}


//
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"colorCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    int r = ((Crayon*)colors[indexPath.row]).red;
    int g = ((Crayon*)colors[indexPath.row]).green;
    int b = ((Crayon*)colors[indexPath.row]).blue;
    UIColor *custom = [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1];
    cell.textLabel.text = ((Crayon*)colors[indexPath.row]).name;
    cell.detailTextLabel.text = ((Crayon*)colors[indexPath.row]).hex;
    cell.backgroundColor = custom;
    return cell;
}
//
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [colors count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Crayon *selected= [colors objectAtIndex:indexPath.row];
    NSLog(@"selected at row %@",selected);
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailViewController *detailVC = (DetailViewController *)[storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    detailVC.recievedColor = selected;
    NSLog(@"sent %@",selected);
    
    [self.navigationController pushViewController:detailVC animated:YES];
    
}


@end
