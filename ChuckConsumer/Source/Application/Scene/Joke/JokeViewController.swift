import UIKit

class JokeViewController: UIViewController, JokeView {

    @IBOutlet weak var jokeLabel: UILabel!

    let presenter: JokePresenter

    init(presenter: JokePresenter) {
        let nibName = "JokeViewController"
        self.presenter = presenter
        super.init(nibName: nibName, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        clean()
        presenter.getJoke()
    }

    func clean() {
        jokeLabel.text = ""
    }

    func show(joke: Joke) {
        DispatchQueue.main.async {
            self.jokeLabel.text = joke.value
        }
    }

}
