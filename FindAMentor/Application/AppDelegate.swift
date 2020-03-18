import UIKit
import Katana
import Tempura

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, RootInstaller {

  var window: UIWindow?
  var store: Store<AppState, DependenciesContainer>!

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.

    // Configure the window
    let window = UIWindow()
    self.window = window
    self.window?.makeKeyAndVisible()

    // Create the katana store that will handle the initialization of the dependencies
    // and will receive all the dispatchables of the app
    self.store = Store<AppState, DependenciesContainer>()

    // Navigate to the first screen of the app
    self.store?.dependencies?.navigator.start(
      using: self,
      in: self.window!,
      at: Screen.startingScreen.rawValue
    )

    return true
  }

}

extension AppDelegate {
  func installRoot(identifier: RouteElementIdentifier, context: Any?, completion: @escaping () -> ()) -> Bool {
    // verify that the identifier is an allowed identifier
    guard let rootScreen = Screen(rawValue: identifier) else {
      return false
    }

    let mainViewController: UIViewController

    //create the vc based on the identifier
    switch rootScreen {
    case .startingScreen:
      mainViewController = StartingScreenVC(store: self.store, connected: true)
    }

    // set the view controller as the root one
    self.window?.rootViewController = mainViewController
    completion()

    // notify tempura that the navigation has been managed
    return true
  }
}
