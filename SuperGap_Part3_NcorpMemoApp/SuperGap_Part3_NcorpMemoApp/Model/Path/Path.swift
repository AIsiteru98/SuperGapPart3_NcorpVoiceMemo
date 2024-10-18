//
//  Path.swift
//  SuperGap_Part3_NcorpMemoApp
//
//  Created by 이재용 on 10/18/24.
//

import Foundation

class PathModel: ObservableObject { 
    @Published var paths: [PathType]
    init(path: [PathType] = []) {
        self.paths = path
    }
}
