//
//  RectangleViewController.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 11.08.2022..
//

import Foundation
import UIKit

class RectangleViewController: UIViewController {
    
    var rectangle: Rectangle?
    let cellId = "cellId"
    
    @IBOutlet weak var cvRectangles: UICollectionView!
    
    @IBOutlet weak var sizeView: UIView!
    
    let flowLayout = UICollectionViewFlowLayout()
    
    var randomInt = Int.random(in: 0..<256)
    var r = 255
    var g = 90
    var b = 50
    var colors: [ColorJSON] = []
    
    var numberOfTaps = 0
    var indexPath1: IndexPath?
    var indexPath2: IndexPath?
    var indexPath: IndexPath?
    //var selectedItems: []
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        makeCollection(rectangle: rectangle!)
        
        var gesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func makeCollection(rectangle: Rectangle){
        loadJSON()
        
        changeItemSize()
        flowLayout.minimumLineSpacing = 5
        flowLayout.minimumInteritemSpacing = 5
        
        
        cvRectangles.collectionViewLayout = flowLayout
        cvRectangles.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        cvRectangles.dataSource = self
        cvRectangles.delegate = self

        cvRectangles.frame = sizeView.bounds
        
        print("horizontal edge: " + String(rectangle.horizontalEdge))
        print("vertical edge: " + String(rectangle.verticalEdge))
        
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
        randomInt = Int.random(in: 0..<256)
        getColorById(colorId: randomInt)
        cvRectangles.reloadData()
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
        cell.backgroundColor = UIColor(red: CGFloat(Float(r.self)/255.0), green: CGFloat(Float(g.self)/255.0), blue: CGFloat(Float(b.self)/255.0), alpha: 1.0)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        //let item cell.r
        
        /*let helperIndexPath: IndexPath
        helperIndexPath = sourceIndexPath
        sourceIndexPath = destinationIndexPath
        destinationIndexPath = helperIndexPath*/
    }
}

extension RectangleViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderWidth = 2.0
        cell?.layer.borderColor = UIColor.blue.cgColor
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderWidth = 0.0
    }
    /*func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }*/
}
/*
extension RectangleViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let row = indexPath.row + 1
        return CGSize(width: row * 10, height: row * 10)
    }
}*/
