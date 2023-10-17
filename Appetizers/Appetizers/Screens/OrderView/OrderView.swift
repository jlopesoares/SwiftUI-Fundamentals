//
//  OrderView.swift
//  Appetizers
//
//  Created by João Pedro on 29/09/2023.
//

import SwiftUI

struct OrderView: View {
    
    @State private var orderItems: [Appetizer] =  MockData.orderItems
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack {
                    List{
                        ForEach(orderItems) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .listStyle(PlainListStyle())
                    
                    Button {
                        print("Order place")
                    } label: {
                        APButton(title: "$99.99 - Place Order")
                    }
                    .padding(.bottom, 24)

                }
                
                if orderItems.isEmpty {
                    EmptyStateView(imageName: "empty-order",
                                   message: "You have no items in your order. \nPlease add an appetizer!")
                }
            }
            .navigationTitle("🧾 Orders")
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        orderItems.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
