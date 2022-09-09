//
//  SpaceNewsViewModel.swift
//  Supernova
//
//  Created by Henrique Marques on 09/09/22.
//

import Foundation

protocol SpaceNewsViewModelProtocols: AnyObject {
    func success()
    func failure()
}

class SpaceNewsViewModel {
    
    weak var delegate: SpaceNewsViewModelProtocols?
    let NetworkManger = NetworkManager()
    var objc: [SpaceflightElement] = []
    
    init(delegate: SpaceNewsViewModelProtocols? = nil) {
        self.delegate = delegate
    }
    
    func getData() {
        self.NetworkManger.getNews { news, error in
            if error != nil {
                self.delegate?.failure()
            } else {
                self.objc = news!
                self.delegate?.success()
            }
        }
    }
    
    var count: Int {
        return objc.count
    }
    
    func getDataIndex(indexPath: IndexPath) -> SpaceflightElement {
        return self.objc[indexPath.row]
    }
    
    
}
