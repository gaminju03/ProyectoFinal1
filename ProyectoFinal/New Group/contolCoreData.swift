//
//  contolCoreData.swift
//  ProyectoFinal
//
//  Created by Juan on 20/04/20.
//  Copyright © 2020 usuario. All rights reserved.
//

import SwiftUI
import Combine
import CoreData

let coreDataController = CoreDataController()
let Nombre_CoreData = "Notas"
let Nombre_Nota = "texto"

class CoreDataController: ObservableObject {
    let context: NSManagedObjectContext
    @Published var data = [CoreDataType]()
    
    init() {
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        readData()
    }
    
    func createData(msg1:String) {
        let entity = NSEntityDescription.insertNewObject(forEntityName: Nombre_CoreData, into: context)
        entity.setValue(msg1, forKey: Nombre_Nota)
        do{
            try context.save()
            print("Crear nuevo Registro")
            data.append(CoreDataType(id: entity.objectID, text: msg1))
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    func readData() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: Nombre_CoreData)
        
        do{
            let fetch = try context.fetch(request)
            for i in fetch as! [NSManagedObject]{
                self.data.append(CoreDataType(id: i.objectID, text: i.value(forKey: Nombre_Nota) as! String))
            }
            print("Leer Registro")
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    func deleteData(id : NSManagedObjectID, index: IndexSet) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: Nombre_CoreData)
        
        do{
            let fetch = try context.fetch(request)
            for i in fetch as! [NSManagedObject]{
                if i.objectID == id{
                    try context.execute(NSBatchDeleteRequest(objectIDs: [id]))
                    self.data.remove(atOffsets: index)
                    print("Se elimino Registro")
                }
            }
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    func updateData(id:NSManagedObjectID ,txt: String) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: Nombre_CoreData)
        do {
            let fetch = try context.fetch(request) as! [NSManagedObject]
            for index in fetch.indices{
                if fetch[index].objectID == id{
                    fetch[index].setValue(txt, forKey: Nombre_Nota)
                    self.data[index].text = txt
                    try context.save()
                    print("Actualizo dato")
                }
            }
        } catch {
            print(error)
        }
    }
}


struct contolCoreData_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
