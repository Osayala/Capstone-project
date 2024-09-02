//
//  Design.swift
//  Restaurant
//
//  Created by Oscar Suarez on 07/08/2024.
//

import SwiftUI

struct ButtonDesignYellow: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .foregroundColor(configuration.isPressed ? .white : .black)
            .padding(10)
            .background(configuration.isPressed ? Color.greenLL : Color.yellowLL)
            .cornerRadius(8)
            .padding(.horizontal)
    }
}

struct ButtonDesignGreen: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .foregroundColor(configuration.isPressed ? .black : .white)
            .padding(10)
            .background(configuration.isPressed ? Color.white : Color.greenLL)
            .cornerRadius(8)
            .border(configuration.isPressed ? Color.greenLL : Color.white)
            .padding(.horizontal)
    }
}

struct ButtonDesignGreenReverse: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .foregroundColor(configuration.isPressed ? .white : .black)
            .padding(10)
            .background(configuration.isPressed ? Color.greenLL : Color.white)
            .cornerRadius(8)
            .border(configuration.isPressed ? Color.white : Color.greenLL)
            .padding(.horizontal)
    }
}
struct CheckboxToggle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            HStack (alignment: .center){
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                configuration.label
            }
        })
    }
}
extension Font {
    static func TitleFont() -> Font {
        return Font.custom("serif", size: 48).weight(.medium)
    }
    
    static func subTitleFont() -> Font {
        return Font.custom("serif", size: 38)
    }
    static func sectionTitleFont() -> Font {
        return Font.custom("Karla", size: 28)
    }
    static func sectionSubTitleFont() -> Font {
        return Font.custom("Karla", size: 22)
    }
    static func headlineFont() -> Font {
        return Font.custom("serif", size: 18)
    }
    static func foodListTitleFont() -> Font {
        return Font.custom("Karla", size: 20)
    }
    static func foodListDetailFont() -> Font {
        return Font.custom("Karla", size: 18)
    }
}
