//
//  WalletSectionModel.m
//  wallet
//
//  Created by xc-ios on 2020/7/27.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import "WalletSectionModel.h"
#import "WalletRowModel.h"

@implementation WalletSectionModel

+ (NSArray *)loadWalletDatas:(BOOL)isHaveWallet {
   
    WalletRowModel *rechargeModel = [[WalletRowModel alloc] initWithIcon:@"recharge_icon" title:@"充值" content:@"" rowTag:1001];
    WalletRowModel *withdrawModel = [[WalletRowModel alloc] initWithIcon:@"withdraw_icon" title:@"提现" content:@"" rowTag:1002];
    WalletSectionModel *sectionModel = [[WalletSectionModel alloc] initWithTitle:@"" content:@"" sectionType:WalletSectionNormalType rowDatas:@[rechargeModel , withdrawModel]];
    
    WalletRowModel *financesModel1 = [[WalletRowModel alloc] initWithIcon:@"treasureMonery_icon" title:@"添金宝" content:@"" rowTag:1003];
    WalletRowModel *financesModel2 = [[WalletRowModel alloc] initWithIcon:@"saveMonery_icon" title:@"众智存" content:@"" rowTag:1004];
    WalletSectionModel *financeSectionModel = [[WalletSectionModel alloc] initWithTitle:@"金融服务" content:@"更多" sectionType:WalletSectionFinanceType rowDatas:@[financesModel1 , financesModel2]];
    
    
    
    WalletRowModel *cardModel = [[WalletRowModel alloc] initWithIcon:@"card_icon" title:@"银行卡管理" content:@"" rowTag:1005];
    WalletRowModel *payModel = [[WalletRowModel alloc] initWithIcon:@"pay_icon" title:@"支付管理" content:@"" rowTag:1006];
    WalletRowModel *phoneModel = [[WalletRowModel alloc] initWithIcon:@"phone_icon" title:@"手机号管理" content:@"" rowTag:1007];
    WalletRowModel *userModel = [[WalletRowModel alloc] initWithIcon:@"user_icon" title:@"账户管理" content:@"" rowTag:1008];
    WalletSectionModel *monerySectionModel = [[WalletSectionModel alloc] initWithTitle:@"钱包管理" content:@"渤金钱包编号" sectionType:WalletSectionManagerType rowDatas:@[cardModel , payModel, phoneModel, userModel]];
    
    WalletRowModel *serviceModel = [[WalletRowModel alloc] initWithIcon:@"call_icon" title:@"联系银行客服" content:@"95541" rowTag:1009];
    WalletRowModel *questionModel = [[WalletRowModel alloc] initWithIcon:@"question_icon" title:@"钱包常见问题" content:@"" rowTag:1010];
    WalletSectionModel *otherModel = [[WalletSectionModel alloc] initWithTitle:@"" content:@"" sectionType:WalletSectionOteherType rowDatas:@[serviceModel , questionModel]];
    if (!isHaveWallet) {
         return @[financeSectionModel];
    }
    return @[sectionModel,financeSectionModel,monerySectionModel,otherModel];
}
- (instancetype)initWithTitle:(NSString *)title content:(NSString *)content sectionType:(WalletSectionType)sectionType  rowDatas:(NSArray *)rowDatas {
    if (self = [super init]) {
        self.title = title;
        self.content = content;
        self.sectionType = sectionType;
        self.rowDatas = rowDatas;
    }
    return self;
}

@end
