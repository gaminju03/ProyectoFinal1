//
//  Pedido+CoreDataProperties.swift
//  ProyectoFinal
//
//  Created by Juan on 22/04/20.
//  Copyright © 2020 usuario. All rights reserved.
//
//

import Foundation
import CoreData


extension Pedido {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pedido> {
        return NSFetchRequest<Pedido>(entityName: "Pedido")
    }

    @NSManaged public var id: UUID
    @NSManaged public var titulo: String
    @NSManaged public var detalle: String
    @NSManaged public var imagen: String

}
