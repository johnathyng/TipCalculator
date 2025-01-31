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
    @State var displayResults = false
    @State private var hideResults = "Hide Results"
    
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
                .frame(width: 150, height: 150)
            
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
                Slider(value: $billAmount, in: 0...500)
                    .frame(width: 350)
                    .accentColor(Color("Bill"))
                    .shadow(radius: 10)
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
                Slider(value: $tipPercent, in: 0...30, step: 1.0)
                    .frame(width: 350)
                    .accentColor(Color("Tip"))
                    .shadow(radius: 10)
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
                Slider(value: $numPeople, in: 1...20, step: 1.0)
                    .frame(width: 350)
                    .accentColor(Color("People"))
                    .shadow(radius: 10)
            }
            
            // Total display
            VStack {
               
                Button {
                    displayResults.toggle()
                    hideResults = displayResults ? "Hide Results" : "Calculate"
                    
                    total = calculate(bill: billAmount, tip: tipPercent, people: numPeople)
                    
                    totalTipAmount = calculateTip(bill: billAmount, tip: tipPercent)
                    print(displayResults)
                    
                    pricePerPerson = perPerson(bill: total, people: numPeople)
                } label: {
                    
                    if displayResults == true {
                        Text(hideResults)
                            .frame(width: 300)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(15)
                            .shadow(radius: 10)
                    }
                    else {
                        Text(hideResults)
                            .frame(width: 300)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(15)
                            .shadow(radius: 10)
                    }
                }
                .padding(.vertical)
              
                    
                if displayResults {
                    VStack {
                        Text("Total: $ \(total, specifier: "%.2f")")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Text("Tip Amount: $ \(totalTipAmount, specifier: "%.2f")")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Text("Price per Person: $ \(pricePerPerson, specifier: "%.2f")")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    .frame(width: 300, height: 100)
                    .background(.white)
                    .cornerRadius(15)
                    .shadow(radius: 10)
                    .padding(.vertical, 5)
                }
            }
        }
        Spacer()
        
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
    func perPerson(bill: Double, people: Double) -> Double {
        let perPersonTotal = bill / people
        return perPersonTotal
    }
}

#Preview {
    ContentView()
}


