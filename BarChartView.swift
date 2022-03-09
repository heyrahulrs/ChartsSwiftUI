//
//  BarChartView.swift
//  ChartsSwiftUI
//
//  Created by Rahul Sharma on 08/03/22.
//

import SwiftUI

struct BarChartView: View {
    
    var data: [CGFloat]
    
    @State var normalizedData: [CGFloat]
    
    init(data:  [CGFloat]) {
        self.data = data
        _normalizedData = State(initialValue: Array(repeating: 0.01, count: data.count))
    }
    
    var body: some View {
        HStack(alignment: .bottom) {
            ForEach(normalizedData.indices, id: \.self) { index in
               BarChartShape(normalizedValue: normalizedData[index])
            }
        }
        .onAppear {
            let max = data.max()!
            let min = data.min()!
            var result: [CGFloat] = []
            for datum in data {
                var normalized = (datum - min) / (max - min)
                if normalized == 0 {
                    normalized = 0.01
                }
                result.append(normalized)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation(.easeInOut) {
                    normalizedData = result
                }
            }
        }
    }
}


struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView(data: sampleDataPoints)
    }
}
