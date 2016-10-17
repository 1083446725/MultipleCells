//
//  ViewController.m
//  MutipleCells
//
//  Created by la0fu on 16/10/17.
//  Copyright © 2016年 la0fu. All rights reserved.
//

#import "ViewController.h"
#import "ImageCell.h"
#import "Person.h"
#import "TextCell.h"
#import "ImageCell.h"
#import "TextImageCell.h"
#import "BaseCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *persons;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    self.navigationController.navigationBar.translucent = NO;
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    Person *p1 = [[Person alloc] init];
    p1.showtype = PersonShowText;
    p1.name = @"Peter";
    
    Person *p2 = [[Person alloc] init];
    p2.showtype = PersonShowAvatar;
    p2.avatar = @"10112726.jpeg";
    
    Person *p3 = [[Person alloc] init];
    p3.showtype = PersonShowTextAndAvatar;
    p3.name = @"James";
    p3.avatar = @"11918635.png";
    
    self.persons = [NSMutableArray arrayWithObjects:p1, p2, p3, nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _persons.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *cellIdentifier = @"tableCell";
//        
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//    
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
//    }
//    
//    cell.textLabel.text = [NSString stringWithFormat:@"%d", (int)indexPath.row];
//    
//    return cell;
    
//    NSString *cellIdentifier = NSStringFromClass([ImageCell class]);
//    ImageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//    if (!cell) {
//        cell = [[ImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
//    }
//    UIImage *image = [UIImage imageNamed:@"10112726.jpeg"];
//    [cell setAvatar:image];

    Person *p = _persons[indexPath.row];
    BaseCell *cell;
    NSString *cellIdentifier;

    switch (p.showtype) {
        case PersonShowText:
            cellIdentifier = @"TextCell";
            break;
        case PersonShowAvatar:
            cellIdentifier = @"PersonShowAvatar";
            break;
        case PersonShowTextAndAvatar:
            cellIdentifier = @"PersonShowTextAndAvatar";
            break;
        default:
            break;
    }
    
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        switch (p.showtype) {
            case PersonShowText:
                cell = [[TextCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
                break;
            case PersonShowAvatar:
                cell = [[ImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
                break;
            case PersonShowTextAndAvatar:
                cell = [[TextImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
                break;
            default:
                break;
        }
    }
    
    [cell setPerson:p];
    return cell;
    
    /*
    Class cellClass;
    switch (p.showtype) {
        case PersonShowText:
            cellClass = [TextCell class];
            break;
        case PersonShowAvatar:
            cellClass = [ImageCell class];
            break;
        case PersonShowTextAndAvatar:
            cellClass = [TextImageCell class];
            break;
        default:
            cellClass = [UITableViewCell class];
            break;
    }
    
    cellIdentifier = NSStringFromClass(cellClass);

    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    [cell setPerson:p];
    
    return cell;
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
