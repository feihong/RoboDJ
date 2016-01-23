import UIKit

class BorderButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 8.0
        layer.borderColor = tintColor.CGColor
        layer.borderWidth = 1.0
    }
}
