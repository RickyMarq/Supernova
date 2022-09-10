//
//  SpaceNewsCellViewModel.swift
//  Supernova
//
//  Created by Henrique Marques on 09/09/22.
//

import Foundation

class SpaceNewsCellViewModel {
    
    // Inicializar Array vazia e dar init.
    
    let objc: SpaceflightElement
    
    init(objc: SpaceflightElement) {
        self.objc = objc
    }
    
    var id: Int {
        return self.objc.id ?? 0
    }
    
    var title: String {
        return self.objc.title ?? "Error trying to get title"
    }
    
    var summary: String {
        return self.objc.summary ?? "Error trying to get summary"
    }
    
    var urlPhoto: String {
        return self.objc.imageUrl ?? "Error trying to get urlPhoto"
    }
    
    
}
