import UIKit

final class PeepholeView: UIView {
    var peepholeFrame = CGRect.zero {
        didSet { setNeedsLayout() }
    }
    var peepholeCornerRadius = CGFloat(0) {
        didSet { setNeedsLayout() }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let maskPath = UIBezierPath(rect: frame)
        maskPath.append(UIBezierPath(roundedRect: peepholeFrame, cornerRadius: peepholeCornerRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.fillRule = .evenOdd
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }
}
