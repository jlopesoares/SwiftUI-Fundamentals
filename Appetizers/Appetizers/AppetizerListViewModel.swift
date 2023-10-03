//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by João Pedro Soares on 03/10/2023.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let failure):
                    print(failure.localizedDescription)
                    break
                }
            }
        }
    }
}
