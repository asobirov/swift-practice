//
//  ContentView.swift
//  RockPaperScissors-Win-Lose
//
//  Created by Akbarshoh Sobirov on 13/01/21.
//

import SwiftUI

struct ContentView: View {
    private var moves = ["Rock", "Paper", "Scissors"]
    @State private var choice = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    
    @State private var showResult = false
    @State private var result = ""
    @State private var taskCompleted = false
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 0) {
                Spacer()
                Image(moves[choice].lowercased())
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .shadow(color:Color.black.opacity(0.6), radius: 2)
                    .frame(width: 250.0, height: 250.0, alignment: .center)
                Text("Opponent chose \(moves[choice])")
                    .foregroundColor(.white)
                    .font(.title2)
                    .fontWeight(.bold)
                if shouldWin{
                    Text("Demolish him! Win the game!") //IDK
                        .foregroundColor(.white)
                        .font(.title3)
                        .fontWeight(.semibold)
                } else{
                    Text("Make him happier:) Lose the game.")
                        .foregroundColor(.white)
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                Spacer()
                
                Text("You have \(score) 🍪")
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.bottom, 30)
                HStack(alignment: .center, spacing: 30){
                    Spacer()
                    ForEach(0 ..< 3){ number in
                        Button(action: {
                            self.playerMove(number)
                        }){
                            Image(self.moves[number].lowercased())
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.white)
                                .shadow(color:Color.black.opacity(0.6), radius: 2)
                            
                        }
                    }
                    Spacer()
                }
            }
        }
        .alert(isPresented: $showResult){
            Alert(title: Text(result), message:
                  taskCompleted ? Text("Here is your cookies 🍪") : Text("Gimme that cookie 🍪") ,
                  dismissButton: .default(Text("Continue")){
                    self.resetGame()
                  })
        }
    }
    
    func  playerMove(_ playerMove: Int){
        
        if shouldWin && ((choice == 0 && playerMove == 1) || (choice == 1 && playerMove == 2) || (choice == 2 && playerMove == 0)){
            result = "That was fire! 🔥"
            taskCompleted = true
            score += 10
            
        } else if !shouldWin && ((choice == 0 && playerMove == 2) || (choice == 1 && playerMove == 0) || (choice == 2 && playerMove == 1)){
            result = "Thanks! He is happier now. 🤖"
            taskCompleted = true
            score += 10
        } else{
            result = "Well... That's not what was asked to do😕"
            taskCompleted = false
            let decreaseBy = Int.random(in: 1...10)
            if(decreaseBy > score){
                score = 0
            } else{
                score -= decreaseBy
            }
        }
        showResult = true
    }
    
    func resetGame(){
        choice = Int.random(in: 0...2)
        shouldWin = Bool.random()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
