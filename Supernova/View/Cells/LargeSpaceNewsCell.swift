//
//  LargeSpaceNewsCell.swift
//  Supernova
//
//  Created by Henrique Marques on 23/08/22.
//

import UIKit

class LargeSpaceNewsCell: UITableViewCell {
    
    static let identifier: String = "LargeSpaceNewsCell"
    var viewModel: SpaceNewsLargeCellViewModel?

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
    
    lazy var summaryNewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Error"
        label.textColor = .gray
        label.numberOfLines = 5
        label.font = UIFont.systemFont(ofSize: 11)
        label.textAlignment = .center
        return label
    }()

    private func setUpUIElements() {
        self.addSubview(self.titleNewsLabel)
        self.addSubview(self.imageNewsImageView)
        self.addSubview(self.summaryNewsLabel)
    }
    
    private func setUpConstraints() {
        self.setUpTitleNewsLabelConstraints()
        self.setUpImageNewsImageViewConstraints()
        self.setUpSummaryNewsLabelConstraints()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .black
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
            make.width.equalTo(350)
        }
    }
    
    private func setUpTitleNewsLabelConstraints() {
        self.titleNewsLabel.snp.makeConstraints { make in
            make.top.equalTo(self.imageNewsImageView.snp.bottom).offset(10)
            make.height.equalTo(20)
            make.centerX.equalTo(self.snp.centerX)
        }
    }
    
    private func setUpSummaryNewsLabelConstraints() {
        self.summaryNewsLabel.snp.makeConstraints { make in
            make.top.equalTo(self.titleNewsLabel.snp.bottom).offset(5)
            make.width.equalTo(300)
            make.centerX.equalTo(self.snp.centerX)
        }
    }
    
    // init diretamente no método de preparação
    
    func prepareLargeSpaceCell(model: SpaceflightElement) {
        self.viewModel = SpaceNewsLargeCellViewModel(objc: model)
        self.titleNewsLabel.text = self.viewModel?.title
        self.summaryNewsLabel.text = self.viewModel?.summary
        DispatchQueue.global().async {
            if let image = URL(string: self.viewModel!.imageUrl) {
                do {
                    let data = try Data(contentsOf: image)
                    let img = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.imageNewsImageView.image = img
                    }
                } catch {
                    print("Error")
                }
            }
        }
    }
}
