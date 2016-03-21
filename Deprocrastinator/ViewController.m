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
        NSLog(@"%@", self.editButtonItem.title);
        [self.tableView setEditing:YES animated:YES];
    }else if ([self.tableView isEditing] == YES){
       [self.editButtonItem setTitle:@"Edit"];
        NSLog(@"%@", self.editButtonItem.title);
       [self.tableView setEditing:NO animated:YES];
    }
}


//    self.toggle = !self.toggle;
//    if ([self.whichPlayerLabel.text isEqual: @"Player One - Go!"]) {
//        self.whichPlayerLabel.text = @"Player Two - Go!";
//    } else {
//        self.whichPlayerLabel.text = @"Player One - Go!";
//    }




- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [self.toDoText removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    } 
}




@end
