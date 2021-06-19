//
//  Color.swift
//  
//
//  Created by devonly on 2021/05/16.
//

import Foundation
import SwiftUI

extension Color {
    public static var random: Color {
        return Color(red: .random(), green: .random(), blue: .random())
    }
}

extension Double {
    static func random() -> Double {
        return Double(arc4random()) / Double(UINT32_MAX)
    }
}
