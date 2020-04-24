//
//  proyectotres.swift
//  ProyectoFinal
//
//  Created by Juan on 20/04/20.
//  Copyright © 2020 usuario. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData
import SDWebImageSwiftUI

struct proyectotres: View {
 @Environment(\.managedObjectContext) var dbContext//interacion con coredata
    @State private var showOrderSheet = false
  //select
@FetchRequest(entity: Pedido.entity(),//realiza solicitudes
    sortDescriptors:[NSSortDescriptor(key: "titulo", ascending: true)]//busqueda orneda
           /*predicate: NSPredicate(format: "detalle", Status.completed.rawValue)*/
    ) var orders:FetchedResults<Pedido>//extrae
    
    var body: some View {
             NavigationView{
                
             List{  //conjunto de objetos
                ForEach(orders, id: \.self) { post in //iterando al id
               HStack {
                VStack(alignment: .center){
                          WebImage(url:URL(string: post.imagen)).resizable().frame(width: 50, height: 100, alignment: (.center))
                           Text(post.titulo).font(.title)
                       }
                }
                }.onDelete { indexSet in
                    for index in indexSet {
                        self.dbContext.delete(self.orders[index])
                    }
                }
                
             }.navigationBarTitle("My Orders")
                
           
        }
    }
}
