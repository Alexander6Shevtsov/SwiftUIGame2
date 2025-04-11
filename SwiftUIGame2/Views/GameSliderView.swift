//
//  GameSliderView.swift
//  SwiftUIGame
//
//  Created by Alexander Shevtsov on 09.04.2025.
//

import SwiftUI

struct GameSliderView: View {
    @Bindable var gameViewModel: GameViewModel // @Bindable обратная связь
    let color: UIColor
    
    var body: some View {
        VStack {
            let targetValue = gameViewModel.gameOptions.targetValue
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
            HStack {
                Text("0") // диапазон от
                UISliderRepresentation( // слайдер
                    value: $gameViewModel.gameOptions.currentValue, // значение
                    alpha: gameViewModel.alpha, // прозрачность
                    color: color
                )
                Text("100") // диапазон до
            }
            .padding()
        }
    }
}

#Preview {
    GameSliderView(gameViewModel: GameViewModel(), color: .red)
}
