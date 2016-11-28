//
//  ViewController.m
//  CYHorizontalTableView
//
//  Created by chenyi on 16/11/28.
//  Copyright © 2016年 chenyi. All rights reserved.
//

#import "ViewController.h"
#import "CYCollectionViewSeperatorFlowLayout.h"

static NSString * cellIdentifier = @"Cell";
@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) NSArray * data;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    [self setupSubViews];
    [self setupData];
}

- (void)setupData
{
    self.data = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9"];
}

- (void)setupSubViews
{
    CYCollectionViewSeperatorFlowLayout * flowLayout = [[CYCollectionViewSeperatorFlowLayout alloc] init];
    CGRect frame = CGRectMake(0, 0, self.view.bounds.size.width, kCollectionViewHeight);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    
    [self.view addSubview:self.collectionView];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.data.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    //content
    UILabel * label = [[UILabel alloc] initWithFrame:cell.bounds];
    label.text = self.data[indexPath.item];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:10];
    label.textColor = [UIColor blackColor];
    label.backgroundColor = [UIColor whiteColor];
    [cell.contentView addSubview:label];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
