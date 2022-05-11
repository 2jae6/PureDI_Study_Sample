//
//  SceneDelegate.swift
//  TTProject
//
//  Created by infludeo on 2022/03/11.
//

import UIKit
import Pure

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?
  let appDelegate = UIApplication.shared.delegate as! AppDelegate

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {


     // SceneDelegate의 프로퍼티에 설정해줌
    // 맨 처음 보여줄 ViewController
    guard let windowScene = (scene as? UIWindowScene) else { return }
    self.appDelegate.compositionRoot.dependency.window = UIWindow(windowScene: windowScene)

    let root = self.appDelegate.compositionRoot.viewControllerFactory.create(
        payload: ViewController.Payload()
    )
    self.appDelegate.compositionRoot.dependency.window.rootViewController = root
    self.appDelegate.compositionRoot.dependency.window.makeKeyAndVisible()

  }

  func sceneDidDisconnect(_ scene: UIScene) {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
  }

  func sceneDidBecomeActive(_ scene: UIScene) {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
  }

  func sceneWillResignActive(_ scene: UIScene) {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
  }

  func sceneWillEnterForeground(_ scene: UIScene) {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
  }

  func sceneDidEnterBackground(_ scene: UIScene) {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
  }


}
