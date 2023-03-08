//
//  TestsExtension.swift
//  SampleAppTests
//
//  Created by Douglas Hennrich on 02/03/23.
//

import Foundation
import XCTest

extension XCTestCase {
  func checkMemoryLeak(
    for instance: AnyObject,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    addTeardownBlock { [weak instance] in
      XCTAssertNil(instance, file: file, line: line)
    }
  }
}
