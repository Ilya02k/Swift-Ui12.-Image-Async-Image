//
//  ContentView.swift
//  swift ui 12
//
//  Created by Ann Dosova on 20.05.24.
//

import SwiftUI

struct ContentView: View {
    let image = UIImage(named: "water-wheel") ?? UIImage()
    
    var body: some View {
        VStack {
            backgroundImageView
            logoImageView
                //.padding(.top)
                .offset(y: -50)
            Text("Water wheel")
                .foregroundStyle(.white)
                .fontWeight(.bold)
            asyncImageView
            Spacer()
            
        }
        .frame(width: UIScreen.main.bounds.width)
        .background(
            VStack {
                LinearGradient(colors: [Color.purple, Color.purple.opacity(0.2)], startPoint: .top, endPoint: .bottom)
            })
        .ignoresSafeArea(.all)
    }
    
    var logoImageView: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(.white, lineWidth: 4))
            .shadow(radius: 7)
            
    }
    
    var backgroundImageView: some View {
        Image("background")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.main.bounds.width)
            .ignoresSafeArea(.all, edges: .top)
    }
    var asyncImageView: some View {
        AsyncImage(url: URL(string: "https://10wallpaper.com/wallpaper/1280x1024/1107/Luxury_cars_-_Aston_Martin_Wallpaper_05_1280x1024.jpg")) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .accentColor(.accentColor)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .cornerRadius(25)
            case .failure(let error):
                VStack {
                    Image(systemName: "questionmark")
                    Text(error.localizedDescription)
                        .font(.headline)
                }
            @unknown default:
                fatalError()
            }
        }
    }
}

#Preview {
    ContentView()
}
