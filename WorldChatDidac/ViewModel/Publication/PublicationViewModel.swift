//
//  FeedViewModel.swift
//  WorldChatDidac
//
//  Created by Dídac Edo Gibert on 24/4/21.
//

import SwiftUI

class PublicationViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        fetchPosts()
    }
    
    func fetchPosts() {
        COLLECTION_POSTS.order(by: "timestamp", descending: true).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap({ try? $0.data(as: Post.self)})
        }
    }
}
