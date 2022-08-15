//
//  DPGroup.swift
//  Prototype
//
//  Created by Choiwansik on 2022/08/15.
//

import Foundation

internal class DPGroup: NSObject {

    internal convenience init(name: String) {
        self.init()
        
        self.name = name
    }

    internal func add(shape: CLShape) -> Self {
        self.shapes.append(shape)
        return self
    }

    private var name: String = ""
    private var shapes = [CLShape]()
}

extension DPGroup: Prototype {

    internal func clone() -> NSObject {
        let newGroup = DPGroup(name: self.name)

        return self.shapes
            .compactMap { $0 as? Prototype } // 가독성 위해 분리
            .compactMap { $0.clone() as? CLShape }
            .reduce(newGroup) { partialResult, shape in
                partialResult.add(shape: shape)
            }
    }

}

extension DPGroup: CLShape {

    internal func draw() -> String {
        let infos = self.shapes
                        .map { $0.draw() }
                        .joined(separator: "\n")
        return "GROUP[\(name)](\(infos))"
    }

    internal func moveOffset(dx: Int, dy: Int) {
        self.shapes
            .forEach { $0.moveOffset(dx: dx, dy: dy) }
    }

}
