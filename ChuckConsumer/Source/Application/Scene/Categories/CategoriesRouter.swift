import UIKit

class CategoriesRouter: CategoriesWireframe {
    weak var viewController: UIViewController?

    func showJoke(category: Category) {
        let controller = JokeSceneCreator.create(category: category)
        viewController?.present(controller, animated: true, completion: nil)
    }
}
