import XCTest
import Combine
@testable import property_wrapper

final class property_wrapperTests: XCTestCase {
    func testClass1() {
        let a = PWTC()
        var a_test = false
        var new_value = 1
        let cancel1 = a.$counter.sink { value in
            a_test = new_value == value
        }
        a.counter = new_value
        XCTAssertTrue(a_test)
        new_value = 2
        a.counter = new_value
        XCTAssertTrue(a_test)
        cancel1.cancel()
    }
    func testClass2() {
        let a = PWTC()
        var a_test = false
        var new_value = "alpha"
        let cancel1 = a.$name.sink { value in
            a_test = new_value == value
        }
        a.name = new_value
        XCTAssertTrue(a_test)
        new_value = "beta"
        a.name = new_value
        XCTAssertTrue(a_test)
        cancel1.cancel()
    }
    func testClass3() {
        let a = PWTC()
        var a_test = false
        var new_value = [1,1,1]
        let cancel1 = a.$list.sink { value in
            a_test = new_value == value
        }
        a.list = new_value
        XCTAssertTrue(a_test)
        new_value = [2,2,2]
        a.list = new_value
        XCTAssertTrue(a_test)
        a_test = false
        new_value = [3,2,2]
        a.list[0] = 3
        XCTAssertTrue(a_test)
        cancel1.cancel()
    }
    func testStruct1() {
        var a = PWTS()
        var a_test = false
        var new_value = 1
        let cancel1 = a.$counter.sink { value in
            a_test = new_value == value
        }
        a.counter = new_value
        XCTAssertTrue(a_test)
        new_value = 2
        a.counter = new_value
        XCTAssertTrue(a_test)
        cancel1.cancel()
    }
    func testStruct2() {
        var a = PWTS()
        var a_test = false
        var new_value = "alpha"
        let cancel1 = a.$name.sink { value in
            a_test = new_value == value
        }
        a.name = new_value
        XCTAssertTrue(a_test)
        new_value = "beta"
        a.name = new_value
        XCTAssertTrue(a_test)
        cancel1.cancel()
    }
    func testStruct3() {
        var a = PWTS()
        var a_test = false
        var new_value = [1,1,1]
        let cancel1 = a.$list.sink { value in
            a_test = new_value == value
        }
        a.list = new_value
        XCTAssertTrue(a_test)
        new_value = [2,2,2]
        a.list = new_value
        XCTAssertTrue(a_test)
        a_test = false
        new_value = [3,2,2]
        a.list[0] = 3
        XCTAssertTrue(a_test)
        cancel1.cancel()
    }
}

final class PropertyWrapperTestClass {
    @Broadcast var counter: Int = 0
    @Broadcast var name: String = ""
    @Broadcast var list: [Int] = [1, 2, 3]
}

struct PropertyWrapperTestStruct {
    @Broadcast var counter: Int = 0
    @Broadcast var name: String = ""
    @Broadcast var list: [Int] = [1, 2, 3]
}

typealias PWTC = PropertyWrapperTestClass        
typealias PWTS = PropertyWrapperTestStruct

