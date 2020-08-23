//
//  FinancialTableViewCell.m
//  wallet
//
//  Created by xc-ios on 2020/7/28.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import "FinancialTableViewCell.h"

@interface FinancialTableViewCell ()

/** 添金宝图片 */
@property(nonatomic , strong)UIImageView *treasureMoneryImageView;
/** 众智存图片 */
@property(nonatomic , strong)UIImageView *saveMoneryImageView;


@end

@implementation FinancialTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupUI];
    }
    return self;
}
- (void)setupUI {
    
    CGFloat width = (SCREEN_WIDTH - 10-30) * 0.5;
    UIImageView *treasureMoneryImageView = [ViewCreate createImageViewFrame:CGRectZero image:@"Resources.bundle/treasureMonery_icon.png"];
    [self.contentView addSubview:treasureMoneryImageView];
    [treasureMoneryImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.width.offset(width);
        make.top.offset(5);
        make.bottom.offset(-20);
    }];
    treasureMoneryImageView.clipsToBounds = true;
    treasureMoneryImageView.layer.cornerRadius = 5;
    self.treasureMoneryImageView = treasureMoneryImageView;
    [treasureMoneryImageView setUserInteractionEnabled:true];
    UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(treasureMoneryClick)];
    [treasureMoneryImageView addGestureRecognizer:tapG];
    
    UIImageView *saveMoneryImageView = [ViewCreate createImageViewFrame:CGRectZero image:@"Resources.bundle/saveMonery_icon.png"];
    [self.contentView addSubview:saveMoneryImageView];
    [saveMoneryImageView setUserInteractionEnabled:true];
    [saveMoneryImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-15);
        make.width.offset(width);
        make.top.offset(5);
        make.bottom.offset(-20);
    }];
    saveMoneryImageView.clipsToBounds = true;
    saveMoneryImageView.layer.cornerRadius = 5;
    self.saveMoneryImageView = saveMoneryImageView;
    
    UITapGestureRecognizer *tapG1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(saveMoneryClick)];
    [saveMoneryImageView addGestureRecognizer:tapG1];
    
}

- (void)treasureMoneryClick {
    if (self.financialClickBlock) {
        self.financialClickBlock(false);
    }
}
- (void)saveMoneryClick {
    if (self.financialClickBlock) {
        self.financialClickBlock(true);
    }
}


@end
