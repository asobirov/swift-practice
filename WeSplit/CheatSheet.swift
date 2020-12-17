//
//  ContentView.swift
//  WeSplit
//
//  Created by Akbarshoh Sobirov on 17/12/20.
//

import SwiftUI

struct ContentView: View {
    @State
    private var name = ""
    
    let students = ["Harry", "Rin", "Joe"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
//        Section {
//            Text("Two-way binding: $variable")
//                .bold()
//                .underline()
//                .padding()
//            TextField("a", text: $name)
//            Text("Your name is \(name)")
//        }
    
            Picker("Select the student", selection: $selectedStudent) {
                ForEach(0..<students.count){
                    Text(self.students[$0])
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
