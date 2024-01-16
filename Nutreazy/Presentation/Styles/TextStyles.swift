//
//  TextStyles.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 16/10/23.
//

import Foundation
import SwiftUI

let HEADING_1 = CustomFont.PoppinsMedium.font(textStyle: .largeTitle)
let HEADING_2 = CustomFont.PoppinsMedium.font(textStyle: .title1)
let HEADING_3 = CustomFont.PoppinsMedium.font(textStyle: .title2)
let HEADING_4 = CustomFont.PoppinsMedium.font(textStyle: .title3)
let HEADING_5 = CustomFont.PoppinsMedium.font(textStyle: .headline)
let PARAGRAPH_1 = CustomFont.PoppinsLight.font(textStyle: .callout)
let PARAGRAPH_1_MEDIUM = CustomFont.PoppinsLight.font(textStyle: .callout)
let PARAGRAPH_2 = CustomFont.PoppinsLight.font(textStyle: .footnote)
let CHIP = CustomFont.PoppinsLight.font(textStyle: .footnote)
let SUBHEADING_4 = CustomFont.PoppinsLight.font(textStyle: .title3)
let SUBHEADING_4_ITALIC = CustomFont.PoppinsLightItalic.font(textStyle: .title3)
let SUBHEADING_5 = CustomFont.PoppinsLight.font(textStyle: .headline)

enum CustomFont: String {
    case PoppinsMedium = "Poppins-Medium"
    case PoppinsLight = "Poppins-Light"
    case PoppinsLightItalic = "Poppins-LightItalic"
    
    func font(textStyle: UIFont.TextStyle, defaultSize: CGFloat? = nil) -> Font {
        let size = defaultSize ?? UIFontDescriptor.preferredFontDescriptor(withTextStyle: textStyle).pointSize
        let fontToScale = UIFont(name: rawValue, size: size) ?? .systemFont(ofSize: size)
        let uiFont = textStyle.metrics.scaledFont(for: fontToScale)
        
        return Font.custom(rawValue, size: uiFont.pointSize)
    }
    
}
