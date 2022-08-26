//
//  RectangleCell.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 26.08.2022..
//

import UIKit

class RectangleCell: UICollectionViewCell {
    
    static let identifier = "rectangleCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setColor(r: Int, g: Int, b: Int){
        contentView.backgroundColor = UIColor(red: CGFloat(Float(r)/255.0), green: CGFloat(Float(g)/255.0), blue: CGFloat(Float(b)/255.0), alpha: 1.0)
    }
}
