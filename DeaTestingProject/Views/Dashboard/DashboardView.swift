//
//  Dashboard.swift
//  DeaTestingProject
//
//  Created by Bonafede Massimiliano on 11/05/21.
//

import UIKit

protocol DashboardViewDelegate: AnyObject {
    func optionButtonPressed()
}

class DashboardView: UIView {

    //MARK: - Outlets

    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var cardTitleLabel: UILabel!
    @IBOutlet weak var cardSubtitleLabel: UILabel!
    @IBOutlet weak var optionButton: UIButton!
    @IBOutlet weak var donutView: UIView!
    @IBOutlet weak var donutTitleLabel: UILabel!
    @IBOutlet weak var donutSubtitleLabel: UILabel!
    
    //MARK: - Properties

    weak var delegate: DashboardViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    private func commonInit() {
        let nib = UINib(nibName: "DashboardView", bundle: Bundle.main)
        nib.instantiate(withOwner: self, options: nil)
        
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        
        shadowView.backgroundColor = .clear
        shadowView.layer.cornerRadius = 4
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowRadius = 4
        shadowView.layer.shadowOpacity = 0.5
        shadowView.layer.shadowOffset = .zero
        
        cardView.layer.cornerRadius = 4
        cardView.layer.masksToBounds = true
    }
    
    
    @IBAction func optionButtonWasPressed(_ sender: UIButton) {
        delegate?.optionButtonPressed()
    }
    
}
