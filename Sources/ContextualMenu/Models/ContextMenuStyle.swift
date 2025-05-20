//
//  ContextMenuStyle.swift
//  
//
//  Created by Thibaud David on 17/02/2023.
//

import Foundation
import UIKit

@objc public class ContextMenuStyle : NSObject {
    public let windowLevel: UIWindow.Level
    public let backgroundColor: UIColor
    public let backgroundBlurStyle: UIBlurEffect.Style
    public let blurAlpha: CGFloat

    public let apparition: AnimationParameters
    public let disapparition: AnimationParameters

    public let preview: Preview
    public let menu: MenuView.Style_

    @objc public static let `default` = ContextMenuStyle()

    @objc public init(
        windowLevel: UIWindow.Level = .statusBar - 1,
        backgroundColor: UIColor = .clear,
        backgroundBlurStyle: UIBlurEffect.Style = .systemUltraThinMaterialDark,
        blurAlpha: CGFloat = 1,
        apparition: AnimationParameters = AnimationParameters(),
        disapparition: AnimationParameters = AnimationParameters(),
        preview: Preview = Preview(),
        menu: MenuView.Style_ = MenuView.Style_()
    ) {
        self.windowLevel = windowLevel
        self.backgroundColor = backgroundColor
        self.backgroundBlurStyle = backgroundBlurStyle
        self.blurAlpha = blurAlpha
        self.apparition = apparition
        self.disapparition = disapparition
        self.preview = preview
        self.menu = menu
    }
}

@objc extension ContextMenuStyle {
    @objc public class Preview : NSObject {
        public var transform: CGAffineTransform
        public var topMargin: CGFloat
        public var bottomMargin: CGFloat

        public var shadow: ShadowParameters

        public init(
            transform: CGAffineTransform = .init(scaleX: 1.0, y: 1.0),
            topMargin: CGFloat = 8,
            bottomMargin: CGFloat = 8,
            shadow: ShadowParameters = .init()
        ) {
            self.transform = transform
            self.topMargin = topMargin
            self.bottomMargin = bottomMargin
            self.shadow = shadow
        }
    }
}
