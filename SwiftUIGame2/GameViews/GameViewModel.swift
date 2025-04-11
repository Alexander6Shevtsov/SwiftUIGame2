//
//  GameViewModel.swift
//  SwiftUIGame
//
//  Created by Alexander Shevtsov on 09.04.2025.
//

import Foundation
import Observation

@Observable // чтобы прикрутить UIKit
final class GameViewModel: ObservableObject {
    var gameOptions = GameOptions() // модель представлений
    var alertIsPresented = false // показ сообщения
    
    var scores: Int { // геттер заработанных очков
        100 - abs(gameOptions.targetValue - lround(gameOptions.currentValue))
    } // просто алгоритм
    
    var alpha: Double { // прозрачность рассчитывается от 0 до 1
        Double(scores) / 100 // заработанные очки делим на 100
    }
    
    func showAlert() {
        alertIsPresented.toggle()
    }
    
    func reset() {
        gameOptions.currentValue = Double.random(in: 0...100)
        gameOptions.targetValue = Int.random(in: 0...100)
    }
}
