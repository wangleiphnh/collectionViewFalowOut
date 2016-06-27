//
//  ViewController.m
//  collectionViewFalowOut
//
//  Created by wale1994 on 16/6/27.
//  Copyright © 2016年 wale. All rights reserved.
//

#import "ViewController.h"
#import "textCell.h"
#import "waleFlowLayOut.h"
@interface ViewController ()<UICollectionViewDataSource>
{
    
    NSMutableArray *_dataArray;
}
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)waleFlowLayOut *collectionViewFlowLayout;
@end

@implementation ViewController
static NSString *const cellID=@"textCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor yellowColor];
    _dataArray=[NSMutableArray new];
    [self configUI];
    [self loadData];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)loadData
{
    _dataArray=[NSMutableArray arrayWithArray:@[@"111",@"222",@"333",@"444",@"555",@"666",@"777"]];
    [_collectionView reloadData];
}
-(void)configUI
{
    _collectionViewFlowLayout=[[waleFlowLayOut alloc]init];
    _collectionView=[[UICollectionView  alloc]initWithFrame:CGRectMake(0, 0,self.view.bounds.size.width, self.view.bounds.size.height) collectionViewLayout:_collectionViewFlowLayout];
    _collectionView.dataSource=self;
    _collectionView.backgroundColor=[UIColor whiteColor];
    [_collectionView registerNib:[UINib nibWithNibName:cellID bundle:nil] forCellWithReuseIdentifier:cellID];
    [self.view addSubview:_collectionView];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _dataArray.count;
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return  1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    textCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.textLabel.text=_dataArray[indexPath.row];
    
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
