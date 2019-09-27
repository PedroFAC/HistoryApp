//
//  CheckCollectionViewCell.swift
//  HistoryApp
//
//  Created by aluno on 18/09/19.
//  Copyright © 2019 aluno. All rights reserved.
//

import UIKit

class CheckCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var text: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 6.0
        layer.masksToBounds = true
    }

}
