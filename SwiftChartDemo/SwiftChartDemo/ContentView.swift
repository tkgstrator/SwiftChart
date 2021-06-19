//
//  ContentView.swift
//  SwiftChartDemo
//
//  Created by devonly on 2021/05/16.
//

import SwiftUI
import SwiftChart

struct ContentView: View {
    @ObservedObject var chartData = ChartModel()
    @State var selection: Int = 0
    
    var body: some View {
        TabView(selection: $selection) {
            pieChart
//            lineBarChart
//            lineChart
//            radarChart
        }
    }
    
    private var pieChart: some View {
        NavigationView {
            PieChartView(data: chartData.piechart)
                .frame(width: 300, height: 300, alignment: .center)
                .navigationTitle("Pie Chart")
//                .navigationBarItems(trailing: Button(action: { getRandomValue() }, label: { Image(systemName: "arrow.clockwise") }))
        }
        .tabItem({ VStack {
            Image(systemName: "1.square")
            Text("Pie")
        }})
        .tag(0)
    }
    
//    private var lineBarChart: some View {
//        NavigationView {
//            LineBarChartView(lineBarChartData: chartData.linebarchart, caption: { Text("Line Bar Chart") })
//                .frame(width: 300, height: 300, alignment: .center)
//                .navigationTitle("Line Bar Chart")
//                .navigationBarItems(trailing: Button(action: { getRandomValue() }, label: { Image(systemName: "arrow.clockwise") }))
//        }
//        .tabItem({ VStack {
//            Image(systemName: "2.square")
//            Text("LineBar")
//        }})
//        .tag(1)
//    }
    
//    private var lineChart: some View {
//        NavigationView {
//            PieChartView(pieChartData: chartData.piechart)
//                .frame(width: 300, height: 300, alignment: .center)
//                .navigationTitle("Line Bar Chart")
//                .navigationBarItems(trailing: Button(action: { getRandomValue() }, label: { Image(systemName: "arrow.clockwise") }))
//        }
//        .tabItem({ VStack {
//            Image(systemName: "3.square")
//            Text("Line")
//        }})
//        .tag(2)
//    }
//
//    private var radarChart: some View {
//        NavigationView {
//            PieChartView(pieChartData: chartData.piechart)
//                .frame(width: 300, height: 300, alignment: .center)
//                .navigationTitle("Line Bar Chart")
//                .navigationBarItems(trailing: Button(action: { getRandomValue() }, label: { Image(systemName: "arrow.clockwise") }))
//        }
//        .tabItem({ VStack {
//            Image(systemName: "3.square")
//            Text("Radar")
//        }})
//        .tag(3)
//    }

//    private func getRandomValue() {
//        chartData.piechart = PieChartDataSet(data: [Double]())
////        chartData.linebarchart = LineBarChartData(data: [Double]())
//
//        let data: [Double] = {
//            var values: [Double] = []
//            for _ in 0 ..< Int.random(in: 9 ... 9) {
//                values.append(Double.random(in: 0 ... 100))
//            }
//            return values
//        }()
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//            chartData.piechart = PieChartData(data: data)
////            chartData.linebarchart = LineBarChartData(data: data)
//        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
