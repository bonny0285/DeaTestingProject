//
//  FontAndColor.swift
//  Dea
//
//  Created by Massimiliano on 27/04/21.
//  Copyright © 2021 Wind Tre S.p.a. All rights reserved.
//

import UIKit

enum FontStyle: String {
    case nunitoSansRegular = "NunitoSans-Regular"
    case nunitoSansBold = "NunitoSans-Bold"
    case nunitoSansLight = "NunitoSans-Light"
    case nunitoSansSemiBold = "NunitoSans-SemiBold"
    case nunitoSansExtraBold = "NunitoSans-ExtraBold"
    case nunitoSansBlack = "NunitoSans-Black"
}

enum ColorStyle: String {
    case deaBlackLight = "DeaBlackLight"
    case deaBlackMedium = "DeaBlackMedium"
    case deaBlackTotal = "DeaBlackTotal"
    case deaGrayLight = "DeaGrayLight"
    case deaGraySuperLight = "DeaGraySuperLight"
    case deaGreenLabels = "DeaGreenLabels"
    case deaGreenMain = "DeaGreenMain"
    case deaGreyDark = "DeaGreyDark"
    case deaGreyLight = "DeaGreyLight"
    case deaGreyMedium = "DeaGreyMedium"
    case deaGreyMediumPlus = "DeaGreyMediumPlus"
    case deaMenuLabels = "DeaMenuLabels"
    case deaProfileName = "DeaProfileName"
    case deaRed = "DeaRed"
    case deaSplashBackground = "DeaSplashBackground"
    case deaTextfield = "DeaTextfield"
    case deaWhiteMedium = "DeaWhiteMedium"
    case deaWhiteTotal = "DeaWhiteTotal"
    case paypallBlu = "PaypallBlu"
}
    
func getDeaColor(_ color: ColorStyle, with alpha: CGFloat = 1) -> UIColor? {
    return UIColor(named: color.rawValue)?.withAlphaComponent(alpha)
}

func getDeaFont(_ font: FontStyle, size: CGFloat) -> UIFont? {
    return UIFont(name: font.rawValue, size: size)
}
