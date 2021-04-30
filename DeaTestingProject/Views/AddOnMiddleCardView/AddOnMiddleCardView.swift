//
//  AddOnMiddleCardView.swift
//  DeaTestingProject
//
//  Created by Bonafede Massimiliano on 28/04/21.
//

import UIKit

class AddOnMiddleCardView: UIView {
    
    //MARK: - Properties
    
    var containerView = UIView()
    
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
        containerView.backgroundColor = UIColor(red: 249 / 255, green: 249 / 255, blue: 249 / 255, alpha: 1)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
    }
    
    private func setupGradientOnContainerView(belowView view: UIView) {
        let gradient = createLayerInMiddleView(pathOffset: 2.0)
        containerView.layer.insertSublayer(gradient, below: view.layer)
        containerView.clipsToBounds = true
    }
    
    private func createLayerInMiddleView(pathOffset: CGFloat) -> CAGradientLayer {
        let path = createBezierPath(on: containerView, withOffset: pathOffset)
        
        let gradient = CAGradientLayer()
        gradient.frame = path.bounds
        
        let darkColor = UIColor(red: 73 / 255, green: 84 / 255, blue: 92 / 255, alpha: 0.2).cgColor
        let lightColor = UIColor(red: 249 / 255, green: 249 / 255, blue: 249 / 255, alpha: 1).cgColor
        
        gradient.colors = [lightColor, darkColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        gradient.mask = shapeLayer
        
        return gradient
    }
    
    private func createBezierPath(on superview: UIView, withOffset offset: CGFloat) -> UIBezierPath {
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 0, y: 0))
        
        let topLine = CGPoint(
            x: superview.frame.width / offset,
            y: 0
        )
        
        let obliqueLine = CGPoint(
            x: (superview.frame.width / offset) + 40,
            y: superview.frame.height
        )
        
        let bottomLine = CGPoint(
            x: 0,
            y: superview.frame.height
        )
        
        path.addLine(to: topLine)
        path.addLine(to: obliqueLine)
        path.addLine(to: bottomLine)
        
        path.close()
        
        return path
    }
    
    private func setupUIByStyle(_ style: AddOnMiddleViewStyle) {
        
        containerView.invalidate()
        
        switch style {
        case .none:
            styleNone()
            
        case .oneShotTravel(
                let renewalPrice,
                let activationPrice):
            
            styleOneShotTravel(
                renewalPrice: renewalPrice,
                activationPrice: activationPrice
            )
            
        case .oneShotStandard(
                let freeActivation,
                let giga,
                let activationPrice):
            
            styleOneShotStandard(
                freeActivation: freeActivation,
                giga: giga,
                activationPrice: activationPrice
            )
            
        case .recurrent(
                let freeActivation,
                let renewalOldPrice,
                let renewalPrice,
                let activationOldPrice,
                let activationPrice):
            
            styleRecurrent(
                freeActivation: freeActivation,
                renewalOldPrice: renewalOldPrice,
                renewalPrice: renewalPrice,
                activationOldPrice: activationOldPrice,
                activationPrice: activationPrice
            )
        }
    }
    
    private func styleNone() {}
    
    private func styleOneShotTravel(renewalPrice: Double, activationPrice: Double) {
        
        // Renewal - left side of view
        let renewalStack = getRenewalStackView(renewalPrice: renewalPrice)
        
        containerView.addSubview(renewalStack)
        renewalStack.translatesAutoresizingMaskIntoConstraints = false
        renewalStack.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        renewalStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 32).isActive = true
        
        setupGradientOnContainerView(belowView: renewalStack)
        
        // Activation - right side of view
        
        let mainActivationStackView = getUnaTantumStackView(activationPrice: activationPrice)
        
        containerView.addSubview(mainActivationStackView)
        mainActivationStackView.translatesAutoresizingMaskIntoConstraints = false
        mainActivationStackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        mainActivationStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
    }
    
    private func styleOneShotStandard(freeActivation: Bool, giga: Double, activationPrice: Double) {
        
        // Giga - left side of view
        
        let leftStackView = getSimpleGigaStackView(giga: giga)
        
        containerView.addSubview(leftStackView)
        leftStackView.translatesAutoresizingMaskIntoConstraints = false
        leftStackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        leftStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 32).isActive = true
        
        setupGradientOnContainerView(belowView: leftStackView)
        
        // Activation - right side of view
        
        if freeActivation {
            
            let roundView = getFreeActivationSubview()
            
            containerView.addSubview(roundView)
            roundView.translatesAutoresizingMaskIntoConstraints = false
            roundView.widthAnchor.constraint(equalToConstant: 98).isActive = true
            roundView.heightAnchor.constraint(equalToConstant: 43).isActive = true
            roundView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
            roundView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -32).isActive = true
            
        } else {
            
            let mainActivationStackView = getUnaTantumStackView(activationPrice: activationPrice)
            
            containerView.addSubview(mainActivationStackView)
            mainActivationStackView.translatesAutoresizingMaskIntoConstraints = false
            mainActivationStackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
            mainActivationStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -32).isActive = true
        }
        
    }
    
    private func styleRecurrent(freeActivation: Bool, renewalOldPrice: Double?, renewalPrice: Double, activationOldPrice: Double?, activationPrice: Double) {
        
        // Activation - Free activation or Una tantum - right side of view
        
        if freeActivation {
            let roundView = getFreeActivationSubview()
            
            containerView.addSubview(roundView)
            roundView.translatesAutoresizingMaskIntoConstraints = false
            roundView.widthAnchor.constraint(equalToConstant: 98).isActive = true
            roundView.heightAnchor.constraint(equalToConstant: 43).isActive = true
            roundView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
            roundView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -32).isActive = true
            
        } else {
            
            let rightSatckView = getUnaTantumStackView(activationPrice: activationPrice, oldPrice: activationOldPrice)
            
            containerView.addSubview(rightSatckView)
            
            rightSatckView.translatesAutoresizingMaskIntoConstraints = false
            rightSatckView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
            rightSatckView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -3).isActive = true
            rightSatckView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -32).isActive = true
        }
        
        // Renewal - left side of view
        
        let renewalStackView = getRenewalStackView(renewalPrice: renewalPrice, oldRenewalPrice: renewalOldPrice)
        
        containerView.addSubview(renewalStackView)
        
        renewalStackView.translatesAutoresizingMaskIntoConstraints = false
        renewalStackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        renewalStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30).isActive = true
        
        setupGradientOnContainerView(belowView: renewalStackView)
    }
    
    private func getSimpleGigaStackView(giga: Double) -> UIStackView {
        let titleLabel = getDeaLabelWith(
            text: "Giga",
            font: .nunitoSansRegular,
            fontSize: 22,
            textColor: .deaGreenLabels
        )
        
        let valueLabel = getDeaLabelWith(
            text: "\(giga)",
            font: .nunitoSansBlack,
            fontSize: 36,
            textColor: .deaGreenMain
        )
        
        let horizontalStackView = createStackView(
            axis: .horizontal,
            alignement: .firstBaseline,
            distribution: .fill,
            spacing: 2)
        
        horizontalStackView.addArrangedSubview(valueLabel)
        horizontalStackView.addArrangedSubview(titleLabel)
        
        return horizontalStackView
    }
    
    private func getRenewalStackView(renewalPrice: Double, oldRenewalPrice: Double? = nil) -> UIStackView {
        
        let intLabel = getDeaLabelWith(
            text: "\(Int(renewalPrice))",
            font: .nunitoSansBlack,
            fontSize: 49,
            textColor: .deaGreenLabels
        )
        
        let decimal = String(
            Float(renewalPrice.truncatingRemainder(dividingBy: 1))
        ).dropFirst(2)
        
        let decimalNumberLabel = getDeaLabelWith(
            text: ",\(decimal)€",
            font: .nunitoSansBlack,
            fontSize: 22,
            textColor: .deaGreenLabels
        )
        
        let renewalLabel = getDeaLabelWith(
            text: "al rinnovo",
            font: .nunitoSansRegular,
            fontSize: 16,
            textColor: .deaBlackLight
        )
        
        let verticalStack = createStackView(
            axis: .vertical,
            alignement: .leading,
            distribution: .fill,
            spacing: -5
        )
        
        verticalStack.addArrangedSubview(decimalNumberLabel)
        verticalStack.addArrangedSubview(renewalLabel)
        
        let horizontalStack = createStackView(
            axis: .horizontal,
            alignement: .center,
            distribution: .fill,
            spacing: 5
        )
        
        if let oldRenewalPrice = oldRenewalPrice {
            #warning("barred label")
            let oldPriceLabel = getDeaLabelWith(
                text: "\(oldRenewalPrice)€",
                font: .nunitoSansBold,
                fontSize: 16,
                textColor: .deaGreenMain)
            
            let oldPriceStackView = createStackView(
                axis: .vertical,
                alignement: .center,
                distribution: .fill,
                spacing: -15
            )
            
            horizontalStack.addArrangedSubview(intLabel)
            horizontalStack.addArrangedSubview(verticalStack)
            
            oldPriceStackView.addArrangedSubview(oldPriceLabel)
            oldPriceStackView.addArrangedSubview(horizontalStack)
            return oldPriceStackView
            
        } else {
            horizontalStack.addArrangedSubview(intLabel)
            horizontalStack.addArrangedSubview(verticalStack)
            return horizontalStack
        }
    }
    
    private func getUnaTantumStackView(activationPrice: Double, oldPrice: Double? = nil) -> UIStackView {
        let activationIntLabel = getDeaLabelWith(
            text: "\(Int(activationPrice))",
            font: .nunitoSansBlack,
            fontSize: 49,
            textColor: .deaGreenLabels
        )
        
        let decimalActivation = String(
            Float(activationPrice.truncatingRemainder(dividingBy: 1))
        ).dropFirst(2)
        
        let activationDecimalLabel = getDeaLabelWith(
            text: ",\(decimalActivation)€",
            font: .nunitoSansBlack,
            fontSize: 22,
            textColor: .deaGreenLabels
        )
        
        let activationLabel = getDeaLabelWith(
            text: "Attivazione",
            font: .nunitoSansRegular,
            fontSize: 12,
            textColor: .deaBlackLight
        )
        
        let unaTantumLabel = getDeaLabelWith(
            text: "Una tantum",
            font: .nunitoSansRegular,
            fontSize: 16,
            textColor: .deaGreenLabels
        )
        
        let activationVerticalStackView = createStackView(
            axis: .vertical,
            alignement: .leading,
            distribution: .fill,
            spacing: -5
        )
        
        activationVerticalStackView.addArrangedSubview(activationDecimalLabel)
        activationVerticalStackView.addArrangedSubview(activationLabel)
        
        let activationHorizontalStackView = createStackView(
            axis: .horizontal,
            alignement: .center,
            distribution: .fill,
            spacing: 5
        )
        
        activationHorizontalStackView.addArrangedSubview(activationIntLabel)
        activationHorizontalStackView.addArrangedSubview(activationVerticalStackView)
        
        let mainActivationStackView = createStackView(
            axis: .vertical,
            alignement: .center,
            distribution: .fill,
            spacing: -15)
        
        if let oldPrice = oldPrice {
            #warning("barred label")
            let oldPriceLabel = getDeaLabelWith(
                text: "\(oldPrice)€",
                font: .nunitoSansBold,
                fontSize: 16,
                textColor: .deaGreenMain)
            
            mainActivationStackView.addArrangedSubview(oldPriceLabel)
        }
        
        mainActivationStackView.addArrangedSubview(activationHorizontalStackView)
        mainActivationStackView.addArrangedSubview(unaTantumLabel)
        
        return mainActivationStackView
    }
    
    private func getFreeActivationSubview() -> UIView {
        let roundView = UIView()
        roundView.backgroundColor = .clear
        roundView.layer.borderColor = getDeaColor(.deaGreenMain)?.cgColor
        roundView.layer.borderWidth = 1
        roundView.layer.cornerRadius = 4
        
        let topLabel = getDeaLabelWith(
            text: "Attivazione",
            font: .nunitoSansRegular,
            fontSize: 16,
            textColor: .deaGreenLabels
        )
        
        let bottomLabel = getDeaLabelWith(
            text: "Gratuita",
            font: .nunitoSansBold,
            fontSize: 16,
            textColor: .deaGreenMain
        )
        
        let rightStackView = createStackView(
            axis: .vertical,
            alignement: .center,
            distribution: .fill,
            spacing: -5
        )
        
        rightStackView.addArrangedSubview(topLabel)
        rightStackView.addArrangedSubview(bottomLabel)
        
        roundView.addSubview(rightStackView)
        rightStackView.translatesAutoresizingMaskIntoConstraints = false
        rightStackView.topAnchor.constraint(equalTo: roundView.topAnchor).isActive = true
        rightStackView.bottomAnchor.constraint(equalTo: roundView.bottomAnchor).isActive = true
        rightStackView.trailingAnchor.constraint(equalTo: roundView.trailingAnchor).isActive = true
        rightStackView.leadingAnchor.constraint(equalTo: roundView.leadingAnchor).isActive = true
        
        return roundView
    }
    
}

extension AddOnMiddleCardView {
    enum AddOnMiddleViewStyle {
        case none
        
        case oneShotTravel(renewalPrice: Double, activationPrice: Double)
        
        case oneShotStandard(freeActivation: Bool, giga: Double, activationPrice: Double)
        
        case recurrent(freeActivation: Bool, renewalOldPrice: Double?, renewalPrice: Double, activationOldPrice: Double?, activationPrice: Double)
    }
    
    struct ViewModel {
        var style: AddOnMiddleViewStyle = .none
    }
}


extension AddOnMiddleCardView {
    
    private func getDeaLabelWith(text: String, font: FontStyle, fontSize: CGFloat, textColor: ColorStyle) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = getDeaFont(font, size: fontSize)
        label.textColor = getDeaColor(textColor)
        return label
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


extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}


extension UIView {
    /// Invalidates the view removing all subviews and sublayers
    func invalidate() {
        self.subviews.forEach { $0.removeFromSuperview() }
        self.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
    }
}
