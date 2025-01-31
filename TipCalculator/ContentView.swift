//
//  ContentView.swift
//  TipCalculator
//
//  Created by Johnathyn Gardner on 1/31/25.
//

import SwiftUI

struct ContentView: View {
    @State private var billAmount: Double = 0.00
    @State private var tipPercent: Double = 0
    @State private var numPeople: Double = 1
    @State private var total: Double = 0.00
    @State private var totalTipAmount: Double = 0.00
    @State private var pricePerPerson: Double = 0.00
    
    var body: some View {
        VStack {
            Text("Tip Calculator")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.vertical)
            
            Image(systemName: "dollarsign.ring")
                .resizable()
                .scaledToFit()
                .padding(.vertical)
            
            // Bill Stack
            VStack {
                Text ("Bill Amount")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color("Bill"))
                Text("$ \(billAmount, specifier: "%.2f")")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Bill"))
                Slider(value: $billAmount, in: 0...450)
                    .frame(width: 350)
                    .accentColor(Color("Bill"))
            }
            
            // Tip Stack
            VStack {
                Text ("Tip Percentage")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color("Tip"))
                Text("\(tipPercent, specifier: "%.0f") %")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Tip"))
                Slider(value: $tipPercent, in: 0...100, step: 1.0)
                    .frame(width: 350)
                    .accentColor(Color("Tip"))
            }
            
            // People Stack
            VStack {
                Text ("Number of People")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color("People"))
                Text("\(numPeople, specifier: "%.0f")")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("People"))
                Slider(value: $numPeople, in: 1...12, step: 1.0)
                    .frame(width: 350)
                    .accentColor(Color("People"))
            }
            
            // Total display
            VStack {
                Text ("Total: $ \(total, specifier: "%.2f")")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Button {
                    total = calculate(bill: billAmount, tip: tipPercent, people: numPeople)
                } label: {
                    Text("Calculate")
                        .frame(width: 300)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(10)
                }
                .padding(.vertical, 100)
            }
        }
        
    }
    
    // Function for calculating tip
    func calculateTip(bill: Double, tip: Double) -> Double {
        let calculatedTip = bill * (tip / 100)
        return calculatedTip
    }
    
    // Function for calculating total
    func calculate(bill: Double, tip: Double, people: Double) -> Double {
        let calculatedTotal = ((bill * (tip / 100)) + bill)
        return calculatedTotal
    }
    
    // Function for calculating amount per person
    func perPerson(bill: Double, tip: Double, people: Double) -> Double {
        let perPersonTotal = ((bill * (tip / 100)) + bill) / people
        return perPersonTotal
    }
}

#Preview {
    ContentView()
}


