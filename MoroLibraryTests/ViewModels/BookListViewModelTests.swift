//
//  BookListViewModelTests.swift
//  MoroLibraryTests
//
//  Created by Bruno Madeira on 29/01/2026.
//

import XCTest
@testable import MoroLibrary

@MainActor

final class BookListViewModelTests: XCTestCase {
    
    func testLoadInitialBookSuccess() async {
        
        let mockService = MockBookServices()
        
        mockService.result = .success(.mockPage1)
        
        let vm = BookListViewModel(service: mockService)
        
        await vm.loadInitialBooks()
        
        XCTAssertEqual(vm.books.count, 20)
        XCTAssertNil(vm.uiError)
        XCTAssertEqual(vm.books.first?.title, "Book 1")
        XCTAssertEqual(vm.books.last?.title, "Book 20")
    }
    
    func testLoadNextPageAppendsBooks() async {
        let mockService = MockBookServices()
        mockService.result = .success(.mockPage1)
        
        let vm = BookListViewModel(service: mockService)
        await vm.loadInitialBooks()
        
        XCTAssertEqual(vm.books.count, 20)
        
        mockService.result = .success(.mockPage2)
        
        await vm.loadNextPage()
        
        XCTAssertEqual(vm.books.count, 40)
        XCTAssertEqual(vm.books.last?.title, "Book 40")
    }
    
    func testLoadBooksFailureShowError() async {
        let mockService = MockBookServices()
        
        mockService.result = .failure(NetworkError.badResponse)
        
        let vm = BookListViewModel(service: mockService)
        
        await vm.loadInitialBooks()
        
        XCTAssertNotNil(vm.uiError)
        XCTAssertEqual(vm.uiError?.title, "Error")
        XCTAssertTrue(vm.books.isEmpty)
    }
    
    func testLoadNextPageWhileLoadingDoesNothing() async {
        let mockService = MockBookServices()
        mockService.result = .success(.mockPage1)

        let vm = BookListViewModel(service: mockService)

        await vm.loadInitialBooks()

        await vm.loadNextPage()
        await vm.loadNextPage()

        XCTAssertEqual(vm.books.count, 40)
    }
}
