//
//  NSGroup.swift
//  Prototype
//
//  Created by Choiwansik on 2022/08/15.
//

import Foundation

internal class NSGroup {

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

extension NSGroup: NSCopying {

    func copy(with zone: NSZone? = nil) -> Any { // NSCopying에서는 Any를 return
        let newGroup = NSGroup(name: self.name)

        return self.shapes
            .compactMap { $0 as? Prototype } // 가독성 위해 분리
            .compactMap { $0.clone() as? Shape }
            .reduce(newGroup) { partialResult, shape in
                partialResult.add(shape: shape)
            }
    }

}

extension NSGroup: Shape {

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
