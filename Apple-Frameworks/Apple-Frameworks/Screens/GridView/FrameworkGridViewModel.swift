//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks
//
//  Created by João Pedro Soares on 25/09/2023.
//

import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
    
//    var selectedFramework: Framework? {
//        didSet { self.isShowingDetailView = true }
//    }
//    
//    @Published var isShowingDetailView = false
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
}
