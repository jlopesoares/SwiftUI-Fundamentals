//
//  FrameWorkTitleView.swift
//  Apple-Frameworks
//
//  Created by João Pedro Soares on 27/09/2023.
//

import SwiftUI

struct FrameworkTitleView: View {
    let framework: Framework
    
    var body: some View {
        VStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 90, height: 90)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.medium)
                .scaledToFit()
                .minimumScaleFactor(0.7)
        }
        .padding()
    }
}
struct FrameworkTitleView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkTitleView(framework: MockData.sampleFramework)
    }
}
