import UIKit

final class DimmingPopoverPresentationController: UIPopoverPresentationController {
    private weak var peepholeView: PeepholeView?

    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        guard let containerView else {
            return
        }
        let peepholeView = PeepholeView(frame: containerView.frame)
        self.peepholeView = peepholeView
        peepholeView.translatesAutoresizingMaskIntoConstraints = false
        peepholeView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        peepholeView.peepholeFrame = sourceView?.frame ?? .zero
        peepholeView.peepholeCornerRadius = 4
        containerView.addSubview(peepholeView)
        NSLayoutConstraint.activate([
            peepholeView.topAnchor.constraint(equalTo: containerView.topAnchor),
            peepholeView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            peepholeView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            peepholeView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }

    override func containerViewDidLayoutSubviews() {
        super.containerViewDidLayoutSubviews()
        peepholeView?.peepholeFrame = sourceView?.frame ?? .zero
    }

    override func dismissalTransitionDidEnd(_ completed: Bool) {
        super.dismissalTransitionDidEnd(completed)
        peepholeView?.removeFromSuperview()
    }
}
