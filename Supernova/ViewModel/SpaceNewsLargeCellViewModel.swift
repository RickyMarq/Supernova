//
//  SpaceNewsLargeCellViewModel.swift
//  Supernova
//
//  Created by Henrique Marques on 09/09/22.
//

import Foundation

class SpaceNewsLargeCellViewModel {
    
    var objc: SpaceflightElement?
    
    init(objc: SpaceflightElement) {
        self.objc = objc
    }
    
    var id: Int {
        return self.objc?.id ?? 0
    }
    
    var title: String {
        return self.objc?.title ?? "Error"
    }
    
    var summary: String {
        return self.objc?.summary ?? "Error"
    }
    
    var imageUrl: String {
        return self.objc?.imageUrl ?? "Error URL"
    }
 
}
