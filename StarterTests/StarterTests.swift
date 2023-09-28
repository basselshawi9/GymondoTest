//
//  StarterTests.swift
//  StarterTests
//
//  Created by iMac on 9/22/23.
//

import XCTest
@testable import Starter

final class StarterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetExercises() throws {
        
        if let viewModel : ExerciseViewModel = DependencyInjector.shared.getService() {
            viewModel.exercisesState.sink { state in
                if let successState = state as? GetExerciseSuccessState {
                    if let results = successState.model.results {
                        //check if results count is 20 as per default
                        XCTAssertEqual(results.count, 20)
                        //check if prev data is null since this is the first page
                        XCTAssertNil(successState.model.previous)
                        //check if next data doesn't equal to null
                        XCTAssertNotNil(successState.model.next)
                    }
                    else {
                        XCTAssertTrue(false,"Data is null")
                    }
                }
                else if let errorState = state as? GetExerciseFailureState {
                    XCTAssertTrue(false,"\(errorState.error.localizedDescription)")
                }
            }
            .store(in: &viewModel.cancelables)
            viewModel.addEvent(event: GetExercisesEvent())
        }
        else {
            XCTAssertTrue(false,"Dependency Injector failed to locate ViewModel")
        }
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
