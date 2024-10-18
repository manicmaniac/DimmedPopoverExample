import UIKit

final class PopoverViewController: UIViewController {
    override func loadView() {
        super.loadView()
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "This is a description of the button."
        label.numberOfLines = 0
        view.addSubview(label)
        let button = UIButton(type: .close)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Close", for: .normal)
        button.addTarget(self, action: #selector(buttonDidTouchUpInside), for: .touchUpInside)
        view.addSubview(button)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: button.topAnchor),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            button.heightAnchor.constraint(equalToConstant: 44),
        ])
    }

    @objc private func buttonDidTouchUpInside(_ sender: UIButton) {
        if let popoverPresentationController {
            popoverPresentationController.delegate?.presentationControllerWillDismiss?(popoverPresentationController)
        }
        dismiss(animated: true)
        if let popoverPresentationController {
            popoverPresentationController.delegate?.presentationControllerDidDismiss?(popoverPresentationController)
        }
    }
}
