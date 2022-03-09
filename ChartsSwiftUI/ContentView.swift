//
//  ContentView.swift
//  ChartsSwiftUI
//
//  Created by Rahul Sharma on 08/03/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var samplePoints = (1 ..< 30).map { _ in
        CGFloat.random(in: 0...100)
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Line Chart").bold()
                LineChartView(data: samplePoints)
                .aspectRatio(1.5, contentMode: .fit)
            }
            .padding()
            .background(
                Color.white
                    .shadow(color: .black.opacity(0.1), radius: 20, x: 0, y: 2)
            )
            .padding()
            VStack(alignment: .leading) {
                Text("Bar Chart").bold()
                BarChartView(data: samplePoints)
                .aspectRatio(1.5, contentMode: .fit)
            }
            .padding()
            .background(
                Color.white
                    .shadow(color: .black.opacity(0.1), radius: 20, x: 0, y: 2)
            )
            .padding()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
