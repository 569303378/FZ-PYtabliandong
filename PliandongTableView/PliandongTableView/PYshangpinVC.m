//
//  PYshangpinVC.m
//  PliandongTableView
//
//  Created by Apple on 16/7/14.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "PYshangpinVC.h"
#import "PYxiangqingVC.h"
@interface PYshangpinVC () <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView *productsTableView;
@property(nonatomic, strong) NSArray *productsArr;
@property(nonatomic, strong) NSArray *sectionArr;
@property(nonatomic, assign) BOOL isScrollUp;//是否向上滚动
@property(nonatomic, assign) CGFloat lastOffsetY;//滚动即将结束scrollView的偏移量

@end

@implementation PYshangpinVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _isScrollUp = false;
    _lastOffsetY = 0;
    
    [self configData];
    [self createTableView];
}

#pragma mark ======= 加载
- (void)configData {
    if (!_sectionArr) {
        NSArray *numArr = @[@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九",@"十",@"十一",@"十二",@"十三",@"十四",@"十五",@"十六",@"十七",@"十八",@"十九",@"二十"];
        NSMutableArray *tmpArr = [NSMutableArray array];
        for (int i = 0; i < 20; i++) {
            NSString *tmpStr = [NSString stringWithFormat:@"第%@类", numArr[i]];
            [tmpArr addObject:tmpStr];
        }
        _sectionArr = tmpArr;
    }
    if (!_productsArr) {
        _productsArr = @[@"鞋子",@"衣服",@"化妆品",@"饮用水",@"副食品",@"小吃",@"鞋子",@"衣服",@"化妆品",@"饮用水"];
    }
}

- (void)createTableView {
    self.view = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 0.25, 64, self.view.frame.size.width * 0.75, self.view.frame.size.height - 64)];
    self.view.backgroundColor = [UIColor redColor];
    self.productsTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.productsTableView.delegate = self;
    self.productsTableView.dataSource = self;
    self.productsTableView.showsVerticalScrollIndicator = false;
    [self.view addSubview:self.productsTableView];
}

#pragma mark ======= 代理
//分区行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _productsArr.count;
}

//分区个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _sectionArr.count;
}

//高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
}

//分区页眉
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [_sectionArr objectAtIndex:section];
}
//页脚
//- (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
//    return [_sectionArr objectAtIndex:section];
//}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifierCell = @"identifierCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierCell];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifierCell];
    }
    cell.textLabel.text = [_productsArr objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {

    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(willDisplayHeaderView:)] != _isScrollUp &&_productsTableView.isDecelerating) {
        [self.delegate willDisplayHeaderView:section];
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section {
    
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(didEndDisplayingHeaderView:)] && _isScrollUp &&_productsTableView.isDecelerating) {
        [self.delegate didEndDisplayingHeaderView:section];
    }
}

#pragma mark - 页面跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PYxiangqingVC *pYxiangqingVC = [[PYxiangqingVC alloc] init];
    [self.navigationController pushViewController:pYxiangqingVC animated:NO];
}

#pragma mark - scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSLog(@"_lastOffsetY : %f,scrollView.contentOffset.y : %f", _lastOffsetY, scrollView.contentOffset.y);
    _isScrollUp = _lastOffsetY < scrollView.contentOffset.y;
    _lastOffsetY = scrollView.contentOffset.y;
    NSLog(@"___新___lastOffsetY: %f", _lastOffsetY);
}

#pragma mark - 一级tableView滚动时 实现当前类tableView的联动
- (void)scrollToSelectedIndexPath:(NSIndexPath *)indexPath {
    
    [self.productsTableView selectRowAtIndexPath:([NSIndexPath indexPathForRow:0 inSection:indexPath.row]) animated:YES scrollPosition:UITableViewScrollPositionTop];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
