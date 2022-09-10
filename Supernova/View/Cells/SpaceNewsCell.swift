//
//  SpaceNewsCell.swift
//  Supernova
//
//  Created by Henrique Marques on 22/08/22.
//

import UIKit

class SpaceNewsCell: UITableViewCell {
    
    static let identifier: String = "SpaceNewsCell"
    var viewModel:  SpaceNewsCellViewModel?
    

    // 1 adicionar view
    
    let spaceNewsCellView: SpaceNewsCellScreen = SpaceNewsCellScreen()
        
    // 2 método para adicionar
    
    private func setUpSubView() {
        self.spaceNewsCellView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(spaceNewsCellView)
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .black
        self.setUpSubView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Init é direto no método
    
    func prepareSpaceCell(model: SpaceflightElement) {
        self.viewModel = SpaceNewsCellViewModel(objc: model)
        self.spaceNewsCellView.titleNewsLabel.text = self.viewModel?.title
        self.spaceNewsCellView.descriptionNewsLabel.text = self.viewModel?.summary
        DispatchQueue.global().async {
            if let image = URL(string: self.viewModel!.urlPhoto) {
                do {
                    let data = try Data(contentsOf: image)
                    let img = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.spaceNewsCellView.imageNewsImageView.image = img
                    }
                } catch {
                    print("Error trying to decode image")
                }
            }
        }
    }
    
}
