//
//  File.swift
//  
//
//  Created by devonly on 2021/05/18.
//

import Foundation
import SwiftUI

public struct LineBarChartView<Content: View>: View {
    
    public var lineBarChartData: LineBarChartData
    let caption: () -> Content
    
    public init(
        lineBarChartData: LineBarChartData,
        @ViewBuilder caption: @escaping () -> Content
    ) {
        self.lineBarChartData = lineBarChartData
        self.caption = caption
    }
    
    public var body: some View {
        VStack(alignment: .center) {
            GeometryReader { geometry in
                makeLineBarChart(geometry, bars: lineBarChartData.data)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                    .background(Color.red.opacity(0.3))
            }
            caption()
                .animation(Animation.easeIn(duration: 0.5))
        }
    }
    
    func makeLineBarChart(_ geometry: GeometryProxy, bars: [LineBarData]) -> some View {
        return
            LazyVGrid(columns: Array(repeating: .init(.flexible()), count: bars.count), alignment: .center, spacing: 0, pinnedViews: []) {
                ForEach(0 ..< bars.count, id:\.self) { index in
                    LineBarChart(geometry: geometry, barData: bars[index], index: index, maxValue: bars.map{ $0.data?.value ?? 0.0}.max()!)
                }
            }
            .animation(Animation.easeIn(duration: 0.5))
    }
}
