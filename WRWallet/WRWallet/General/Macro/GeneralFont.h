//
//  GeneralFont.h
//  Fruit
//
//  Created by ༺ོ࿆强ོ࿆ ༻ on 2020/2/2.
//  Copyright © 2020 ༺ོ࿆强ོ࿆ ༻. All rights reserved.
//

#ifndef GeneralFont_h
#define GeneralFont_h


#define  kMediumFont(x) [UIFont fontWithName:@"PingFangSC-Medium" size:x]
#define  kRegularFont(x) [UIFont fontWithName:@"PingFangSC-Regular" size:x]

#define kFont_12 kMediumFont(12)
#define kFont_13 kMediumFont(13)
#define kFont_14 kMediumFont(14)
#define kFont_16 kMediumFont(16)
#define kFont_15 kMediumFont(15)
#define kFont_17 kMediumFont(17)
#define kFont_18 kMediumFont(18)
#define kFont_21 kMediumFont(21)
#define kFont_24 kMediumFont(24)
#define kFont_40 kMediumFont(40)


#define kFont_R_10 kRegularFont(10)
#define kFont_R_11 kRegularFont(11)
#define kFont_R_12 kRegularFont(12)
#define kFont_R_13 kRegularFont(13)
#define kFont_R_14 kRegularFont(14)
#define kFont_R_16 kRegularFont(16)
#define kFont_R_17 kRegularFont(17)
#define kFont_R_18 kRegularFont(18)



#pragma mark 文字位置（居左，居中，居右）

#define kTextAlignmentLeft   NSTextAlignmentLeft    //居左
#define kTextAlignmentCenter NSTextAlignmentCenter    //居中
#define kTextAlignmentRight  NSTextAlignmentRight    //居右

#endif /* GeneralFont_h */
