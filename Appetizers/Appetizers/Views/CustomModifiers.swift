//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by João Pedro Soares on 17/10/2023.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}

