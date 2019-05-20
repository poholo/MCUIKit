//
// Created by majiancheng on 2019/5/20.
// Copyright (c) 2019 majiancheng. All rights reserved.
//

#import "ListController.h"
#import "ListDataVM.h"
#import "ActionDto.h"

@interface ListController ()

@property(nonatomic, strong) ListDataVM *dataVM;

@end

@implementation ListController

- (instancetype)initWithRouterParams:(NSDictionary *)params {
    self = [super initWithRouterParams:params];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self refresh];
}

- (void)refresh {
    if (self.dataVM.isRefresh) return;
    [self.dataVM refresh];
    [self reloadData];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = self.dataVM.dataList[indexPath.row].name;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataVM.dataList.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ActionDto *dto = self.dataVM.dataList[indexPath.row];
    MCController *controller = [(MCController *) [dto.target alloc] initWithRouterParams:nil];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - getter

- (ListDataVM *)dataVM {
    if (!_dataVM) {
        _dataVM = [ListDataVM new];
    }
    return _dataVM;
}

@end