//
//  CalculatriceTests.swift
//  CalculatriceTests
//
//  Created by Digital on 20/03/2018.
//  Copyright © 2018 Remi. All rights reserved.
//

import XCTest
@testable import Calculatrice

class CalculatriceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    

    
    func testCanPerformCalc(){
        let calc = Calcul()
        
        calc.leftOp = "5"
        calc.rightOp = "3"
        calc.operatorValue = Calcul.Operators.plus
    
        var x:Float?
        if(calc.operatorValue == Calcul.Operators.plus && calc.rightOp != nil){
            x = ((calc.leftOp! as NSString).floatValue) + ((calc.rightOp! as NSString).floatValue)
        }
        if(calc.operatorValue == Calcul.Operators.minus && calc.rightOp != nil){
            x = ((calc.leftOp! as NSString).floatValue) - ((calc.rightOp! as NSString).floatValue)
        }
        if(calc.operatorValue == Calcul.Operators.mult && calc.rightOp != nil){
            x = ((calc.leftOp! as NSString).floatValue) * ((calc.rightOp! as NSString).floatValue)
        }
        if(calc.operatorValue == Calcul.Operators.divide && calc.rightOp != nil){
            x = ((calc.leftOp! as NSString).floatValue) / ((calc.rightOp! as NSString).floatValue)
        }
        calc.showValue = String(format:"%g", x!)
        
    }
    
    
    
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
