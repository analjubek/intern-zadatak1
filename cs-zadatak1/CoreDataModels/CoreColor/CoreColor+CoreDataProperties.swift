//
//  CoreColor+CoreDataProperties.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 22.08.2022..
//
//

import Foundation
import CoreData


extension CoreColor {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreColor> {
        return NSFetchRequest<CoreColor>(entityName: "CoreColor")
    }

    @NSManaged public var id: Int16
    @NSManaged public var r: Int16
    @NSManaged public var g: Int16
    @NSManaged public var b: Int16

}

extension CoreColor : Identifiable {

}
