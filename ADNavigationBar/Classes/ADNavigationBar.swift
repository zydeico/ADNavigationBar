//
//  ADNavigationBarViewController.swift
//  ADNavigationBar
//
//  Created by Daniel Vázquez on 03/04/22.
//

import UIKit
import Motion
import Foundation

typealias ButtonAction = (buttonType: NavigationBarButtonType, target: Any?, action: Selector?)

public enum NavigationBarButtonType {
    case edit, save, add, close, update
    
    var title: String? {
        switch self {
        case .add:
            return "Add"
        case .close:
            return "Close"
        case .edit:
            return "Edit"
        case .save:
            return "Save"
        case .update:
            return "Update"
        }
    }
    
    var font: UIFont {
        switch self {
        case .save, .add, .update:
            return .systemFont(ofSize: 15)
        default:
            return .systemFont(ofSize: 15)
        }
    }
    
    var image: UIImage? {
        switch self {
        case .edit, .save, .add, .update:
            return nil
        case .close:
            return #imageLiteral(resourceName: "chevronBack@3x.png")
        }
    }
}

class ADNavigationBar: UIView {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backButtonOutlet: UIButton!
    @IBOutlet weak var mainButtonOutlet: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var rightButtonStack: UIStackView!
    
    // MARK: - Constraints
    @IBOutlet weak var titleLeading: NSLayoutConstraint!
    @IBOutlet weak var backButtonTop: NSLayoutConstraint!
    @IBOutlet weak var backButtonWidth: NSLayoutConstraint!
    @IBOutlet weak var backButtonYCenter: NSLayoutConstraint!
    @IBOutlet weak var widthRightButtonsConstraint: NSLayoutConstraint!
    
    public var leftButtonAction: (() -> Bool)?
    public var mainButtonAction: (() -> Void)?
    public static let height: CGFloat = 119
    public static let rect = CGRect(x: -50, y: -30, width: UIScreen.main.bounds.width, height: ADNavigationBar.height)
    
    public enum TitleSize: CGFloat {
        case little = 17
        case sort = 19
        case regular = 22
        case big = 24
    }
    
    public override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func configureBackButtonCoordinates() {
        let expansion = self.bounds.height > (UIDevice.isBigDevice ? 120 : 100)
        let low = UILayoutPriority(rawValue: 999)
        let high = UILayoutPriority(rawValue: 999)
        backButtonTop.priority = expansion ? high : low
        backButtonTop.constant = UIDevice.isBigDevice ? 35 : 20
        backButtonYCenter.priority = expansion ? low : high
        titleLeading.constant = expansion ? 25 : 45
        titleLeading.constant = backButtonOutlet.isHidden ? 23 : titleLeading.constant
        if mainButtonAction != nil {
            titleLeading.constant = 65
        }
    }
    
    public func removeRightActions() {
        guard rightButtonStack.arrangedSubviews.count > 0 else {
            return
        }
        let button = rightButtonStack.arrangedSubviews
        button.forEach {
            rightButtonStack.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }
    
    public func configureRightButtonActions() {
        
    }
    
    public func configureStackView() {
        stackView.spacing = widthRightButtonsConstraint.constant > 0 ? 20 : 0
    }
    
    @IBAction func mainButtonAction(_ sender: Any) {
        mainButtonAction?()
    }
}


extension UIViewController {
    var dvNavigationBar: ADNavigationBar? {
        return view.subviews.filter {
            $0 is ADNavigationBar
        }.first as? ADNavigationBar
    }
    
    var navigationTitle: String? {
        get {
            return dvNavigationBar?.titleLabel.text
        } set {
            dvNavigationBar?.titleLabel.text = newValue
        }
    }
    
    func addDVNavigationBar(title: String? = nil, titleSize: ADNavigationBar.TitleSize = .regular, rightButtonAction: [ButtonAction] = [], leftButtonAction: (() -> (Bool))? = nil, leftButtonImage: UIImage? = nil, height: CGFloat = ADNavigationBar.height, mainButtonAction: (() -> Void)? = nil) {
        guard dvNavigationBar == nil else { return }
        guard let dvNavigationBar = Bundle.main.loadNibNamed("DVNavigationBar", owner: self, options: nil)?.first as? ADNavigationBar else { return }
        let title = title ?? self.title
        dvNavigationBar.titleLabel.text = title
        dvNavigationBar.titleLabel.font = dvNavigationBar.titleLabel.font.withSize(titleSize.rawValue)
        dvNavigationBar.configureBackButtonCoordinates()
        dvNavigationBar.configureStackView()
    }
    
    @objc func didTapBackButton() {
        guard let tap = dvNavigationBar?.leftButtonAction else {
            navigationController?.popViewController(animated: true)
            return
        }
        if tap() {
            navigationController?.popViewController(animated: true)
        }
    }
}

extension UIDevice {
    static var isBigDevice: Bool {
        return UIScreen.main.bounds.height == 812 || UIScreen.main.bounds.height == 900
    }
    
    static var isSmallDevice: Bool {
        return UIScreen.main.bounds.height == 670
    }
}
