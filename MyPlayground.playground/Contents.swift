//
//The Non-Zero Digital Product
//
//Given a positive integer 1 <= N <= 100000000 through one of our standard input methods, multiply every digit together, ignoring zeroes.
//
//Ex: Take a number, say 361218402:
//
//3 * 6 = 18
//18 * 1 = 18
//18 * 2 = 36
//36 * 1 = 36
//36 * 8 = 288
//288 * 4 = 1152
//1152 * 1 (ignore zeroes or turn them into ones) = 1152
//1152 * 2 = 2304
//The output for 361218402 is 2304
//
//    Test Cases
//    1 => 1
//    10 => 1
//    20 => 2
//    100 => 1
//    999 => 729
//    21333 => 54
//    17801 => 56
//    4969279 => 244944
//    100000000 => 1
//
//    Time-box: 1 hour
//    Mainstream languages only
//    Answers due by Monday (9/30/2019)
//
//    Submit responses as links to tio.run or repl.it (or similar) to code-challenge@mybluprint.com

// MARK: - Implementation

func multiplyAllValues(_ input: Int) -> Int {
    return "\(input)".compactMap {  $0.wholeNumberValue }.reduce(1) { (previous, number) in
        guard number > 0 else { return previous }
        return number*previous
    }
}


// MARK: - Test validation

import XCTest

class Tests: XCTestCase {
    // Degenerate case

    func testOneValue() {
        let output = multiplyAllValues(7)
        
        XCTAssertEqual(output, 7)
    }
    
    // Core logic
    
    func testTwoValues() {
        let output = multiplyAllValues(17)
        
        XCTAssertEqual(output, 7)
    }
    func testManyNonZeroValues() {
        let output = multiplyAllValues(43218765)
        
        XCTAssertEqual(output, 40_320)
    }
    
    func testTwoValuesIgnoringZero() {
        let output = multiplyAllValues(05)
        
        XCTAssertEqual(output, 5)
    }
    
    func testManyValuesIncludingZero() {
        let output = multiplyAllValues(1050809)
        
        XCTAssertEqual(output, 360)
    }
    
    // Challenge Vlidatio
    //    Test Cases
    //    1 => 1
    //    10 => 1
    //    20 => 2
    //    100 => 1
    //    999 => 729
    //    21333 => 54
    //    17801 => 56
    //    4969279 => 244944
    //    100000000 => 1

    func testChallengeCases() {
        XCTAssertEqual(multiplyAllValues(1), 1)
        XCTAssertEqual(multiplyAllValues(10), 1)
        XCTAssertEqual(multiplyAllValues(20), 2)
        XCTAssertEqual(multiplyAllValues(100), 1)
        XCTAssertEqual(multiplyAllValues(999), 729)
        XCTAssertEqual(multiplyAllValues(21333), 54)
        XCTAssertEqual(multiplyAllValues(17801), 56)
        XCTAssertEqual(multiplyAllValues(4969279), 244944)
        XCTAssertEqual(multiplyAllValues(100000000), 1)
    }
    
}

Tests.defaultTestSuite.run()
