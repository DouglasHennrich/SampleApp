//
//  Observable.swift
//  SampleApp
//
//  Created by Douglas Hennrich on 21/02/23.
//

import Foundation

final class Observable<Value> {
  // MARK: Properties
  private var observers: [Observer<Value>] = []

  var value: Value {
    didSet {
      notifyObservers()
    }
  }

  // MARK: Init
  public init(_ value: Value) {
    self.value = value
  }

  // MARK: Actions
  func observe(on observer: AnyObject, observerBlock: @escaping (Value) -> Void) {
    observers.append(Observer(observer: observer, block: observerBlock))
    observerBlock(value)
  }

  func remove(observer: AnyObject) {
    observers = observers.filter { $0.observer !== observer }
  }

  private func notifyObservers() {
    for observer in observers {
      DispatchQueue.main.async { observer.block(self.value) }
    }
  }
}

private extension Observable {
  struct Observer<Value> {
    weak var observer: AnyObject?
    let block: (Value) -> Void
  }
}
