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
