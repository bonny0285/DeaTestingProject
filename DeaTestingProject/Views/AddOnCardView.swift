//
//  AddOnCardView.swift
//  DeaTestingProject
//
//  Created by Bonafede Massimiliano on 28/04/21.
//

import UIKit

protocol AddOnCardViewDelegate: AnyObject {
    func discoverButtonWasPressed()
}

class AddOnCardView: UIView {

    //MARK: - Outlets

    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var separator: UIView!
    @IBOutlet weak var bottomHintLabel: UILabel!
    @IBOutlet weak var discoverButton: UIButton!
    @IBOutlet weak var bottomHeight: NSLayoutConstraint!
    
    // TOP CARD VIEW
    @IBOutlet weak var topCardView: AddOnTopCardView!
    @IBOutlet weak var topCardViewHeight: NSLayoutConstraint!
    
    // MIDDLE CARD VIEW
    @IBOutlet weak var middleCardView: AddOnMiddleCardView! 
    
    //MARK: - Properties
    var imageContainer: UIImageView?
    
    var viewModel = ViewModel() {
        didSet {
            topCardViewHeight.constant = viewModel.topCardView.style.height
            //bottomHeight.constant = viewModel.bottomTitle != nil ? 5 : 3

            titleLabel.text = viewModel.title
            subTitleLabel.text = viewModel.subTitle

            if let bottomLabelText = viewModel.bottomTitle {
                bottomHintLabel.isHidden = false
                bottomHintLabel.text = bottomLabelText
            } else {
                bottomHintLabel.isHidden = true
            }

            topCardView.viewModel = viewModel.topCardView
            middleCardView.viewModel = viewModel.middleCardView

            if let _ = imageContainer {
                imageContainer?.removeFromSuperview()
            }

            if viewModel.withPromo == true {
                let promoImage = UIImage(named: "ribbon")
                imageContainer = UIImageView(image: promoImage)
                shadowView.addSubview(imageContainer!)
                shadowView.bringSubviewToFront(imageContainer!)
                imageContainer!.translatesAutoresizingMaskIntoConstraints = false
                imageContainer!.topAnchor.constraint(equalTo: shadowView.topAnchor, constant: -11).isActive = true
                imageContainer!.bottomAnchor.constraint(equalTo: middleCardView.topAnchor, constant: 0).isActive = true
                imageContainer!.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor, constant: -11).isActive = true
            }
        }
    }
    
    weak var delegate: AddOnCardViewDelegate?
    
    //MARK: - Lifecycle

//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        commonInit()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        commonInit()
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    //MARK: - Methods

    private func commonInit() {
        let nib = UINib(nibName: "AddOnCardView", bundle: Bundle.main)
        nib.instantiate(withOwner: self, options: nil)
        
        addSubview(shadowView)
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        shadowView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        shadowView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        setupShadowView()
        setupContainerView()
    }
    
    private func setupShadowView() {
        shadowView.backgroundColor = .clear
        shadowView.layer.cornerRadius = 4
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowRadius = 4
        shadowView.layer.shadowOpacity = 0.3
        shadowView.layer.shadowOffset = .zero
    }
    
    private func setupContainerView() {
        containerView.layer.cornerRadius = 4
        containerView.layer.masksToBounds = true
    }
    
    //MARK: - Actions

    @IBAction func discoverButton(_ sender: UIButton) {
        delegate?.discoverButtonWasPressed()
    }
    
}

extension AddOnCardView {
    
    struct ViewModel {
        var title: String?
        var subTitle: String?
        var bottomTitle: String?
        var withPromo: Bool?
        var topCardView: AddOnTopCardView.ViewModel = AddOnTopCardView.ViewModel()
        var middleCardView: AddOnMiddleCardView.ViewModel = AddOnMiddleCardView.ViewModel()
    }
}
