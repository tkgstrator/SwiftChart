//
//  File.swift
//  
//
//  Created by devonly on 2021/05/18.
//

import Foundation
import SwiftUI

struct LineBarChart: View {
    @State private var isShowing: Bool = false
    
    var geometry: GeometryProxy
    var barData: LineBarData
    var index: Int
    var maxValue: Double
    var value: Double {
        if let value = barData.data?.value {
            return Double(geometry.size.height) / maxValue * value
        }
        return 0.0
    }
    
    var path: Path {
        return Path { path in
            path.move(to: CGPoint(x: 15 / 2, y: geometry.size.height / 2))
            path.addLine(to: CGPoint(x: 15 / 2, y: Double(geometry.size.height / 2) - value))
        }
    }
    
    var body: some View {
        path
            .stroke(lineWidth: 15)
            .fill(Color.blue)
            .frame(width: 15)
            .scaleEffect(isShowing ? 1.0 : 0.0)
            .animation(Animation.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.3).delay(Double(index) * 0.03))
            .onAppear { isShowing = true }
            .onDisappear { isShowing = false }
    }
}
