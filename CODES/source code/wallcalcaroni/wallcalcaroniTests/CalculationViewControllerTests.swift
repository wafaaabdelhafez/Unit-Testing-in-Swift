//
//  CalculationViewControllerTests.swift
//  wallcalcaroniTests
//
//  Created by wafaa on 3/14/20.
//  Copyright © 2020 Caleb Stultz. All rights reserved.
//

import XCTest
@testable import wallcalcaroni

class CalculationViewControllerTests: XCTestCase {
    
    var sut: CalculatorViewController!

    override func setUp() {
        // This method is called before the invocation of each test method in the class.
        super.setUp()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        sut = (storyBoard.instantiateViewController(withIdentifier: "CalculatorViewController") as! CalculatorViewController)
        sut.loadViewIfNeeded()
    }
    
    func testAddingValue_ShouldUpendAndUpdateLabel() {
        sut.twoBtn.sendActions(for: .touchUpInside)
        sut.fiveBtn.sendActions(for: .touchUpInside)
        XCTAssertEqual(sut.valueLabel.text, "25")
    }
    
    func testEqualsButton_ShouldPerformCalculationAndUpdateLabel() {
        sut.twoBtn.sendActions(for: .touchUpInside)
        sut.fiveBtn.sendActions(for: .touchUpInside)
        sut.subtractBtn.sendActions(for: .touchUpInside)
        sut.fiveBtn.sendActions(for: .touchUpInside)
        sut.equalsBtn.sendActions(for: .touchUpInside)
        XCTAssertEqual(sut.valueLabel.text, "20")
    }
    
    func testOperandButtons_ShouldChangeOperandWhenTapped() {
        sut.fourBtn.sendActions(for: .touchUpInside)
        sut.multiplyBtn.sendActions(for: .touchUpInside)
        sut.addBtn.sendActions(for: .touchUpInside)
        sut.fourBtn.sendActions(for: .touchUpInside)
        sut.equalsBtn.sendActions(for: .touchUpInside)
        XCTAssertEqual(sut.valueLabel.text, "8")
    }
    
    func testClearButton_ShouldClearLabel() {
        sut.oneBtn.sendActions(for: .touchUpInside)
        sut.acBtn.sendActions(for: .touchUpInside)
        XCTAssertEqual(sut.valueLabel.text, "0")
    }

    override func tearDown() {
        // This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }

}
