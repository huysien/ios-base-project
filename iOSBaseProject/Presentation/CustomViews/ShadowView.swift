import UIKit

class ShadowView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.masksToBounds = false
        if backgroundColor == .systemBackground {
            backgroundColor = .clear
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        var roundingCorners: UIRectCorner = []
        if roundTopLeft { roundingCorners.insert(.topLeft) }
        if roundTopRight { roundingCorners.insert(.topRight) }
        if roundBottomLeft { roundingCorners.insert(.bottomLeft) }
        if roundBottomRight { roundingCorners.insert(.bottomRight) }
        let cornerRadius = shadowCornerRadius >= 0 ? shadowCornerRadius : bounds.height / 2
        let cornerRadii = CGSize(width: cornerRadius, height: cornerRadius)
        if !roundingCorners.isEmpty {
            layer.shadowPath = UIBezierPath(
                roundedRect: bounds,
                byRoundingCorners: roundingCorners,
                cornerRadii: cornerRadii
            ).cgPath
        }
    }

    @IBInspectable var shadowColor: UIColor? {
        get {
            guard let cgColor = layer.shadowColor else {
                return nil
            }
            return UIColor(cgColor: cgColor)
        }
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }

    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }

    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }

    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }

    @IBInspectable var shadowCornerRadius: CGFloat = 0
    @IBInspectable var roundTopRight: Bool = true
    @IBInspectable var roundTopLeft: Bool = true
    @IBInspectable var roundBottomRight: Bool = true
    @IBInspectable var roundBottomLeft: Bool = true
}
