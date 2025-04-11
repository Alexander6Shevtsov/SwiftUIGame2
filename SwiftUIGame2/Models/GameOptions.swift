//
//  GameOptions.swift
//  SwiftUIGame
//
//  Created by Alexander Shevtsov on 09.04.2025.
//

import Foundation

struct GameOptions {
    var targetValue = Int.random(in: 1...100) // целевое значение
    var currentValue = Double.random(in: 0...100) // текущее значение
}
