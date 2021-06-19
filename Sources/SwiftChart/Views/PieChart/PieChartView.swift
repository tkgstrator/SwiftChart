//
//  SwiftUIView.swift
//  
//
//  Created by devonly on 2021/05/16.
//

import SwiftUI

public struct PieChartView<Label: View>: View {
    public var slides: [PieChartSlideData<Label>]

    public init(data: [PieChartData<Label>]) {
        self.slides = PieChartSlideData.generate(data: data)
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ForEach(slides) { slide in
                PieChartSlide(geometry: geometry, slide: slide)
            }
        }
    }
}

struct PieChartSlide<Label: View>: View, Identifiable {
    let id: UUID = UUID()
    let geometry: GeometryProxy
    let slide: PieChartSlideData<Label>
    @State var percent: CGFloat = 0.0
    @State var scale: CGFloat = 0.0
    var radius: CGFloat {
        geometry.size.width / 2
    }
    
    var path: Path {
        let chartSize = geometry.size.width
        let radius = chartSize / 2

        var path = Path()
        path.move(to: CGPoint(x: radius, y: radius))
        path.addArc(center: CGPoint(x: radius, y: radius),
                    radius: radius,
                    startAngle: slide.startAngle,
                    endAngle: slide.endAngle,
                    clockwise: false)
        return path
    }
    var offset: CGPoint {
        return CGPoint(x: radius * 0.75 * slide.theta.x, y: radius * 0.75 * slide.theta.y)
    }
    
    var body: some View {
        path
            .fill(slide.color.opacity(0.5))
            .overlay(
                path
                    .stroke(Color.white, lineWidth: 3)
            )
            .overlay(
                VStack {
                    Text(String(format: "%.01f%%", slide.percentage))
                    slide.label
                }
                .font(.system(size: 18, weight: .bold, design: .monospaced))
                .minimumScaleFactor(0.5)
                .offset(x: offset.x, y: offset.y)
            )
            .scaleEffect(scale)
            .animation(
                Animation.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1)
            )
            .onAppear { scale = 1.0 }
    }
}
