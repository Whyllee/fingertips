//
//  TipsItem.swift
//  fingertips
//
//  Created by Yin Li on 7/12/14.
//  Copyright (c) 2014 Whyllee. All rights reserved.
//

import UIKit

enum FT_TipsRoundingRule : Int {
    case Exact
    case RoundUp
    case RoundDown
}

enum FT_TipsRoundingTarget : Int {
    case Tips
    case FinalPrice
    
}

class FT_TipsConfig:NSObject {
    let TaxRate:Float = 0.1
    let TipRate:Float = 0.15
    let RoundingTarget = FT_TipsRoundingTarget.FinalPrice
    let RoundingRule = FT_TipsRoundingRule.RoundUp
}

class FT_TipsItem: NSObject {
    init(listPrice:Float, config:FT_TipsConfig) {
        self.ListPrice = listPrice
        self.Tips = self.ListPrice * config.TipRate
        self.FinalPrice = ListPrice * (1 + config.TaxRate) + self.Tips
    }
    
    let ListPrice:Float
    let Tips:Float
    let FinalPrice:Float
}
