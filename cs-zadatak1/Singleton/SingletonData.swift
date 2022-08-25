//
//  Singleton.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 25.08.2022..
//

import Foundation
import UIKit
import SwiftUI
import CoreData

class SingletonData {
    static let shared = SingletonData()
    
    var colors: [ColorJSON] = []
    
    private init(){
        //e neces
    }
    
    public func start(){
        LoadJSON().loadJsonFromUrl(url: "https://jonasjacek.github.io/colors/data.json", dataModel: colors){ colors in
            DispatchQueue.main.async {
                SingletonData.shared.saveJsonToCoreData(colors: colors)
            }
        }
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func saveColorToCoreData(id: Int, r: Int, g: Int, b: Int){
        let context = persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "CoreColor", in: context)!
          
        let color = NSManagedObject(entity: entity, insertInto: context)
        
        color.setValue(id, forKeyPath: "id")
        color.setValue(r, forKey: "r")
        color.setValue(g, forKey: "g")
        color.setValue(b, forKey: "b")
          
        do {
            try context.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func saveJsonToCoreData(colors: [ColorJSON]){
        for color in colors{
            self.saveColorToCoreData(id: color.colorID, r: color.rgb.r, g: color.rgb.g, b: color.rgb.b)
        }
    }
    
    func fetchColorsFromCoreData() -> [NSManagedObject]?{
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CoreColor")
        
        do {
            return try context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return nil
        }
    }
    
    func fetchColorByIdFromCoreData(colorId: Int) -> Rgb{
        let context = persistentContainer.viewContext
        var rgb = Rgb(r: -1, g: -1, b: -1)
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CoreColor")
        
        do {
            let coreColors = try context.fetch(fetchRequest)
            rgb.r = (coreColors[colorId].value(forKey: "r") as? Int)!
            rgb.g = (coreColors[colorId].value(forKey: "g") as? Int)!
            rgb.b = (coreColors[colorId].value(forKey: "b") as? Int)!
            
            return rgb
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return rgb
        }
    }
    
    func deleteAllCoreData(entity: String){
        let context = persistentContainer.viewContext
        let ReqVar = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        let DelAllReqVar = NSBatchDeleteRequest(fetchRequest: ReqVar)
        do { try context.execute(DelAllReqVar) }
        catch { print(error) }
    }
}
