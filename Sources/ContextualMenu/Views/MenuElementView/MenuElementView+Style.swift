//
//  MenuElementView+Style.swift
//  
//
//  Created by Thibaud David on 17/02/2023.
//

import Foundation
import UIKit

extension MenuElementView {
    public struct Style {
        let height: CGFloat
        let backgroundColor: UIColor
        let highlightedBackgroundColor: UIColor
        let defaultTitleAttributes: [NSAttributedString.Key: Any]
        let destructiveTitleAttributes: [NSAttributedString.Key: Any]
        let defaultIconTint: UIColor
        let destructiveIconTint: UIColor
        let iconSize: CGSize

        public init(
            height: CGFloat = 44,
            backgroundColor: UIColor = .clear,
            highlightedBackgroundColor: UIColor = .black.withAlphaComponent(0.2),
            defaultTitleAttributes: [NSAttributedString.Key: Any]? = nil,
            destructiveTitleAttributes: [NSAttributedString.Key: Any]? = nil,
            defaultIconTint: UIColor = .black,
            destructiveIconTint: UIColor = .red,
            iconSize: CGSize? = nil
        ) {
            self.height = height
            self.backgroundColor = backgroundColor
            self.highlightedBackgroundColor = highlightedBackgroundColor
            self.defaultIconTint = defaultIconTint
            self.destructiveIconTint = destructiveIconTint
            
            // Use Dynamic Type for text
            let preferredFont = UIFont.preferredFont(forTextStyle: .body)
            let fontSize = preferredFont.pointSize
            self.defaultTitleAttributes = defaultTitleAttributes ?? [
                .font: UIFont.systemFont(ofSize: fontSize),
                .foregroundColor: UIColor.black
            ]
            self.destructiveTitleAttributes = destructiveTitleAttributes ?? [
                .font: UIFont.systemFont(ofSize: fontSize),
                .foregroundColor: UIColor.red
            ]
            
            // Scale icon size based on font size
            let iconDimension = fontSize * 1.3 // Proportional to font size
            self.iconSize = iconSize ?? CGSize(width: iconDimension, height: iconDimension)
        }
    }

    internal static func titleAttributes(
        attributes: MenuElement.Attributes,
        style: MenuElementView.Style
    ) -> [NSAttributedString.Key: Any] {
        switch attributes {
        case .destructive: return style.destructiveTitleAttributes
        default: return style.defaultTitleAttributes
        }
    }

    internal static func iconTint(
        attributes: MenuElement.Attributes,
        style: MenuElementView.Style
    ) -> UIColor {
        switch attributes {
        case .destructive: return style.destructiveIconTint
        default: return style.defaultIconTint
        }
    }
}
