//
//  SceneDelegate.swift
//  SampleApp
//
//  Created by Douglas Hennrich on 20/02/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?
  var appCoordinator: Coordinator?

  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    let navigationController = UINavigationController()

    window = UIWindow(windowScene: windowScene)
    window?.rootViewController = navigationController
    appCoordinator = AppCoordinator(navigationController: navigationController)

    appCoordinator?.start()
    window?.makeKeyAndVisible()
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

#if DEBUG
import FLEX
extension UIViewController {
  open override var canBecomeFirstResponder: Bool {
    true
  }

  open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    if motion == .motionShake {
      handleShake()
      FLEXManager.shared.showExplorer()
    }
  }

  func handleShake() {
    UIView.addOrangeBordersInSubviews(view: self.view)
  }
}
public extension UIView {
  class func addOrangeBordersInSubviews(view: UIView) {
    view.layer.borderColor = UIColor.orange.withAlphaComponent(0.6).cgColor
    view.layer.borderWidth = 0.5

    if view.layer.cornerRadius == 0 {
      view.layer.cornerRadius = 2
    }

    for subview in view.subviews {
      if subview.frame.height < 2 || subview.frame.width < 2 { continue }
      addOrangeBordersInSubviews(view: subview)
    }
  }
}
#endif
