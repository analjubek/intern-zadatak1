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
    
    var randomInt = Int.random(in: 0..<256)
    
    var numberOfTaps = 0
    var indexPath1: IndexPath?
    var indexPath2: IndexPath?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("height")
        //print(cvHeight)
        print(cvRectangles.frame.height)
        print("width")
        //print(cvWidth)
        print(cvRectangles.frame.width)

        makeCollection(rectangle: rectangle!)
        
        var gesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let colorsData = ColorLoader().colorData
        //print("colorsData")
        //print(colorsData)
        //var cvHeight = Int(sizeView.bounds.height)
        //var cvWidth = Int(sizeView.bounds.width)
        
        //override viewDidAppear
    }
    
    //za promjenu veličine
    /*override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        cvRectangles.frame = sizeView.bounds
    }*/
    
    func makeCollection(rectangle: Rectangle){
        guard let sourcesURL = Bundle.main.url(forResource: "colorData", withExtension: "json") else{
            fatalError("could not found colorData.json")
        }

        guard let colorData = try? Data(contentsOf: sourcesURL) else{
            fatalError("could not convert data")
        }

        let decoder = JSONDecoder()
        guard let colors = try? decoder.decode(Colors.self, from: colorData) else{
            fatalError("there was problem decoding the data")
        }

        print(colors.colors)
        
        // preko url sessiona fetchat podatke i dekodirati ih
        // grana local i remote fetch --> novi branch
    
        
        let flowLayout = UICollectionViewFlowLayout()

        flowLayout.itemSize = CGSize(width: (cvRectangles.frame.width/CGFloat(rectangle.horizontalEdge))-5, height: (cvRectangles.frame.height/CGFloat(rectangle.verticalEdge))-5)
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
    
    @IBAction func btnChangeColor(_ sender: UIButton) {
        randomInt = Int.random(in: 0..<256)
        print("randomInt")
        print(randomInt)
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
        cell.backgroundColor = .purple
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
    /*func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    // Logic when cell is selected
    }*/
    /*func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }*/

}
