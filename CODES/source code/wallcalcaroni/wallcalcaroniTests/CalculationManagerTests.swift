//
//  CalculationManagerTests.swift
//  wallcalcaroniTests
//
//  Created by wafaa on 3/13/20.
//  Copyright © 2020 Caleb Stultz. All rights reserved.
//

import XCTest
@testable import wallcalcaroni

class CalculationManagerTests: XCTestCase {
    
    var sut: CalculationManager!

    override func setUp() {
        // This method is called before the invocation of each test method in the class.
        sut = CalculationManager()
        
    }

    override func tearDown() {
        // This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }

    func testInit_WhenGivenValues_TakesValues() {
        let calManager1 = CalculationManager(valueA: 10, valueB: 20, currentOperand: .multiply, valueEntryArray: [])
        let calManager2 = CalculationManager(valueA: 10, valueB: 20, currentOperand: .multiply, valueEntryArray: [])
        XCTAssertEqual(calManager1, calManager2)
    }
    
    func testValues_AreInitiallyZero() {
        XCTAssertEqual(sut.valueA, 0)
        XCTAssertEqual(sut.valueB, 0)
    }
    
    func testValues_InsertingValues_ChangesValuA() {
        sut.insert(value: 10)
        XCTAssertEqual(sut.valueA, 10)
    }
    
    func testOperand_IsInitiallyNil() {
        XCTAssertNil(sut.currentOperand, "Opernad should be nil")
    }
    
    func testOperand_WhenGivenOperand_SetsOperand() {
        sut.insert(value: 10)
        sut.set(operand: .multiply)
        XCTAssertNotNil(sut.currentOperand)
    }
    
    func testCalculation_ForValues() {
        sut.insert(value: 10)
        sut.set(operand: .subtract)
        sut.insert(value: 5)
        XCTAssertEqual(sut.calculate(), 5)
    }
    
    func testClear_WhenCalledClearsValues() {
        sut.insert(value: 10)
        _ = sut.clearValues()
        XCTAssertEqual(sut.valueA, 0)
        XCTAssertEqual(sut.valueB, 0)
        XCTAssertEqual(sut.valueEntryArray, [])
    }
    
}
