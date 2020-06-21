//
//  Category.h
//  Demo
//
//  Created by Edmond on 2019/5/14.
//  Copyright © 2019 Edmond. All rights reserved.
//

#import <Foundation/Foundation.h>
@import SNBCommonUI;

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, SNBPortfolioGroupCategory)
{
    SNBPortfolioGroupCategoryNone = 0,
    SNBPortfolioGroupCategoryPortfolio = 1,
    SNBPortfolioGroupCategoryFund = 2,
    SNBPortfolioGroupCategoryCube = 3,
};

@interface TestCategory : NSObject

@end

NS_ASSUME_NONNULL_END
