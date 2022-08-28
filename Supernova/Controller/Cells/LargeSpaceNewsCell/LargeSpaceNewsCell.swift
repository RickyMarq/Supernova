//
//  LargeSpaceNewsCell.swift
//  Supernova
//
//  Created by Henrique Marques on 23/08/22.
//

import UIKit

class LargeSpaceNewsCell: UITableViewCell {
    
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


    static let identifier: String = "LargeSpaceNewsCell"

    let largeSpaceNewsCellView: LargeSpaceNewsCellView = LargeSpaceNewsCellView()
    
//    private func setUpView() {
//        self.largeSpaceNewsCellView.translatesAutoresizingMaskIntoConstraints = false
//        self.contentView.addSubview(self.largeSpaceNewsCellView)
//    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        self.setUpView()
        self.setUpUIElements()
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpImageNewsImageViewConstraints() {
        self.imageNewsImageView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalTo(self.snp.centerX)
            make.height.equalTo(200)
            make.width.equalTo(300)
        }
    }
    
    private func setUpTitleNewsLabelConstraints() {
        self.titleNewsLabel.snp.makeConstraints { make in
            make.top.equalTo(self.imageNewsImageView.snp.bottom).offset(10)
            make.height.equalTo(50)
            make.centerX.equalTo(self.snp.centerX)
        }
    }
    
    
}
