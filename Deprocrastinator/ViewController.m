//
//  ViewController.m
//  Deprocrastinator
//
//  Created by Mingu Chu on 3/21/16.
//  Copyright © 2016 Mingu Chu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property NSMutableArray *toDoText;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSArray *tapColors;
@property (weak, nonatomic) IBOutlet UIButton *addButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.toDoText = [NSMutableArray arrayWithObjects:@"test1", @"test2", nil];
    
    self.tapColors = [NSArray arrayWithObjects:[UIColor redColor], [UIColor yellowColor], [UIColor greenColor], nil];
    
    
    
}

- (IBAction)onSwipe:(UISwipeGestureRecognizer *)sender {
    CGPoint location = [sender locationInView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:location];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", self.textField.text];
    cell.textLabel.text = [self.toDoText objectAtIndex:indexPath.row];
    
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

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    
        if ([self.textField.text isEqualToString:@""]) {
            [self.addButton setEnabled:NO];
 } else if (![self.textField.text isEqualToString:@""]) {
            [self.addButton setEnabled:YES];
     }
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    cell.textLabel.textColor = [UIColor greenColor];
}

- (IBAction)editButtonClick:(UIBarButtonItem *)sender {
    
    
    
    if ([self.tableView isEditing] == NO){
        [sender setTitle:@"Done"];
        NSLog(@"%@", self.editButtonItem.title);
        [self.tableView setEditing:YES animated:YES];
    }else if ([self.tableView isEditing] == YES){
        [sender setTitle:@"Edit"];
        NSLog(@"%@", self.editButtonItem.title);
        [self.tableView setEditing:NO animated:YES];
    }
    
    
    
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [self.toDoText removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    } 
}


@end
