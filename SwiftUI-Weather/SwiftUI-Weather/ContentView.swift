//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by João Pedro Soares on 19/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .white]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Cuppertino, CA")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                
                VStack(spacing: 8) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    
                    Text("76º")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                HStack(spacing: 16) {
                    VStack(spacing: 8) {
                        Text("Tue".uppercased())
                            .font(.system(size: 24, weight: .medium))
                            .foregroundColor(.white)
                        Image(systemName: "cloud.sun.fill")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                        Text("76º")
                            .font(.system(size: 28, weight: .medium))
                            .foregroundColor(.white)
                    }
                    VStack(spacing: 8) {
                        Text("Wed".uppercased())
                            .font(.system(size: 24, weight: .medium))
                            .foregroundColor(.white)
                        Image(systemName: "sun.max.fill")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                        Text("76º")
                            .font(.system(size: 28, weight: .medium))
                            .foregroundColor(.white)
                    }
                    VStack(spacing: 8) {
                        Text("Thu".uppercased())
                            .font(.system(size: 24, weight: .medium))
                            .foregroundColor(.white)
                        Image(systemName: "cloud.sun.fill")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                        Text("76º")
                            .font(.system(size: 28, weight: .medium))
                            .foregroundColor(.white)
                    }
                    VStack(spacing: 8) {
                        Text("Fry".uppercased())
                            .font(.system(size: 24, weight: .medium))
                            .foregroundColor(.white)
                        Image(systemName: "cloud.sun.fill")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                        Text("76º")
                            .font(.system(size: 28, weight: .medium))
                            .foregroundColor(.white)
                    }
                    VStack(spacing: 8) {
                        Text("Sat".uppercased())
                            .font(.system(size: 24, weight: .medium))
                            .foregroundColor(.white)
                        Image(systemName: "cloud.sun.fill")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                        Text("76º")
                            .font(.system(size: 28, weight: .medium))
                            .foregroundColor(.white)
                    }
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
