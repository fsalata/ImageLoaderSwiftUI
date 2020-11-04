//
//  ContentView.swift
//  ImageLoaderSwiftUI
//
//  Created by Fábio Salata on 04/11/20.
//

import SwiftUI

struct ContentView: View {
    let imagesURL = ["https://source.unsplash.com/random",
                     "https://source.unsplash.com/user/erondu",
                     "https://source.unsplash.com/user/hipses"]
    
    var body: some View {
        List(imagesURL, id: \.self) { imageURL in
            URLImage(url: imageURL, placeholder: "placeholder")
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
