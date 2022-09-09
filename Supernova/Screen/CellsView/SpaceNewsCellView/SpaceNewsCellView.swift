//
//  SpaceNewsCellView.swift
//  Supernova
//
//  Created by Henrique Marques on 22/08/22.
//

import UIKit

class SpaceNewsCellView: UIView {
    
    lazy var imageNewsImageView: UIImageView = {
        let defaultImage = UIImage(named: "loading")
        let imageView = UIImageView(image: defaultImage)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var titleNewsLabel: UILabel = {
        let label = UILabel()
        label.text = "Teste"
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    private func setUpUIElements() {
        self.addSubview(self.titleNewsLabel)
        self.addSubview(self.imageNewsImageView)
    }
    
    private func setUpConstraints() {
        self.setUpTitleNewsLabelConstraints()
        self.setUpImageNewsImageViewConstraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpUIElements()
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setUpImageNewsImageViewConstraints() {
        self.imageNewsImageView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            make.left.equalTo(self.snp.left).offset(20)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
    }
    
    private func setUpTitleNewsLabelConstraints() {
        self.titleNewsLabel.snp.makeConstraints { make in
            make.top.equalTo(self.imageNewsImageView.snp.top)
            make.left.equalTo(self.imageNewsImageView.snp.right).offset(30)
            make.height.equalTo(100)
            make.width.equalTo(200)
        }
    }
}
