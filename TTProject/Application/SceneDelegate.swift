//
//  SceneDelegate.swift
//  TTProject
//
//  Created by infludeo on 2022/03/11.
//

import UIKit
import Pure

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  let appDependency: AppDependency
  var window: UIWindow?

  let appDelegate = UIApplication.shared.delegate as! AppDelegate

  override init() {
    self.appDependency = AppDependency.resolve()
  }

  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {

     // SceneDelegate의 프로퍼티에 설정해줌
    // 맨 처음 보여줄 ViewController
    guard let windowScene = (scene as? UIWindowScene) else { return }

    // TODO: 루트 컨트롤러 생성 필요
//    self.appDelegate.compositionRoot.dependency.window = UIWindow(windowScene: windowScene)

    self.window = UIWindow(windowScene: windowScene)

//    let root = self.appDelegate.compositionRoot.viewControllerFactory.create(
//        payload: ViewController.Payload()
//    )
//    self.appDelegate.compositionRoot.dependency.window.rootViewController = root
//    self.appDelegate.compositionRoot.dependency.window.makeKeyAndVisible()

    self.window?.rootViewController = self.appDependency.rootControllerFactory.create(payload: Void())
  }
}
