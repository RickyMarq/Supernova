//
//  SpaceNewsCell.swift
//  Supernova
//
//  Created by Henrique Marques on 22/08/22.
//

import UIKit

class SpaceNewsCell: UITableViewCell {
    
    static let identifier: String = "SpaceNewsCell"

    // 1 adicionar view
    
    let spaceNewsCellView: SpaceNewsCellView = SpaceNewsCellView()
        
    // 2 método para adicionar
    
    private func setUpSubView() {
        self.spaceNewsCellView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(spaceNewsCellView)
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpSubView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
