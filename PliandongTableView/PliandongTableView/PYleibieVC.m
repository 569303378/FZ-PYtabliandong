//
//  PYleibieVC.m
//  PliandongTableView
//
//  Created by Apple on 16/7/14.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "PYleibieVC.h"
#import "PYshangpinVC.h"

@interface PYleibieVC () <UITableViewDelegate, UITableViewDataSource, ProductsDelegate>
@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSArray *myArray;
@property(nonatomic, strong)PYshangpinVC *pYshangpinVC;
@end

@implementation PYleibieVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configData];
    [self createTableView];
    [self createProductsVC];
}

#pragma 加载
- (void)configData {
    if (!self.myArray) {
    
        NSArray *numArr = @[@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九",@"十",@"十一",@"十二",@"十三",@"十四",@"十五",@"十六",@"十七",@"十八",@"十九",@"二十"];
        NSMutableArray *tmpArr = [NSMutableArray array];
        
        for (int i = 0; i < 20; i++) {
            NSString *tmpStr = [NSString stringWithFormat:@"第%@类", numArr[i]];
            [tmpArr addObject:tmpStr];
        }
        _myArray = tmpArr;
    }
}

- (void)createTableView {
    self.myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width * 0.25, self.view.frame.size.height) style:(UITableViewStylePlain)];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.myTableView];
}
- (void)createProductsVC {
    _pYshangpinVC = [[PYshangpinVC alloc] init];
    _pYshangpinVC.delegate = self;
    [self addChildViewController:_pYshangpinVC];
    [self.view addSubview:_pYshangpinVC.view];
}

#pragma mark ====== tableView代理
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _myArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifierCell = @"idenCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifierCell];
    }
    cell.textLabel.text = [_myArray objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_pYshangpinVC) {
        [_pYshangpinVC scrollToSelectedIndexPath:indexPath];
    }
}

#pragma mark ======= ProductsDelegate
- (void)willDisplayHeaderView:(NSInteger)section {
    [self.myTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:section inSection:0] animated:YES scrollPosition:(UITableViewScrollPositionMiddle)];
}

- (void)didEndDisplayingHeaderView:(NSInteger)section {
    [self.myTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:section + 1 inSection:0] animated:YES scrollPosition:(UITableViewScrollPositionMiddle)];
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
