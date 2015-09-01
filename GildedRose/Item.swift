//
//  Item.swift
//  GildedRose
//
//  Created by Tom Heinan on 8/31/15.
//  Copyright © 2015 Tom Heinan. All rights reserved.
//

public struct Item: Equatable {
    
    var name: String
    var sellIn: Int
    var quality: Int
    
}

public func ==(lhs: Item, rhs: Item) -> Bool {
    return lhs.name == rhs.name && lhs.sellIn == rhs.sellIn && lhs.quality == rhs.quality
}
