//
//  proyectouno.swift
//  ProyectoFinal
//
//  Created by Juan on 20/04/20.
//  Copyright © 2020 usuario. All rights reserved.
//

import Foundation

import SwiftUI
import CoreData

struct proyectouno: View {
    @State private var textValue = ""
     @State private var updateRowID: NSManagedObjectID? 
     @State private var updateRowValue = ""
     @State private var isUpdate = false
     @ObservedObject private var datas = coreDataController
     
   var body: some View {
            VStack {
                List {
                    ForEach(datas.data){ data in
                        HStack {
                            Button(action: {
                                self.isUpdate = true
                                print(data.id)
                                self.updateRowID = data.id
                                self.updateRowValue = data.text
                            }) {
                                Text(data.text)
                            }
                        }
                    }.onDelete { (index) in
                        coreDataController.deleteData(id: self.datas.data[index.first!].id,index: index)
                    }
                }
                self.isUpdate ? Text("El Valor ( \(updateRowValue) ) se cambiara") : nil
                HStack {
                    Spacer()
                    TextField("Ingresar Registro ", text: $textValue).textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        self.doButton()
                    }) {
                        Text("Enviar")
                    }
                    Spacer()
                }
            }
        }
        
        func doButton() {
            self.isUpdate ? coreDataController.updateData(id: updateRowID!,txt: self.textValue) : coreDataController.createData(msg1: self.textValue)
            self.isUpdate = false
            self.textValue = ""
        }
    }

