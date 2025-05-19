//
//  Menu.swift
//  
//
//  Created by Thibaud David on 08/02/2023.
//

import Foundation
import UIKit

@objc public class Menu : NSObject {
    let children: [MenuElement]

    @objc public init(children: [MenuElement]) {
        self.children = children
    }

    var uiMenu: UIMenu {
        return UIMenu(children: children.map { $0.uiAction })
    }
}
