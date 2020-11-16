//
//  MealPlanTests.swift
//  MealPlanTests
//
//  Created by Adam Jessop on 25/10/2020.
//

import XCTest
@testable import MealPlan

class MealPlanTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

extension MealPlanTests: Downloading {
    
    //To make this fail use a made up URL, e.g. "https://www.google12345.com". Semaphore necessary to stop it ending right away and being a 'success' regardless of whether it was or not.
    func testNetworkingData() throws {
        let semaphore = DispatchSemaphore(value: 0)
        downloadContent(type: Data(), url: URL(string: "https://www.google.com")!, cachePolicy: .reloadRevalidatingCacheData) { (data, error) in
            guard error == nil else {
                print("Test FAILED - testNetworkingData - error")
                XCTFail()
                semaphore.signal()
                return
            }
            XCTAssertNotNil(data)
            semaphore.signal()
        }
        semaphore.wait()
    }
    
    //to make this fail use any non image URL, e.g. "https://www.google.com". Semaphore necessary to stop it ending right away and being a 'success' regardless of whether it was or not.
    func testNetworkingImage() throws {
        let semaphore = DispatchSemaphore(value: 0)
        downloadContent(type: UIImage(), url: URL(string: "https://cdn.imgbin.com/14/18/17/imgbin-apple-logo-RbLn6b2c30cQdhp6EFfwLfR7C.jpg")!, cachePolicy: .reloadRevalidatingCacheData) { (image, error) in
            guard error == nil else {
                print("Test FAILED - testNetworkingImage - error")
                XCTFail()
                semaphore.signal()
                return
            }
            XCTAssertNotNil(image)
            semaphore.signal()
        }
        semaphore.wait()
    }
    
}

//autoscrolling UI test to do
