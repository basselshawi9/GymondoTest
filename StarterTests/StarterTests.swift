//
//  StarterTests.swift
//  StarterTests
//
//  Created by iMac on 9/22/23.
//

import XCTest
import Combine

@testable import Starter

final class StarterTests: XCTestCase {
    
    var cancelables : Set<AnyCancellable> = []
    
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
                    }
                    else {
                        XCTAssertTrue(false,"Data is null")
                    }
                }
                else if let errorState = state as? ExerciseFailureState {
                    XCTAssertTrue(false,"\(errorState.error.localizedDescription)")
                }
            }
            .store(in: &cancelables)
            viewModel.addEvent(event: GetExercisesEvent())
        }
        else {
            XCTAssertTrue(false,"Dependency Injector failed to locate ViewModel")
        }
    }
    
    func testGetCachedExercies() throws {
        
        if let localDataSrouce : ExerciseLocalDataSrouce =  DependencyInjector.shared.getService(){
            localDataSrouce.getExercises().receive(on: DispatchQueue.main).sink { completion in
                switch completion {
                case .failure(let err):
                    XCTAssertTrue(false,"\(err.localizedDescription)")
                    break
                case .finished:
                    break
                }
                
            } receiveValue: { model in
                
                if let exercies = model.results {
                    //Test if caching exercies is working correctly
                    XCTAssertEqual(exercies.count, 20)
                }
                
            }.store(in: &cancelables)
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
