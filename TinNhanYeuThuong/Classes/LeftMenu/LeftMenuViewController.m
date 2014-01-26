//
//  LeftMenuViewController.m
//  TinNhanYeuThuong
//
//  Created by Kien Nguyen on 1/24/14.
//  Copyright (c) 2014 kakaolabs. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "LeftMenuTableViewCell.h"


@implementation LeftMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        listItemIcons = [[NSMutableArray alloc] initWithArray:
                         @[@"home-menu.png",
                           @"recently-menu.png",
                           @"fav-menu.png",
                           @"fav-menu.png",
                           @"fav-menu.png"]];
        listItemNames = [[NSMutableArray alloc] initWithArray:
                        @[@"HOME",
                          @"RECENTLY USED",
                          @"FAVOURITE",
                          @"NOTIFICATIONS",
                          @"NEWS"]];
        selectedIndex = -1;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UINib *nibFile = [UINib nibWithNibName:@"LeftMenuTableViewCell"
                                    bundle:[NSBundle mainBundle]];
    [menuTable registerNib: nibFile
    forCellReuseIdentifier:@"LeftMenuTableViewCell"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - TableViewSource
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return listItemIcons.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellNibFile = @"LeftMenuTableViewCell";
    LeftMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellNibFile];
    
    if (!cell) {
        cell = (LeftMenuTableViewCell *)[[NSClassFromString(cellNibFile) alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellNibFile];
    }
    
    NSString *iconPath = listItemIcons[indexPath.row];
    NSString *name = listItemNames[indexPath.row];
    BOOL isSelected = indexPath.row == selectedIndex;
    [cell setUpCellWithImage:iconPath text:name isSelected:isSelected];
    return cell;
}

#pragma mark - TableView Control
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    selectedIndex = (int) indexPath.row;
    [tableView reloadData];
}

@end
