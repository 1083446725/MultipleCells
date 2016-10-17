//
//  RegisterClassController.m
//  MutipleCells
//
//  Created by la0fu on 16/10/17.
//  Copyright © 2016年 la0fu. All rights reserved.
//

#import "RegisterClassController.h"
#import "ImageCell.h"
#import "Person.h"
#import "TextCell.h"
#import "ImageCell.h"
#import "TextImageCell.h"
#import "BaseCell.h"

@interface RegisterClassController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *persons;

@end


@implementation RegisterClassController

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
    
    [self registerCell];
}

- (void)registerCell
{
    [_tableView registerClass:[TextCell class] forCellReuseIdentifier:NSStringFromClass([TextCell class])];
    [_tableView registerClass:[ImageCell class] forCellReuseIdentifier:NSStringFromClass([ImageCell class])];
    [_tableView registerClass:[TextImageCell class] forCellReuseIdentifier:NSStringFromClass([TextImageCell class])];
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
    Person *p = _persons[indexPath.row];
    BaseCell *cell;
    NSString *cellIdentifier;

    cellIdentifier = p.cellIdentifier;
//    switch (p.showtype) {
//        case PersonShowText:
//            cellIdentifier = NSStringFromClass([TextCell class]);
//            break;
//        case PersonShowAvatar:
//            cellIdentifier = NSStringFromClass([ImageCell class]);
//            break;
//        case PersonShowTextAndAvatar:
//            cellIdentifier = NSStringFromClass([TextImageCell class]);
//            break;
//        default:
//            cellIdentifier = NSStringFromClass([UITableViewCell class]);
//            break;
//    }
    
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
        
    [cell setPerson:p];
    
    return cell;
}

@end
