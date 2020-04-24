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
     @Environment(\.managedObjectContext) var dbContext //conexion
    @ObservedObject private var postListML = PostListViewModel() //
   
     var body: some View {
        
         List(self.postListML.posts, id: \.id){ post in //conjunto de objetos 
             VStack(alignment: .center){
                WebImage(url:URL(string: post.image_url)).resizable().frame(width: 120, height: 350, alignment: (.center))
                 Text(post.name).font(.title)
                  Text(post.description)
                
                 Button(action: {
                    let orden = Pedido(context: self.dbContext)//
                    orden.id = UUID() //autoincremental id
                    orden.titulo = post.name
                    orden.imagen = post.image_url
                    orden.detalle = post.description
                    try? self.dbContext.save()  //guarda
                    //alerta
                 }) {
                    Text("Ordenar").foregroundColor(.blue)
                                       }
                 
                
             }
            
         }
     }
}
