//
//  LargeSpaceNewsCellView.swift
//  Supernova
//
//  Created by Henrique Marques on 23/08/22.
//

import UIKit

class LargeSpaceNewsCellView: UIView {
    
    lazy var imageNewsImageView: UIImageView = {
        let defaultImage = UIImage(named: "loading_img")
        let imageView = UIImageView(image: defaultImage)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var titleNewsLabel: UILabel = {
        let label = UILabel()
        label.text = "Teste"
        label.textAlignment = .center
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
//        self.setUpImageViewConstraintsLayout()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpUIElements()
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setUpImageViewConstraintsLayout() {
        NSLayoutConstraint.activate([
        
            self.imageNewsImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            self.imageNewsImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            self.imageNewsImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            
        ])
    }
    
    
    private func setUpImageNewsImageViewConstraints() {
        self.imageNewsImageView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
//            make.left.equalTo(self.snp.left).offset(30)
            make.centerX.equalTo(self.snp.centerX)
            make.height.equalTo(200)
            make.width.equalTo(300)
        }
    }
    
    private func setUpTitleNewsLabelConstraints() {
        self.titleNewsLabel.snp.makeConstraints { make in
            make.top.equalTo(self.imageNewsImageView.snp.top).offset(100)
            make.height.equalTo(150)
            make.centerX.equalTo(self.snp.centerX)
        }
    }

}
