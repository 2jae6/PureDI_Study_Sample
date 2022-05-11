//
//  ViewController.swift
//  TTProject
//
//  Created by infludeo on 2022/05/04.
//

import UIKit
import Pure

final class ViewController: UIViewController, FactoryModule {

  struct Dependency {
    let window: UIWindow
    let viewModel: ViewModel.Factory
  }

  struct Payload {

  }

  private let dependency: Dependency
  private let payload: Payload

  var viewModel: ViewModel?

  init(dependency: Dependency, payload: Payload) {
      self.dependency = dependency
      self.payload = payload
      super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) { fatalError() }


  override func viewDidLoad() {
    self.view.backgroundColor = .red

    self.viewModel = self.dependency.viewModel.create(payload: ViewModel.Payload())

    print(self.viewModel?.model.Keyboard)
    self.viewModel?.model.Keyboard = "초콜렛"
    print(self.viewModel?.model.Keyboard)
  }
    
    
}

