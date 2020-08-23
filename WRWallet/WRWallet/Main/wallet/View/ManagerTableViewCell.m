//
//  ManagerTableViewCell.m
//  wallet
//
//  Created by xc-ios on 2020/7/28.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import "ManagerTableViewCell.h"
#import "ManagerCollectionViewCell.h"

@interface ManagerTableViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
/** collectionView */
@property(nonatomic , strong)UICollectionView *collectionView;
@end

@implementation ManagerTableViewCell


static NSString *kManagerCollectionViewCell = @"kManagerCollectionViewCell";

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupUI];
    }
    return self;
}
#pragma mark - 设置UI
- (void)setupUI {
    [self setupCollectView];
}

- (void)setupCollectView {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:flowLayout];
    collectionView.showsHorizontalScrollIndicator = false;
    self.collectionView = collectionView;
    collectionView.backgroundColor = kWhirtColor;
    [collectionView registerClass:[ManagerCollectionViewCell class] forCellWithReuseIdentifier:kManagerCollectionViewCell];
    collectionView.delegate = self;
    collectionView.dataSource  = self;
    [self.contentView addSubview:collectionView];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.offset(0);
    }];
}
#pragma mark - UICollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.sectionModel.rowDatas.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ManagerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kManagerCollectionViewCell forIndexPath:indexPath];
    cell.rowModel = self.sectionModel.rowDatas[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    WalletRowModel * rowModel = self.sectionModel.rowDatas[indexPath.row];
    if (self.managerBlock) {
        self.managerBlock(rowModel);
    }
    
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = SCREEN_WIDTH * 0.25;
    return  CGSizeMake(width,width);
}
- (void)setSectionModel:(WalletSectionModel *)sectionModel {
    _sectionModel = sectionModel;
    [self.collectionView reloadData];
}

@end
