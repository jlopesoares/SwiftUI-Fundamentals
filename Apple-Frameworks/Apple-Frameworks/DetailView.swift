//
//  DetailView.swift
//  Apple-Frameworks
//
//  Created by João Pedro Soares on 25/09/2023.
//

import SwiftUI

struct DetailView: View {
    
    var framework: Framework
    
    var body: some View {
        VStack {
            
            HStack{
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color(.label))
                        .imageScale(.large)
                        .frame(width: 24, height: 24)
                }
            }
            .padding()
            
            Spacer()
            FrameworkTitleView(framework: framework)
            
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button {
                
            } label: {
                AFButton(title: "Learn More")
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(framework: MockData.sampleFramework)
            .preferredColorScheme(.dark)
    }
}