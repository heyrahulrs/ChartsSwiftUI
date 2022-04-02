//
//  PieChartView.swift
//  ChartsSwiftUI
//
//  Created by Rahul Sharma on 09/03/22.
//

import SwiftUI

struct PieChartView: View {
    
    var data: [CGFloat] = [10.0, 40.0, 20.0, 30.0]
    
    var normalizedData: [CGFloat] {
        let sum = data.reduce(0, +)
        var result: [CGFloat] = []
        for datum in data {
            result.append(datum / sum)
        }
        return result
    }
    
    var colors: [Color] = [.red, .green, .cyan, .blue]
    
    var body: some View {
        ZStack {
            Text(normalizedData.debugDescription)
                .zIndex(100)
            PieChartShape(startAngle: .degrees(0), endAngle: .degrees(360.0 * normalizedData[0]))
                .fill(colors[0])
            PieChartShape(
                startAngle: .degrees(normalizedData[0] * 360.0),
                endAngle: .degrees(normalizedData[1] * 360.0)
            )
            .fill(colors[1])
            PieChartShape(
                startAngle: .degrees(0),
                endAngle: .degrees(normalizedData[2] * 360.0),
                clockwise: false
            )
            .fill(colors[2])
//            ForEach(normalizedData.indices.dropFirst(), id: \.self) { index in
//                PieChartShape(
//                    startAngle: .degrees(normalizedData[index - 1] * 360.0),
//                    endAngle: .degrees(normalizedData[index] * 360.0)
//                )
//                .fill(colors[index])
//            }
//            PieChartShape(startAngle: .degrees(CGFloat(360) * normalizedData.last!), endAngle: .degrees(360))
//                .fill(.gray)
        }
    }
    
}

struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView()
    }
}
