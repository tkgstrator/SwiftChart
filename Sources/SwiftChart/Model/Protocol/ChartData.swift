//
//  ChartData.swift
//  
//
//  Created by devonly on 2021/05/18.
//

import Foundation
import SwiftUI

// 基本となるクラス
public class PieChartData<Label: View>: Identifiable, Hashable {
    public static func == (lhs: PieChartData<Label>, rhs: PieChartData<Label>) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    public var id: UUID = UUID()
    var value: Double?
    var label: Label
    var color: Color

    public init(value: Double?, @ViewBuilder label: () -> Label, color: Color = Color.random) {
        self.value = value
        self.label = label()
        self.color = color
    }
}

//// PieChartDataからSlideDataを作成して保持する
//public class PieChartDataSet<Label: View>: ObservableObject {
//    @Published private(set) var slides: [PieChartSlideData<Label>] = []
//
//    public init(data dataArray: [PieChartData<Label>]) {
//        // 初期の傾き状態
//        var currentAngle: Double = -90
//        var totalValue: Double = dataArray.map({ $0.value ?? 0.0 }).reduce(0, +)
//
//        for data in dataArray {
//            var slide = PieChartSlideData<Label>()
//        }
//    }
//}

// ラベルの角度やラベルの内容を保存する
public class PieChartSlideData<Label: View>: Identifiable {
    public var id: UUID = UUID()
    public var startAngle: Angle = .degrees(0)
    public var endAngle: Angle = .degrees(0)
    
    var percentage: Double = 0.0
    var label: Label?
    var theta: CGPoint {
        let angle: CGFloat = CGFloat(startAngle.degrees + endAngle.degrees) / 2
        let x: CGFloat = cos(angle / 180 * .pi)
        let y: CGFloat = sin(angle / 180 * .pi)
        return CGPoint(x: x , y: y)
    }
    var color: Color = .clear
    init() {}
    
    static func generate(data: [PieChartData<Label>]) -> [PieChartSlideData] {
        var slides: [PieChartSlideData<Label>] = []
        var currentAngle: Double = -90
        let totalValue = data.map({ $0.value ?? 0.0 }).reduce(0.0, +)
        
        for data in data {
            // 値がNilでない場合のみ計算を行う
            if let value = data.value {
                if value > 0 {
                    let slide = PieChartSlideData<Label>()
                    
                    // 回転角の計算
                    slide.color = data.color
                    slide.label = data.label
                    slide.percentage = value / totalValue * 100
                    slide.startAngle = Angle(degrees: currentAngle)
                    currentAngle += value * 360 / totalValue
                    slide.endAngle = Angle(degrees: currentAngle)
                    slides.append(slide)
                }
            }
        }
        return slides
    }
}
