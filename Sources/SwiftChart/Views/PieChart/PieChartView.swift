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
        return CGPoint(x: radius * 0.8 * slide.theta.x, y: radius * 0.8 * slide.theta.y)
    }
    
    var body: some View {
        path
            .fill(Color.red.opacity(0.5))
            .overlay(
                path
                    .stroke(Color.white, lineWidth: 3)
            )
            .overlay(
                slide.label
                    .offset(x: offset.x, y: offset.y), alignment: .center
            )
            .overlay(
                Circle()
                    .frame(width: 5, height: 5, alignment: .center)
                    .offset(x: offset.x, y: offset.y), alignment: .center
            )
    }
}
