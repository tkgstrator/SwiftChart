//
//  Color.swift
//  
//
//  Created by devonly on 2021/05/16.
//

import Foundation
import SwiftUI

extension Color {
    static func random() -> Color {
        return Color(red: .random(), green: .random(), blue: .random())
    }
}

extension Double {
    static func random() -> Double {
        return Double(arc4random()) / Double(UINT32_MAX)
    }
}
