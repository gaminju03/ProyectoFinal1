//
//  PostListModel.swift
//  ProyectoFinal
//
//  Created by Juan on 21/04/20.
//  Copyright © 2020 usuario. All rights reserved.
//

import Foundation

class PostListViewModel: ObservableObject {
   @Published  var posts = [PostViewModel]()
    
    init() {
        Webservices().getPosts { posts in
            if let posts = posts {
                 self.posts = posts.map(PostViewModel.init)
            }
           
        }
    }
}

struct PostViewModel {
    var  post : Post
    init(post:Post) {
        self.post = post
    }
    
    var id : Int{
           return self.post.id
       }
    var name : String{
        return self.post.name
    }
    var description : String{
         return self.post.description
    }
    var image_url : String{
            return self.post.image_url
       }
    
}
