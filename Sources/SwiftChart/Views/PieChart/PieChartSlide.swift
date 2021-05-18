//
//  SwiftUIView.swift
//  
//
//  Created by devonly on 2021/05/16.
//

import SwiftUI

struct PieChartSlide: View {
    @State private var isShowing: Bool = false
    
    var geometry: GeometryProxy
    var slideData: SlideData
    var index: Int
    
    var path: Path {
        let chartSize = geometry.size.width
        let radius = chartSize / 2

        var path = Path()
        path.move(to: CGPoint(x: radius, y: radius))
        path.addArc(center: CGPoint(x: radius, y: radius),
                    radius: radius,
                    startAngle: slideData.startAngle,
                    endAngle: slideData.endAngle,
                    clockwise: false)
        return path
    }
    
    var body: some View {
        path.fill(slideData.data?.color ?? .clear)
            .overlay(path.stroke(Color.white, lineWidth: 1))
            .scaleEffect(isShowing ? 1.0 : 0.0)
            .animation(
                Animation.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.3)
                    .delay(Double(index) * 0.03)
            )
            .onAppear { isShowing = true }
            .onDisappear { isShowing = false }
    }
}
