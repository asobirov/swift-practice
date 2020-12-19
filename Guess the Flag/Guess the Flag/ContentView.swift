//
//  ContentView.swift
//  Guess the Flag
//
//  Created by Akbarshoh Sobirov on 18/12/20.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showResult = false
    @State private var result = ""
    
    @State private var score = 0

    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: .center, spacing: 30){
                Spacer()
                VStack{
                    Text("Select the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0 ..< 3){ number in
                    Button(action: {
                        self.flagTapped(number)
                    }){
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 1))
                            .shadow(color:Color.black.opacity(0.6), radius: 2)
                    }
                }
                Spacer()
                
                Text("Your score is \(score)")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    
            }
        }
        .alert(isPresented: $showResult){
            Alert(title: Text(result), message:
                Text("Your score is \(score)"),
                  dismissButton: .default(Text("Continue")){
                    self.askQuestion()
                  })
        }
    }
    
    func flagTapped(_ number: Int){
        if number == correctAnswer{
            result = "Correct"
            score += 5
        } else{
            result = "Wrong! It's \(self.countries[correctAnswer])"
            score -= 3
        }
        
        showResult = true
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
