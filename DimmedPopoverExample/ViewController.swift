import UIKit

final class ViewController: UIViewController {
    private weak var button: UIButton!

    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        let button = UIButton(type: .system)
        self.button = button
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Button", for: .normal)
        button.addTarget(self, action: #selector(buttonDidTouchUpInside), for: .touchUpInside)
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View Controller"
        navigationController?.navigationBar.backgroundColor = .green
        tabBarController?.tabBar.backgroundColor = .blue
        tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let popoverViewController = PopoverViewController()
        popoverViewController.preferredContentSize = CGSize(width: 200, height: 100)
        popoverViewController.modalPresentationStyle = .custom
        popoverViewController.transitioningDelegate = self
        present(popoverViewController, animated: true)
    }

    @objc private func buttonDidTouchUpInside(_ sender: UIButton) {
        // Does nothing.
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let presentationController = DimmingPopoverPresentationController(presentedViewController: presented, presenting: presenting)
        presentationController.sourceView = button
        presentationController.permittedArrowDirections = .up
        presentationController.delegate = self
        return presentationController
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        .none
    }
}
