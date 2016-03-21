//
//  ViewController.m
//  Deprocrastinator
//
//  Created by Mingu Chu on 3/21/16.
//  Copyright © 2016 Mingu Chu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property NSMutableArray *toDoText;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSArray *tapColors;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.toDoText = [NSMutableArray arrayWithObjects:@"test1", @"test2", nil];
    
    self.tapColors = [NSArray arrayWithObjects:[UIColor redColor], [UIColor yellowColor], [UIColor greenColor], nil];
    
//    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", self.textField.text];
    cell.textLabel.text = [self.toDoText objectAtIndex:indexPath.row];
//
//    [tableView setEditing:YES animated:YES];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.toDoText.count;
}

- (IBAction)onAddButtonPressed:(UIButton *)sender {
    [self.toDoText addObject:self.textField.text];
    [self.tableView reloadData];
    self.textField.text = @"";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    cell.textLabel.textColor = [UIColor greenColor];
}

- (IBAction)editButtonClick:(id)sender {
    if ([self.tableView isEditing] == NO){
        [self.editButtonItem setTitle:@"Done"];
        [self.tableView setEditing:YES animated:YES];
   }else {
       [self.editButtonItem setTitle:@"Edit"];
       [self.tableView setEditing:NO animated:NO];
       
    }

    
}
- Tableview

@end
