//
//  LineChartView.swift
//  ChartsSwiftUI
//
//  Created by Rahul Sharma on 08/03/22.
//

import SwiftUI

struct LineChartView: View {
    
    var data: [CGFloat]
    
    @State var normalizedData: DataPoints
    
    init(data:  [CGFloat]) {
        self.data = data
        _normalizedData = State(initialValue: DataPoints.zero(count: data.count))
    }
    
    var body: some View {
        LineChartShape(data: normalizedData)
            .stroke(Color.pink,
                    style: StrokeStyle(lineWidth: 2, lineJoin: .round))
            .onAppear {
                let max = data.max()!
                let min = data.min()!
                var result: [CGFloat] = []
                for datum in data {
                    let normalized = (datum - min) / (max - min)
                    result.append(1 - normalized)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation(.easeInOut) {
                        normalizedData = DataPoints(points: result)
                    }
                }
            }
    }
}

var sampleDataPoints: [CGFloat] = [0.0, 20.0, 3.0, 24.0, 6.8, 4.5, 15.0]
var sampleData = DataPoints(points: sampleDataPoints)

struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
        let samplePoints: [CGFloat] = (0 ..< 30).map { _ in CGFloat.random(in: 0.0...100.0) }
        return LineChartView(data: samplePoints)
    }
}
