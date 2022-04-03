//
//  ADNavigationBarViewController.swift
//  ADNavigationBar
//
//  Created by Daniel Vázquez on 03/04/22.
//

import UIKit

class ADNavigationBar: UIViewController {
    
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
