//
//  ContentView.swift
//  TipCalculator
//
//  Created by Johnathyn Gardner on 1/31/25.
//

import SwiftUI

struct ContentView: View {
    @State private var billAmount: Double = 0.00
    @State private var tipAmount: Double = 0
    @State private var numPeople: Double = 1
    
    var body: some View {
        VStack {
            Text("Tip Calculator")
                .font(.largeTitle)
                .fontWeight(.bold)
           
            // Bill Stack
            VStack {
                Text ("Bill Amount")
                    .font(.title)
                    .fontWeight(.bold)
                Text("\(billAmount, specifier: "%.2f")")
                    .font(.title)
                    .fontWeight(.semibold)
                Slider(value: $billAmount, in: 0...450)
            }
            
            // Tip Stack
            VStack {
                Text ("Tip Amount")
                    .font(.title)
                    .fontWeight(.bold)
                Text("\(tipAmount, specifier: "%.0f") %")
                    .font(.title)
                    .fontWeight(.semibold)
                Slider(value: $tipAmount, in: 0...100)
            }
            
            // People Stack
            VStack {
                Text ("Number of People")
                    .font(.title)
                    .fontWeight(.bold)
                Text("\(numPeople, specifier: "%.0f")")
                    .font(.title)
                    .fontWeight(.semibold)
                Slider(value: $numPeople, in: 1...12)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
