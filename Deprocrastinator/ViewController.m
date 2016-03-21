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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.toDoText = [NSMutableArray arrayWithObjects:[UIColor redColor], [UIColor blueColor], nil];
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
//    = [NSString stringWithFormat:@"%@", self.textField.text];
}

@end
