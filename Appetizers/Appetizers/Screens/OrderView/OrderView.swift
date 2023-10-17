//
//  OrderView.swift
//  Appetizers
//
//  Created by João Pedro on 29/09/2023.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack {
                    List{
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(PlainListStyle())
                    
                    Button {
                        print("Order place")
                    } label: {
                        APButton(title: "$\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .padding(.bottom, 24)

                }
                
                if order.items.isEmpty {
                    EmptyStateView(imageName: "empty-order",
                                   message: "You have no items in your order. \nPlease add an appetizer!")
                }
            }
            .navigationTitle("🧾 Orders")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
