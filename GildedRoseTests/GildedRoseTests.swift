//
//  GildedRoseTests.swift
//  GildedRoseTests
//
//  Created by Tom Heinan on 8/31/15.
//  Copyright © 2015 Tom Heinan. All rights reserved.
//

import XCTest
@testable import GildedRose

class GildedRoseTests: XCTestCase {
    
    // MARK: Normal Items
    
    func testUpdateQuantityWithNormalItem() {
        let input = [Item(name: "+5 Dexterity Vest", sellIn: 10, quality: 20)]
        let expectedOutput = [Item(name: "+5 Dexterity Vest", sellIn: 9, quality: 19)]
        let actualOutput = GildedRose.updateQuality(input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    func testUpdateQuantityWithMultipleNormalItems() {
        let input = [Item(name: "Wirt's Third Leg", sellIn: 30, quality: 1), Item(name: "Drakefire Amulet", sellIn: 5, quality: 5)]
        let expectedOutput = [Item(name: "Wirt's Third Leg", sellIn: 29, quality: 0), Item(name: "Drakefire Amulet", sellIn: 4, quality: 4)]
        let actualOutput = GildedRose.updateQuality(input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    func testUpdateQuantityWithNormalItemOnSellDate() {
        let input = [Item(name: "Periapt of Vitality", sellIn: 0, quality: 7)]
        let expectedOutput = [Item(name: "Periapt of Vitality", sellIn: -1, quality: 5)]
        let actualOutput = GildedRose.updateQuality(input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    func testUpdateQuantityWithNormalItemAfterSellDate() {
        let input = [Item(name: "Skull of Gul'dan", sellIn: -10, quality: 50)]
        let expectedOutput = [Item(name: "Skull of Gul'dan", sellIn: -11, quality: 48)]
        let actualOutput = GildedRose.updateQuality(input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    func testUpdateQuantityWithNormalItemOfZeroQuality() {
        let input = [Item(name: "Khadgar's Whisker", sellIn: -10, quality: 0)]
        let expectedOutput = [Item(name: "Khadgar's Whisker", sellIn: -11, quality: 0)]
        let actualOutput = GildedRose.updateQuality(input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    // MARK: Aged Brie
    
    func testUpdateQuantityWithAgedBrie() {
        let input = [Item(name: "Aged Brie", sellIn: 10, quality: 15)]
        let expectedOutput = [Item(name: "Aged Brie", sellIn: 9, quality: 16)]
        let actualOutput = GildedRose.updateQuality(input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    func testUpdateQuantityWithAgedBrieAtMaxQuality() {
        let input = [Item(name: "Aged Brie", sellIn: 10, quality: 50)]
        let expectedOutput = [Item(name: "Aged Brie", sellIn: 9, quality: 50)]
        let actualOutput = GildedRose.updateQuality(input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    func testUpdateQuantityWithAgedBrieOnSellDate() {
        let input = [Item(name: "Aged Brie", sellIn: 0, quality: 15)]
        let expectedOutput = [Item(name: "Aged Brie", sellIn: -1, quality: 17)]
        let actualOutput = GildedRose.updateQuality(input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    func testUpdateQuantityWithAgedBrieOnSellDateNearMaxQuality() {
        let input = [Item(name: "Aged Brie", sellIn: 0, quality: 49)]
        let expectedOutput = [Item(name: "Aged Brie", sellIn: -1, quality: 50)]
        let actualOutput = GildedRose.updateQuality(input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    func testUpdateQuantityWithAgedBrieOnSellDateAtMaxQuality() {
        let input = [Item(name: "Aged Brie", sellIn: 0, quality: 50)]
        let expectedOutput = [Item(name: "Aged Brie", sellIn: -1, quality: 50)]
        let actualOutput = GildedRose.updateQuality(input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    func testUpdateQuantityWithAgedBrieAfterSellDate() {
        let input = [Item(name: "Aged Brie", sellIn: -10, quality: 15)]
        let expectedOutput = [Item(name: "Aged Brie", sellIn: -11, quality: 17)]
        let actualOutput = GildedRose.updateQuality(input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    func testUpdateQuantityWithAgedBrieAfterSellDateNearMaxQuality() {
        let input = [Item(name: "Aged Brie", sellIn: -10, quality: 49)]
        let expectedOutput = [Item(name: "Aged Brie", sellIn: -11, quality: 50)]
        let actualOutput = GildedRose.updateQuality(input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    func testUpdateQuantityWithAgedBrieAfterSellDateAtMaxQuality() {
        let input = [Item(name: "Aged Brie", sellIn: -10, quality: 50)]
        let expectedOutput = [Item(name: "Aged Brie", sellIn: -11, quality: 50)]
        let actualOutput = GildedRose.updateQuality(input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    // MARK: Sulfuras
    
    func testUpdateQuantityWithSulfuras() {
        let input = [Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 10, quality: 80)]
        let expectedOutput = [Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 10, quality: 80)]
        let actualOutput = GildedRose.updateQuality(input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    func testUpdateQuantityWithSulfurasOnSellDate() {
        let input = [Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80)]
        let expectedOutput = [Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80)]
        let actualOutput = GildedRose.updateQuality(input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    func testUpdateQuantityWithSulfurasAfterSellDate() {
        let input = [Item(name: "Sulfuras, Hand of Ragnaros", sellIn: -10, quality: 80)]
        let expectedOutput = [Item(name: "Sulfuras, Hand of Ragnaros", sellIn: -10, quality: 80)]
        let actualOutput = GildedRose.updateQuality(input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    // MARK: Backstage Passes
    
    func testUpdateQuantityWithPassesLongBeforeSellDate() {
        let input = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 11, quality: 5)]
        let expectedOutput = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 6)]
        let actualOutput = GildedRose.updateQuality(input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    func testUpdateQuantityWithPassesLongBeforeSellDateAtMaxQuality() {
        let input = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 11, quality: 50)]
        let expectedOutput = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 50)]
        let actualOutput = GildedRose.updateQuality(input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    func testUpdateQuantityWithPassesBeforeSellDateUpperBound() {
        let input = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 5)]
        let expectedOutput = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 9, quality: 7)]
        let actualOutput = GildedRose.updateQuality(input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    func testUpdateQuantityWithPassesBeforeSellDateLowerBound() {
        let input = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 6, quality: 5)]
        let expectedOutput = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 7)]
        let actualOutput = GildedRose.updateQuality(input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    func testUpdateQuantityWithPassesJustBeforeSellDateUpperBound() {
        let input = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 5)]
        let expectedOutput = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 4, quality: 8)]
        let actualOutput = GildedRose.updateQuality(input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    func testUpdateQuantityWithPassesJustBeforeSellDateLowerBound() {
        let input = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 1, quality: 5)]
        let expectedOutput = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 0, quality: 8)]
        let actualOutput = GildedRose.updateQuality(input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    func testUpdateQuantityWithPassesOnSellDate() {
        let input = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 0, quality: 5)]
        let expectedOutput = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: -1, quality: 0)]
        let actualOutput = GildedRose.updateQuality(input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    func testUpdateQuantityWithPassesAfterSellDate() {
        let input = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: -1, quality: 5)]
        let expectedOutput = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: -2, quality: 0)]
        let actualOutput = GildedRose.updateQuality(input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    // MARK: Conjured Items
    
    func testUpdateQuantityWithConjuredItem() {
        let input = [Item(name: "Conjured Mana Cake", sellIn: 5, quality: 5)]
        let expectedOutput = [Item(name: "Conjured Mana Cake", sellIn: 4, quality: 3)]
        let actualOutput = GildedRose.updateQuality(input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    func testUpdateQuantityWithConjuredItemAtLowQuality() {
        let input = [Item(name: "Conjured Mana Cake", sellIn: 5, quality: 1)]
        let expectedOutput = [Item(name: "Conjured Mana Cake", sellIn: 4, quality: 0)]
        let actualOutput = GildedRose.updateQuality(input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    func testUpdateQuantityWithConjuredItemOnSellDate() {
        let input = [Item(name: "Conjured Mana Cake", sellIn: 0, quality: 5)]
        let expectedOutput = [Item(name: "Conjured Mana Cake", sellIn: -1, quality: 1)]
        let actualOutput = GildedRose.updateQuality(input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    func testUpdateQuantityWithConjuredItemAfterSellDate() {
        let input = [Item(name: "Conjured Mana Cake", sellIn: -1, quality: 5)]
        let expectedOutput = [Item(name: "Conjured Mana Cake", sellIn: -2, quality: 1)]
        let actualOutput = GildedRose.updateQuality(input)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
}
