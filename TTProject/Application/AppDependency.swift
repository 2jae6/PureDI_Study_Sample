//
//  CompositionRoot.swift
//  TTProject
//
//  Created by infludeo on 2022/05/10.
//

import Pure
import UIKit

final class AppDependency {
//  let window: UIWindow
  let rootControllerFactory: SplashViewController.Factory

  init(
//    window: UIWindow,
    rootControllerFactory: SplashViewController.Factory
  ) {
    self.rootControllerFactory = rootControllerFactory
  }

  static func resolve() -> AppDependency {
  //    self.window = window

    // Feature
    let featureControllerFactory = FeatureViewController.Factory(dependency: .init(
    ))

    // Main
    let mainViewControllerFactory = MainViewController.Factory(dependency: .init(
      featureViewControllerFactory: featureControllerFactory
    ))

    // Splash
    let rootControllerFactory = SplashViewController.Factory(dependency: .init(
      mainViewControllerFactory: mainViewControllerFactory
    ))

    return AppDependency(
//      window: window,
      rootControllerFactory: rootControllerFactory
    )
  }
}

final class SplashViewController: UIViewController, FactoryModule {
  struct Dependency {
    let mainViewControllerFactory: MainViewController.Factory
  }
}

final class MainViewController: UIViewController, FactoryModule {
  struct Dependency {
    let featureViewControllerFactory: FeatureViewController.Factory
  }
}

final class FeatureViewController: UIViewController, FactoryModule {
  struct Dependency {
  }
}
