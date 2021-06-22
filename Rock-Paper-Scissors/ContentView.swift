//
//  ContentView.swift
//  Rock-Paper-Scissors
//
//  Created by Soumyattam Dey on 22/06/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var computer_score=0
    @State private var player_score=0
    @State private var showScore=false
    @State private var scoreTitle=""
    @State private var outcome=""
    
    @State private var move_computer=Int.random(in:0...2)
    
    
    let moves=["Rock","Paper","Scissors"]
    
    var body: some View {
        ZStack{
            
            
            Rectangle()
                .foregroundColor(Color.init( red: 228/255, green: 195/255, blue: 76/255, opacity: 100))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)

            VStack{
                Text("Rock-Paper-Scissors")
                    .fontWeight(.heavy)
                    .padding()
                    .font(.largeTitle)

                HStack{
                    Spacer()
                    VStack{
                        Text("Computer")
                            .fontWeight(.medium)
                            .padding(.bottom)
                        Text("\(computer_score)")
                            .fontWeight(.semibold)
                    }
                    Spacer()
                    VStack{
                        Text("Player")
                            .fontWeight(.medium)
                            .padding(.bottom)
                        Text("\(player_score)")
                            .fontWeight(.semibold)
                    }
                    .padding(40)
                    Spacer()
                }
                .font(.title)
                .foregroundColor(.black)
                
                
                HStack{
                    
                    ForEach(0..<3){ move in
                        Button(action: {
                            self.buttontapped(move)
                        }, label: {
                            Text(self.moves[move])
                        })
                        .padding(40.0)
                        .background(Color.pink)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        
                        
                    }
                    
                }
                Spacer()
            }
            
        }
        .alert(isPresented: $showScore, content: {
            Alert(title: Text("\(outcome)"), message: Text("\(scoreTitle)"), dismissButton: .default(Text("Continue")){
                newGame()
            })
        })
        
    }
    
    func buttontapped(_ move:Int){
        if(move==move_computer){
            outcome="Yippe!"
            scoreTitle="You Scored"
            player_score+=1
        }else{
            outcome="Oops!"
            scoreTitle="Computer Scored"
            computer_score+=1
        }
        if(player_score+computer_score==5){
            outcome="Game Over!"
            scoreTitle=(player_score>computer_score) ? "You win" : "You lost"
        }
        showScore=true
    }
    
    func newGame(){
        
        move_computer=Int.random(in: 0...2)
        
        if(player_score+computer_score==5){
            player_score=0
            computer_score=0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
