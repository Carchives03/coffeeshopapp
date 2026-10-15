//
//  Size.swift
//  SirenCoffeeAppRough
//
//  Created by Caria Taylor on 9/28/26.
//

import Foundation
enum Size: String, CaseIterable {  // Enum fro size which allows me to change the value of each depending on the desired size.
    case S
    case M
    case L
    var basePrice: Double {
        switch self {
        case .S:
            return 6.0
        case .M:
            return 6.5
        case .L:
            return 7.0
            
        }
    }
}
