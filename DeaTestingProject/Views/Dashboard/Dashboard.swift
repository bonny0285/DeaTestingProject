//
//  Dashboard.swift
//  DeaTestingProject
//
//  Created by Bonafede Massimiliano on 11/05/21.
//

import UIKit

class Dashboard: UIView {

    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var cardTitleLabel: UILabel!
    @IBOutlet weak var cardSubtitleLabel: UILabel!
    @IBOutlet weak var cardMennuButton: UIButton!
    @IBOutlet weak var donutView: UIView!
    @IBOutlet weak var donutTitleLabel: UILabel!
    @IBOutlet weak var donutSubtitleLabel: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let nib = UINib(nibName: "Dashboard", bundle: Bundle.main)
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
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let nib = UINib(nibName: "Dashboard", bundle: Bundle.main)
        nib.instantiate(withOwner: self, options: nil)
        
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        
        containerView.backgroundColor = .clear
        containerView.layer.cornerRadius = 4
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowRadius = 4
        containerView.layer.shadowOpacity = 0.3
        containerView.layer.shadowOffset = .zero
    }
    
    
    
    @IBAction func cardMenuButtonWasPressed(_ sender: UIButton) {
    }
    
}
