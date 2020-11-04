//
//  URLImage.swift
//  ImageLoaderSwiftUI
//
//  Created by Fábio Salata on 04/11/20.
//

import SwiftUI

struct URLImage: View {
    let url: String
    let placeholder: String
    
    @ObservedObject var imageLoader = ImageLoader()
    
    init(url: String, placeholder: String) {
        self.url = url
        self.placeholder = placeholder
        
        imageLoader.downloadImage(from: url)
    }
    
    var body: some View {
        if let data = self.imageLoader.downloadedImageData {
            return Image(uiImage: UIImage(data: data)!).resizable()
        } else {
            return Image(placeholder).resizable()
        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "https://fyrafix.files.wordpress.com/2011/08/url-8.jpg", placeholder: "Placeholder")
    }
}
