//
//  ContentView.swift
//  TimeConventor
//
//  Created by Akbarshoh Sobirov on 17/12/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputNumber = ""
    @State private var fromType = 0
    @State private var toType = 1
    
    let timeList = ["seconds", "minutes", "hours", "days"]
    
    var convertedTime: Double{
        var converted: Double = 0
        
        if(fromType == 0){
            converted = Double(inputNumber) ?? 0
        } else if (fromType == 1){
            converted = (Double(inputNumber) ?? 0) * 60
        } else if (fromType == 2){
            converted = (Double(inputNumber) ?? 0) * 3600
        } else if (fromType == 3){
            converted = (Double(inputNumber) ?? 0) * 3600 * 24
        }
        
        if (toType == 1){
            converted = converted / 60
        } else if (toType == 2){
            converted = converted / 3600
        } else if (toType == 3){
            converted = converted / (3600 * 24)
        }
        
        return converted
        
    }
    var body: some View {
        NavigationView{
            Form{
                
                Section{
                    TextField("Value to convert", text: $inputNumber)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("From")){
                    Picker("From", selection: $fromType) {
                        ForEach(0 ..< timeList.count) {
                            Text("\(self.timeList[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("To")){
                    Picker("to", selection: $toType){
                        ForEach(0 ..< timeList.count){
                            Text("\(self.timeList[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                }
                
                Section(header: Text("Converted value")){
                    if(convertedTime.truncatingRemainder(dividingBy: 1) == 0){
                        Text("\(Int(convertedTime))")
                    } else{
                        Text("\(convertedTime, specifier: "%.2f")")
                    }
                    
                }
            }
            .navigationTitle("Time Convertion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
