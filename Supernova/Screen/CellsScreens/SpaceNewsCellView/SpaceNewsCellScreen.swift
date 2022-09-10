//
//  SpaceNewsCellView.swift
//  Supernova
//
//  Created by Henrique Marques on 22/08/22.
//

import UIKit

class SpaceNewsCellScreen: UIView {
    
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
        label.text = "Error"
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionNewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Error"
        label.textAlignment = .left
        label.numberOfLines = 4
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()

    
    private func setUpUIElements() {
        self.addSubview(self.titleNewsLabel)
        self.addSubview(self.imageNewsImageView)
        self.addSubview(self.descriptionNewsLabel)
    }
    
    private func setUpConstraints() {
        self.setUpTitleNewsLabelConstraints()
        self.setUpImageNewsImageViewConstraints()
        self.setUpSummaryNewsLabelConstraints()
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
            make.top.equalTo(self.imageNewsImageView.snp.top).offset(-25)
            make.left.equalTo(self.imageNewsImageView.snp.right).offset(15)
            make.height.equalTo(100)
            make.width.equalTo(250)
        }
    }
    
    private func setUpSummaryNewsLabelConstraints() {
        self.descriptionNewsLabel.snp.makeConstraints { make in
            make.top.equalTo(self.titleNewsLabel.snp.top).offset(50)
            make.left.equalTo(self.titleNewsLabel.snp.left)
            make.height.equalTo(100)
            make.width.equalTo(270)

        }
    }
}
