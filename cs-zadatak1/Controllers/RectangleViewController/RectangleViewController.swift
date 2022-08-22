//
//  RectangleViewController.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 11.08.2022..
//

import Foundation
import UIKit
import SwiftUI
import CoreData

class RectangleViewController: UIViewController {
    
    var rectangle: Rectangle?
    let cellId = "cellId"
    
    @IBOutlet weak var cvRectangles: UICollectionView!
    
    @IBOutlet weak var sizeView: UIView!
    
    let flowLayout = UICollectionViewFlowLayout()
    
    var randomInt: Int!
    
    var r: Int!
    var g: Int!
    var b: Int!
    
    var colors: [ColorJSON] = []
    
    var selectedItems: [IndexPath] = []

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var coreColors: [NSManagedObject]?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        fetchColorsFromCore()
        
        if(self.coreColors == []){
            loadJsonFromUrl(url: "https://jonasjacek.github.io/colors/data.json", dataModel: colors){ colors in
                DispatchQueue.main.async {
                    self.colors = colors
                    self.saveJsonToCore()
                    self.makeCollection(rectangle: self.rectangle!)
                }
            }
        }
        else{
            self.makeCollection(rectangle: self.rectangle!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: nil) { _ in
            self.changeItemSize()
        }
    }
    
    func saveColorToCore(id: Int, r: Int, g: Int, b: Int){
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
    
    func saveJsonToCore(){
        for color in colors{
            self.saveColorToCore(id: color.colorID, r: color.rgb.r, g: color.rgb.g, b: color.rgb.b)
        }
    }
    
    func fetchColorsFromCore(){
        let fetchRequest =
          NSFetchRequest<NSManagedObject>(entityName: "CoreColor")
        
        do {
            self.coreColors = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func fetchColorByIdFromCore(colorId: Int){
        let fetchRequest =
          NSFetchRequest<NSManagedObject>(entityName: "CoreColor")
        
        do {
            coreColors = try context.fetch(fetchRequest)
            r = coreColors?[colorId].value(forKey: "r") as? Int
            g = coreColors?[colorId].value(forKey: "g") as? Int
            b = coreColors?[colorId].value(forKey: "b") as? Int
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func deleteAllData(entity: String)
    {
        let ReqVar = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        let DelAllReqVar = NSBatchDeleteRequest(fetchRequest: ReqVar)
        do { try context.execute(DelAllReqVar) }
        catch { print(error) }
    }
    
    func makeCollection(rectangle: Rectangle){
        self.changeItemSize()
        self.flowLayout.minimumLineSpacing = 5
        self.flowLayout.minimumInteritemSpacing = 5
        
        self.cvRectangles.collectionViewLayout = self.flowLayout
        self.cvRectangles.register(UICollectionViewCell.self, forCellWithReuseIdentifier: self.cellId)
        self.cvRectangles.dataSource = self
        self.cvRectangles.delegate = self
        self.cvRectangles.frame = self.sizeView.bounds
    }
    
    func changeItemSize(){
        flowLayout.itemSize = CGSize(width: (cvRectangles.frame.width/CGFloat(rectangle!.horizontalEdge))-5, height: (cvRectangles.frame.height/CGFloat(rectangle!.verticalEdge))-5)
    }
    
    func replaceCells(indexPath1: IndexPath, indexPath2: IndexPath){
        if(indexPath1 != indexPath2){
            cvRectangles.performBatchUpdates {
                self.cvRectangles.moveItem(at: indexPath1, to: indexPath2)
            } completion: { bool in
                let row: Int
                if (indexPath1.row < indexPath2.row){
                    row = (indexPath2.row-1)
                }
                else{
                    row = (indexPath2.row+1)
                }
                let indexPath = IndexPath(row: row, section: 0)
                self.cvRectangles.moveItem(at: indexPath, to: indexPath1)
                
                let cell1 = self.cvRectangles.cellForItem(at: indexPath1)
                cell1?.layer.borderWidth = 0.0
                let cell2 = self.cvRectangles.cellForItem(at: indexPath2)
                cell2?.layer.borderWidth = 0.0
            }
        }
        else{
            let cell1 = self.cvRectangles.cellForItem(at: indexPath1)
            cell1?.layer.borderWidth = 0.0
        }
    }
    
    @IBAction func btnChangeColor(_ sender: UIButton) {
        if(!selectedItems.isEmpty){
            let cell1 = self.cvRectangles.cellForItem(at: selectedItems[0])
            cell1?.layer.borderWidth = 0.0
            selectedItems.removeAll()
        }
        cvRectangles.reloadData()
    }
}

extension RectangleViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (rectangle!.horizontalEdge * rectangle!.verticalEdge)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        randomInt = Int.random(in: 0..<256)
        fetchColorByIdFromCore(colorId: randomInt)
        
        cell.backgroundColor = UIColor(red: CGFloat(Float(r.self)/255.0), green: CGFloat(Float(g.self)/255.0), blue: CGFloat(Float(b.self)/255.0), alpha: 1.0)
        return cell
    }
}

extension RectangleViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (selectedItems.count < 2){
            selectedItems.append(indexPath)
            
            let cell = collectionView.cellForItem(at: indexPath)
            cell?.layer.borderWidth = 2.0
            cell?.layer.borderColor = UIColor.blue.cgColor
        }
        if (selectedItems.count == 2){
            let indexPath1 = selectedItems[0]
            let indexPath2 = selectedItems[1]
            
            replaceCells(indexPath1: indexPath1, indexPath2: indexPath2)
            selectedItems.removeAll()
        }
    }
}



