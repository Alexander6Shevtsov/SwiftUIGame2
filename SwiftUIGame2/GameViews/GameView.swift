//
//  GameView.swift
//  SwiftUIGame
//
//  Created by Alexander Shevtsov on 09.04.2025.
//

import SwiftUI

struct GameView: View {
    
    @State private var gameViewModel = GameViewModel() //созд екземпляр класса
    // @State if need use $
    var body: some View {
        VStack {
            GameSliderView(gameViewModel: gameViewModel, color: .red)
            
            Button("Проверь!", action: gameViewModel.showAlert)
                .padding()
                .alert( // отображаем алерт
                    "Your score",
                    isPresented: $gameViewModel.alertIsPresented,
                    actions: {}
                ) {
                    Text(gameViewModel.scores.formatted())
                }
            
            Button("Заново", action: gameViewModel.reset)
        }
    }
}

#Preview {
    GameView()
}
