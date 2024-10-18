import UIKit

final class ViewController: UIViewController {
    private weak var button: UIButton!
    private weak var peepholeView: PeepholeView?

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
        tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let popoverViewController = PopoverViewController()
        popoverViewController.preferredContentSize = CGSize(width: 200, height: 100)
        popoverViewController.modalPresentationStyle = .popover
        popoverViewController.popoverPresentationController?.sourceView = button
        popoverViewController.popoverPresentationController?.permittedArrowDirections = .up
        popoverViewController.popoverPresentationController?.delegate = self
        present(popoverViewController, animated: true)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        peepholeView?.peepholeFrame = button.frame
    }

    @objc private func buttonDidTouchUpInside(_ sender: UIButton) {
        // Does nothing.
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        .none
    }

    func presentationControllerWillDismiss(_ presentationController: UIPresentationController) {
        peepholeView?.removeFromSuperview()
    }

    func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController) {
        let peepholeView = PeepholeView(frame: view.frame)
        self.peepholeView = peepholeView
        peepholeView.translatesAutoresizingMaskIntoConstraints = false
        peepholeView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        peepholeView.peepholeFrame = button.frame
        peepholeView.peepholeCornerRadius = 4
        view.addSubview(peepholeView)
        NSLayoutConstraint.activate([
            peepholeView.topAnchor.constraint(equalTo: view.topAnchor),
            peepholeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            peepholeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            peepholeView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
