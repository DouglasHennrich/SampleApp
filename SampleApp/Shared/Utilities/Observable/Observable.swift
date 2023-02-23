//
//  Observable.swift
//  SampleApp
//
//  Created by Douglas Hennrich on 21/02/23.
//

import Foundation

class Observable<T> {
  typealias Listener = ((T) -> Void)

  private(set) var listener: Listener?

  var onSetEvents: Int = 0

  private var justOneFire = false

  func bind(listener: Listener?) {
    self.listener = listener
  }

  func bindAndFire(listener: Listener?) {
    self.listener = listener
    callListener()
  }

  func bindOnce(listener: Listener?) {
    justOneFire = true
    self.listener = listener
  }

  var value: T {
    didSet {
      onSetEvents += 1
      callListener()
    }
  }

  init(_ value: T) {
    self.value = value
  }

  func isBinded() -> Bool {
    return listener != nil
  }

  func fire() {
    callListener()
  }

  private func callListener() {
    if Thread.isMainThread {
      listener?(value)

      if justOneFire {
        listener = nil
      }
    } else {
      DispatchQueue.main.async {
        self.listener?(self.value)

        if self.justOneFire {
          self.listener = nil
        }
      }
    }
  }
}
