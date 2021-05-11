//
//  AddOnTopCardView.swift
//  DeaTestingProject
//
//  Created by Bonafede Massimiliano on 28/04/21.
//

import UIKit

class AddOnTopCardView: UIView {
    
    //MARK: - Properties
    
    private var containerView = UIView()

    var viewModel = ViewModel() {
        didSet {
            setupUIByStyle(viewModel.style)
        }
    }
    
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
        addSubview(containerView)
    }
    
    private func setupUIByStyle(_ style: AddOnTopViewStyle) {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: style.height).isActive = true
        
        containerView.invalidate()
        
        switch style {
        case .none:
            styleNone()
            
        case .multiInformation(let giga, let minutes, let sms):
            styleMultiInformation(giga, minutes, sms)
            
        case .singleInformation(let giga):
            styleSingleInformation(giga)
            
        case .withPromo(let giga):
            stylerWithPromo(giga)
        }
    }
    
    private func styleNone() {}
    
    private func styleMultiInformation(_ giga: Double, _ minutes: Double, _ sms: Double) {
        let gigaTitleLabel = UILabel()
        gigaTitleLabel.text = "Giga"
        gigaTitleLabel.font = getDeaFont(.nunitoSansRegular, size: 12)
        gigaTitleLabel.textColor = getDeaColor(.deaGreenLabels)
        
        let gigaLabel = UILabel()
        gigaLabel.text = "\(giga)"
        gigaLabel.font = getDeaFont(.nunitoSansBold, size: 18)
        gigaLabel.textColor = getDeaColor(.deaGreenMain)
        
        let leftStackView = createStackView(
            axis: .vertical,
            alignement: .center,
            distribution: .fill,
            spacing: 5
        )
        
        leftStackView.addArrangedSubview(gigaTitleLabel)
        leftStackView.addArrangedSubview(gigaLabel)
        
        let minuteTitleLabel = UILabel()
        minuteTitleLabel.text = "Minuti"
        minuteTitleLabel.font = getDeaFont(.nunitoSansRegular, size: 12)
        minuteTitleLabel.textColor = getDeaColor(.deaGreenLabels)
        
        let minuteLabel = UILabel()
        minuteLabel.text = "\(minutes)"
        minuteLabel.font = getDeaFont(.nunitoSansBold, size: 18)
        minuteLabel.textColor = getDeaColor(.deaGreenMain)
        
        let centerStackView = createStackView(
            axis: .vertical,
            alignement: .center,
            distribution: .fill,
            spacing: 5
        )
        
        centerStackView.addArrangedSubview(minuteTitleLabel)
        centerStackView.addArrangedSubview(minuteLabel)
        
        let smsTitleLabel = UILabel()
        smsTitleLabel.text = "SMS"
        smsTitleLabel.font = getDeaFont(.nunitoSansRegular, size: 12)
        minuteTitleLabel.textColor = getDeaColor(.deaGreenLabels)
        
        let smsLabel = UILabel()
        smsLabel.text = "\(sms)"
        smsLabel.font = getDeaFont(.nunitoSansBold, size: 18)
        smsLabel.textColor = getDeaColor(.deaGreenMain)
        
        let rightStackView = createStackView(
            axis: .vertical,
            alignement: .center,
            distribution: .fill,
            spacing: 5
        )
        
        rightStackView.addArrangedSubview(smsTitleLabel)
        rightStackView.addArrangedSubview(smsLabel)
        
        let containerStackView = createStackView(
            axis: .horizontal,
            alignement: .fill,
            distribution: .equalCentering,
            spacing: 0
        )
        
        let leftSeparator = UIView()
        leftSeparator.backgroundColor = UIColor(red: 229, green: 237, blue: 238)//getDeaColor(.deaGreyLight)
        leftSeparator.translatesAutoresizingMaskIntoConstraints = false
        leftSeparator.heightAnchor.constraint(equalToConstant: 24).isActive = true
        leftSeparator.widthAnchor.constraint(equalToConstant: 1).isActive = true
        
        let rightSeparator = UIView()
        rightSeparator.backgroundColor = UIColor(red: 229, green: 237, blue: 238)//getDeaColor(.deaGreyLight)
        rightSeparator.translatesAutoresizingMaskIntoConstraints = false
        rightSeparator.heightAnchor.constraint(equalToConstant: 24).isActive = true
        rightSeparator.widthAnchor.constraint(equalToConstant: 1).isActive = true
        
        containerStackView.addArrangedSubview(leftStackView)
        containerStackView.addArrangedSubview(leftSeparator)
        containerStackView.addArrangedSubview(centerStackView)
        containerStackView.addArrangedSubview(rightSeparator)
        containerStackView.addArrangedSubview(rightStackView)
        
        let bottomSeparator = UIView()
        bottomSeparator.backgroundColor = UIColor(red: 229, green: 237, blue: 238)//getDeaColor(.deaGreyLight)
        containerView.addSubview(bottomSeparator)
        containerView.addSubview(containerStackView)
        bottomSeparator.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomSeparator.heightAnchor.constraint(equalToConstant: 2).isActive = true
        bottomSeparator.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30).isActive = true
        bottomSeparator.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30).isActive = true
        bottomSeparator.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        
        containerStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        containerStackView.bottomAnchor.constraint(equalTo: bottomSeparator.topAnchor, constant: -12).isActive = true
        containerStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 35).isActive = true
        containerStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -35).isActive = true
    }
    
    private func styleSingleInformation(_ giga: Double) {
        let gigaLabel = UILabel()
        gigaLabel.text = "\(giga)"
        gigaLabel.font = getDeaFont(.nunitoSansBlack, size: 36)
        gigaLabel.textColor = getDeaColor(.deaGreenLabels)
        
        let gigaTitleLabel = UILabel()
        gigaTitleLabel.text = "Giga"
        gigaTitleLabel.font = getDeaFont(.nunitoSansRegular, size: 20)
        gigaTitleLabel.textColor = getDeaColor(.deaGreenMain)
        
        let stack = createStackView(
            axis: .horizontal,
            alignement: .firstBaseline,
            distribution: .fill,
            spacing: 4
        )
        
        stack.addArrangedSubview(gigaLabel)
        stack.addArrangedSubview(gigaTitleLabel)
        
        containerView.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -2).isActive = true
        stack.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
    }
    
    private func stylerWithPromo(_ giga: Double) {
        let gigaLabel = UILabel()
        gigaLabel.text = "\(giga)"
        gigaLabel.font = getDeaFont(.nunitoSansBlack, size: 36)
        gigaLabel.textColor = getDeaColor(.deaGreenLabels)
        
        let gigaTitleLabel = UILabel()
        gigaTitleLabel.text = "Giga"
        gigaTitleLabel.font = getDeaFont(.nunitoSansRegular, size: 20)
        gigaTitleLabel.textColor = getDeaColor(.deaGreenMain)
        
        let stack = createStackView(
            axis: .horizontal,
            alignement: .firstBaseline,
            distribution: .fill,
            spacing: 4
        )
        
        stack.addArrangedSubview(gigaLabel)
        stack.addArrangedSubview(gigaTitleLabel)
        
        containerView.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -2).isActive = true
        stack.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
    }
    
    private func createStackView(axis: NSLayoutConstraint.Axis, alignement: UIStackView.Alignment, distribution: UIStackView.Distribution, spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.distribution = distribution
        stackView.alignment = alignement
        stackView.spacing = spacing
        return stackView
    }

}

extension AddOnTopCardView {
    enum AddOnTopViewStyle {
        
        case none
        
        case multiInformation(giga: Double, minutes: Double, sms: Double)
        
        case singleInformation(giga: Double)
        
        case withPromo(giga: Double)
       
        var height: CGFloat {
            switch self {
            case .none:
                return 0
            case .multiInformation:
                return 60
            case .singleInformation:
                return 45
            case .withPromo:
                return 51
            }
        }
    }
    
    struct ViewModel {
        var style: AddOnTopViewStyle = .none
    }
}


