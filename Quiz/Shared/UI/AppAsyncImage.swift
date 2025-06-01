//
//  ImageLoader.swift
//  Quiz
//
//  Created by Anton Kuznetsov on 01.06.2025.
//

import SwiftUI

struct AppAsyncImage: View {
    
    let url: URL?
    var width: CGFloat = 108
    var height: CGFloat = 122
    
    @StateObject private var imageLoader = ImageLoader()
    
    var body: some View {
        ZStack {
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: width, height: height)
                    .clipped()
            } else {
                Image("style_placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: width, height: height)
                    .clipped()
            }
            
        }
        .onAppear {
            imageLoader.load(from: url)
        }
    }
}

class ImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    
    private static let imageCache = URLCache(
        memoryCapacity: 20 * 1024 * 1024,
        diskCapacity: 100 * 1024 * 1024,
        diskPath: "imageCache"
    )
    
    private var dataTask: URLSessionDataTask?
    
    func load(from url: URL?) {
        guard let url = url else { return }
        
        let request = URLRequest(url: url)
        
        if let cachedResponse = Self.imageCache.cachedResponse(for: request),
           let image = UIImage(data: cachedResponse.data) {
            self.image = image
            return
        }
        
        dataTask?.cancel() // if there are any old tasks
        
        dataTask = URLSession.shared.dataTask(with: request) { [weak self] data, response, _ in
            guard let self = self,
                  let data = data,
                  let response = response,
                  let image = UIImage(data: data) else { return }
            
            let cachedData = CachedURLResponse(response: response, data: data)
            Self.imageCache.storeCachedResponse(cachedData, for: request)
            
            DispatchQueue.main.async {
                self.image = image
            }
        }
        dataTask?.resume()
    }
    
    deinit {
        dataTask?.cancel() // to prevent any troubles
    }
}
