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

    internal func add(shape: Shape) -> Self {
        self.shapes.append(shape)
        return self
    }

    private var name: String = ""
    private var shapes = [Shape]()
}

extension DPGroup: Prototype {

    internal func clone() -> NSObject {
//        var newGroup = DPGroup(name: self.name)
//
//        self.shapes
//            .compactMap { $0 as? Prototype } // 가독성 위해 분리
//            .compactMap { $0.clone() as? Shape }
//            .forEach { newGroup.add(shape: $0) }
//
//        return newGroup

        let newGroup = DPGroup(name: self.name)

        return self.shapes
            .compactMap { $0 as? Prototype } // 가독성 위해 분리
            .compactMap { $0.clone() as? Shape }
            .reduce(newGroup) { partialResult, shape in
                partialResult.add(shape: shape)
            }
    }

}

extension DPGroup: Shape {

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
