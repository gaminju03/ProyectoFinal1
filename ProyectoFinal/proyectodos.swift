//
//  proyectodos.swift
//  ProyectoFinal
//
//  Created by Juan on 20/04/20.
//  Copyright © 2020 usuario. All rights reserved.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct proyectodos: View {
    @ObservedObject private var postListML = PostListViewModel()
   
     var body: some View {
        
        
        
         List(self.postListML.posts, id: \.id){ post in
             VStack(alignment: .center){
                WebImage(url:URL(string: post.image_url)).resizable().frame(width: 150, height: 350, alignment: (.center))
                 Text(post.name).font(.title)
                  Text(post.description)
                 
                
             }
            
         }
     }
}
