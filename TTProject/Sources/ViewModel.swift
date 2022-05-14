//
//  ViewModel.swift
//  TTProject
//
//  Created by infludeo on 2022/05/11.
//

import Foundation
import Pure


final class ViewModel: FactoryModule {

  struct Dependency {

  }

  struct Payload {

  }
  
  let dependency: Dependency
  let payload: Payload

  init(dependency: Dependency, payload: Payload) {
    self.dependency = dependency
    self.payload = payload
  }

  var model = Computer()

  private func getModel() {
    print(model.Keyboard)
  }

}


// MARK: With DI Container

protocol SomeServiceProtocol {
  func loadSomeData(contentID: String) -> String
}

final class SomeService: SomeServiceProtocol {
  func loadSomeData(contentID: String) -> String {
    return "\(contentID)"
  }
}


final class ViewModel2: FactoryModule {

  // MARK: Module

  struct Dependency {
    let someService: SomeServiceProtocol
  }

  struct Payload {
    let contentID: String
  }


  // MARK: Properties

  private let dependency: Dependency
  private let payload: Payload


  // MARK: Initializing

  init(dependency: Dependency, payload: Payload) {
    // So Bad
    // self.someService = SomeService()
    // self.someService = SomeService.shared

    // Bad
    // self.someService = DI.resolve(SomeService.self)

    // Good
    self.dependency = dependency
    self.payload = payload
  }

  var model = Computer()


  // MARK: Load

  private func getModel() {
    print(model.Keyboard)

    let data = self.dependency.someService.loadSomeData(contentID: self.payload.contentID)
    print("data: \(data)")
  }
}

let viewModel2Factory = ViewModel2.Factory(dependency: ViewModel2.Dependency(
  someService: SomeService()
))
let viewModel2 = viewModel2Factory.create(payload: ViewModel2.Payload(
  contentID: "1239085"
))


//final class BlackBoxItem: FactoryModule {
//  init(dependency: Void, payload: Void) {
//    print("Pure DI")
//  }
//}

let blackBoxItem = BlackBox.generateItem()











final class BlackBox {
  static func generateItem() -> BlackBoxItem {
    // ...
    return BlackBoxItem.init()
  }
}

final class BlackBoxItem: ConfiguratorModule {

  // MARK: Module

  struct Dependency {
    let someService: SomeServiceProtocol
  }

  struct Payload {
    let contentID: String
  }


  // MARK: Properties

  private var dependency: Dependency?
  private var payload: Payload?


  // MARK: Configuring

  func configure(dependency: Dependency, payload: Payload) {
    guard self.payload?.contentID != payload.contentID else { return }
    self.dependency = dependency
    self.payload = payload

    self.loadSomeData()
  }

  private func loadSomeData() {
    guard let contentID = self.payload?.contentID else { return }
    _ = self.dependency?.someService.loadSomeData(contentID: contentID)
//    print(someData)


//    let blackBoxConfigurator = BlackBoxItem.Configurator(dependency: BlackBoxItem.Dependency(
//      someService: SomeService()
//    ))
//
//    let blackItem2 = BlackBox.generateItem()
//
//    blackBoxConfigurator.configure(blackItem2, payload: BlackBoxItem.Payload(
//      contentID: "1290381805"
//    ))
  }


//  init(dependency: Void, payload: Void) {
//    print("Pure DI")
//  }
}

