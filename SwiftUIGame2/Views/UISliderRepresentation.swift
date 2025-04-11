//
//  UISliderRepresentation.swift
//  SwiftUIGame
//
//  Created by Alexander Shevtsov on 09.04.2025.
//

import SwiftUI

struct UISliderRepresentation: UIViewRepresentable {
    
    @Binding var value: Double // значение с двухсторонней связью
    
    let alpha: Double // прозрачность
    let color: UIColor
    
    func makeUIView(context: Context) -> UISlider { // создаем слайдер
        let slider = UISlider() // экземпляр
        slider.minimumValue = 0 // диапазон
        slider.maximumValue = 100
        
        slider.addTarget( // действие при взаимодействие со слайдером
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ view: UISlider, context: Context) {
        view.value = Float(value) // значение слайдера приводи к Float
        view.thumbTintColor = color.withAlphaComponent(alpha)
    } // прозрачность цвета бегунка
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension UISliderRepresentation {
    class Coordinator: NSObject {
        
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func valueChanged(_ slider: UISlider) {
            value = Double(slider.value)
        }
    }
}

#Preview {
    UISliderRepresentation(value: .constant(50), alpha: 100, color: .blue)
}
