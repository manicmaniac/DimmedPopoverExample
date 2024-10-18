import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow()
        self.window = window
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [UINavigationController(rootViewController: ViewController())]
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        return true
    }
}
