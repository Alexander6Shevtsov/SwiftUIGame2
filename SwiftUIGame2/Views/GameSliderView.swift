//
//  GameSliderView.swift
//  SwiftUIGame
//
//  Created by Alexander Shevtsov on 09.04.2025.
//

import SwiftUI

struct GameSliderView: View {
    @Bindable var gameViewModel: GameViewModel
    let color: UIColor
    
    var body: some View {
        VStack {
            let targetValue = gameViewModel.gameOptions.targetValue
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
            HStack {
                Text("0")
                UISliderRepresentation(
                    value: $gameViewModel.gameOptions.currentValue,
                    alpha: gameViewModel.alpha,
                    color: color
                )
                Text("100")
            }
            .padding()
        }
    }
}

#Preview {
    GameSliderView(gameViewModel: GameViewModel(), color: .red)
}
