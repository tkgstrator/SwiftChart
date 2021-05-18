//
//  SwiftUIView.swift
//  
//
//  Created by devonly on 2021/05/16.
//

import SwiftUI

public struct PieChartView: View {
    public var pieChartData: PieChartData

    public init(pieChartData: PieChartData) {
        self.pieChartData = pieChartData
    }
    
    public var body: some View {
        GeometryReader { geometry in
            makePieChart(geometry, slides: pieChartData.data)
                .frame(width: min(geometry.size.width, geometry.size.height),
                       height: min(geometry.size.width, geometry.size.height))
                .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                .background(Color.red.opacity(0.3))
        }
    }
    
    func makePieChart(_ geometry: GeometryProxy, slides: [SlideData]) -> some View {
        let chartSize = min(geometry.size.width, geometry.size.height)
        let radius = chartSize / 2
        let centerX = geometry.size.width / 2

        return ZStack {
            ForEach(0 ..< slides.count, id: \.self) { index in
                PieChartSlide(geometry: geometry, slideData: slides[index], index: index)
            }
            ForEach(slides) { slide in
                Text(slide.percentage)
                    .foregroundColor(Color.white)
                    .font(.system(size: 20, weight: .bold, design: .monospaced))
                    .position(CGPoint(x: centerX + slide.titleDeltaX * radius,
                                      y: centerX + slide.titleDeltaY * radius))
            }
        }
    }
}
