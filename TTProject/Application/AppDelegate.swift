//
//  AppDelegate.swift
//  TTProject
//
//  Created by infludeo on 2022/03/11.
//

import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  let appDependency: AppDependency
  var window: UIWindow?

  private override init() {
    self.appDependency = AppDependency.resolve()
    super.init()
  }

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.

    // TODO: window 처리 필요

    return true
  }
}

