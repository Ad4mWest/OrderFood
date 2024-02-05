//  CustomModifiers.swift
//  OrderFood
//  Created by Adam West on 01.02.2024.

import SwiftUI

struct StandartButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandP)
            .controlSize(.large)
            .padding(.bottom, 30)
    }
}



