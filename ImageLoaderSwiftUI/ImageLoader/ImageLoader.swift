//
//  ImageLoader.swift
//  ImageLoaderSwiftUI
//
//  Created by Fábio Salata on 04/11/20.
//

import Foundation
import Combine

class ImageLoader: ObservableObject {
    @Published var downloadedImageData: Data?
    
    var session: AnyCancellable?
    
    func downloadImage(from url: String) {
        guard let imageURL = URL(string: url) else {
            return
        }
        
        session = URLSession.shared.dataTaskPublisher(for: imageURL)
            .map { $0.data }
            .replaceError(with: nil)
            .receive(on: RunLoop.main)
            .assign(to: \.downloadedImageData, on: self)
    }
}
