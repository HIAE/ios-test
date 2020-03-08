import UIKit

class AppMain {
    var window: UIWindow?

    init(using window: UIWindow?) {
        self.window = window
    }

    func run() -> Bool {
        guard let window = self.window else {
            return false
        }

        let viewController = CategoriesSceneCreator.create()

        window.rootViewController = viewController
        window.makeKeyAndVisible()
        return true
    }
}
