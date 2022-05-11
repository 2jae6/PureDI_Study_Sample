//
//  CompositionRoot.swift
//  TTProject
//
//  Created by infludeo on 2022/05/10.
//

import Pure
import UIKit

final class CompositionRoot: FactoryModule {

  /// dependency for AppDelegate
  struct Dependency {
    var window: UIWindow
  }

  struct Payload {

  }

  var dependency: Dependency
  let payload: Payload

  init(dependency: Dependency, payload: Payload) {
    self.dependency = dependency
    self.payload = payload
  }

  // this is where the PureDI happen, it should be called in where the application is loaded
  static func resolve() -> CompositionRoot {
      let window = UIWindow(frame: UIScreen.main.bounds)
    return CompositionRoot(dependency: CompositionRoot.Dependency.init(window: window),
                           payload: CompositionRoot.Payload()
    )
  }

  // root scence factory
  lazy var viewControllerFactory = ViewController.Factory(
      dependency: ViewController.Dependency(
          window: self.dependency.window,
          viewModel: self.viewModelFactory
      )
  )

  lazy var viewModelFactory = ViewModel.Factory(
    dependency: ViewModel.Dependency()
  )

}
