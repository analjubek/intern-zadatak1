//
//  RectangleViewController.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 11.08.2022..
//

import Foundation
import UIKit
import SwiftUI

class RectangleViewController: UIViewController {
    
    var rectangle: Rectangle?
    let cellId = "cellId"
    
    @IBOutlet weak var cvRectangles: UICollectionView!
    
    @IBOutlet weak var sizeView: UIView!
    
    let flowLayout = UICollectionViewFlowLayout()
    
    var randomInt = Int.random(in: 0..<256)
    var r = 255
    var g = 50
    var b = 50
    var colors: [ColorJSON] = []
    
    var numberOfTaps = 0
    var indexPath1: IndexPath?
    var indexPath2: IndexPath?
    var indexPath: IndexPath?
    var selectedItems: [IndexPath] = []
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        makeCollection(rectangle: rectangle!)
        var gesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func makeCollection(rectangle: Rectangle){
        
        loadJSON() // completion funkcije --> kad se izvrsi, izvrsiti sve ostalo
        
        changeItemSize()
        flowLayout.minimumLineSpacing = 5
        flowLayout.minimumInteritemSpacing = 5
        
        
        cvRectangles.collectionViewLayout = flowLayout
        cvRectangles.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        cvRectangles.dataSource = self
        cvRectangles.delegate = self
        cvRectangles.frame = sizeView.bounds
    
    }
    
    func changeItemSize(){
        flowLayout.itemSize = CGSize(width: (cvRectangles.frame.width/CGFloat(rectangle!.horizontalEdge))-5, height: (cvRectangles.frame.height/CGFloat(rectangle!.verticalEdge))-5)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: nil) { _ in
            self.changeItemSize()
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
    
    func loadJSON(){
        guard let url = URL(string: "https://jonasjacek.github.io/colors/data.json") else{
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request){
            (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data else{
                return
            }
            let decoder = JSONDecoder()
            guard let decodedData = try? decoder.decode([ColorJSON].self, from: data) else{
                return
            }
            
            self.colors = decodedData
        }.resume()
    }
    
    func getColorById(colorId: Int){
        for color in colors{
            if (color.colorID == colorId){
                self.r = color.rgb.r
                self.g = color.rgb.g
                self.b = color.rgb.b
            }
        }
    }
    
    @objc func handleTapGesture(_ gesture: UITapGestureRecognizer){
        let targetIndexPath = cvRectangles!.indexPathForItem(at: gesture.location(in: cvRectangles))
        print("tap1")
        if numberOfTaps == 0 && gesture.state == .ended{
            indexPath1 = targetIndexPath
            numberOfTaps = 1
            print("tap")
        }
        if numberOfTaps == 1 && gesture.state == .ended {
            indexPath2 = targetIndexPath
            numberOfTaps = 0
        }
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
        getColorById(colorId: randomInt)
        
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



