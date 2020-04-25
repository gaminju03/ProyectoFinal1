//
//  ContentView.swift
//  ProyectoFinal
//
//  Created by Juan on 20/04/20.
//  Copyright © 2020 usuario. All rights reserved.
//


import SwiftUI

struct ContentView: View {
    var body: some View {
            NavigationView{
                List{
                    NavigationLink(destination: proyectouno()){
                        HStack{
                            Image("img1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80.0, height: 100.0)
                            Text("Crud CoreData")
                        }
                    }
                    NavigationLink(destination: proyectodos()){
                        HStack{
                            Image("img2")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80.0, height: 100.0)
                            Text("Json consulta")
                        }
                    }
                    NavigationLink(destination: proyectotres()){
                        HStack{
                            Image("img3")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80.0, height: 100.0)
                            Text("Pedidos realizados")
                        }
                    }
                }.navigationBarTitle(Text("AppBeer API"))
            }
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
}
