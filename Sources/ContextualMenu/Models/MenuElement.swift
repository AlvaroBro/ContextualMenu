//
//  MenuElement.swift
//  
//
//  Created by Thibaud David on 08/02/2023.
//

import Foundation
import UIKit

@objc public class MenuElement : NSObject {
    let title: String
    let image: UIImage?
    let attributes: Attributes
    var handler: ((MenuElement) -> Void)?

    @objc public init(
        title: String,
        image: UIImage? = nil,
        attributes: Attributes = .default,
        handler: ((MenuElement) -> Void)? = nil
    ) {
        self.title = title
        self.image = image
        self.attributes = attributes
        self.handler = handler
    }

    var uiAction: UIAction {
        return .init(
            title: title,
            image: image,
            attributes: attributes.uiAttributes,
            handler: { _ in
                self.handler?(self)
            }
        )
    }
}

@objc extension MenuElement {
    @objc public class Attributes: NSObject, OptionSet {
        public let rawValue: Int8

        @objc required public init(rawValue: Int8) {
            self.rawValue = rawValue
        }

        @objc public static let `default` = Attributes(rawValue: 1 << 0)
        @objc public static let destructive = Attributes(rawValue: 1 << 1)

        var uiAttributes: UIAction.Attributes {
            var attributes = UIAction.Attributes()
            if contains(.destructive) {
                attributes.insert(.destructive)
            }
            return attributes
        }
    }
}
