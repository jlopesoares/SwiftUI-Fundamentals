//
//  DetailView.swift
//  Appetizers
//
//  Created by João Pedro Soares on 05/10/2023.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(height: 225)
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40) {
                    NutritionInfo(title: "Calories", value: appetizer.calories)
                    NutritionInfo(title: "Carbs", value: appetizer.carbs)
                    NutritionInfo(title: "Protein", value: appetizer.protein)
                }
            }
            
            Spacer()
            
            Button {
                print("tapped")
            } label: {
                APButton(title: "$\(appetizer.price, specifier: "%.02f") - Add to Order")
            }
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button(action: {
            isShowingDetail = false
        }, label: {
            XDismissButton()
        }), alignment: .topTrailing)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: MockData.sampleAppetizer,
                            isShowingDetail: .constant(false))
    }
}

struct NutritionInfo: View {
    
    let title: String
    let value: Int
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}