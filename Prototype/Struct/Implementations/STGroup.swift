//
//  STGroup.swift
//  Prototype
//
//  Created by Choiwansik on 2022/08/15.
//

import Foundation

internal struct STGroup {
    internal init(name: String) {
        self.name = name
    }

    // 자기자신을 return할 때 복사해서 던지므로 chaining 불가
    internal mutating func add(shape: STShape) {
        self.shapes.append(shape)
    }

    private var name: String = ""
    private var shapes = [STShape]()
}

extension STGroup: STShape {

    internal func draw() -> String {
        let infos = self.shapes
                        .map { $0.draw() }
                        .joined(separator: "\n")
        return "GROUP[\(name)](\(infos))"
    }

    // 직접값을 바꿀 수 없기 때문에 (moveOffset) 변환된 것을 복사받아 반영해주어야 함
    internal mutating func moveOffset(dx: Int, dy: Int) {
        self.shapes = self.shapes
                          .map { shape in
                              var newShape = shape
                              newShape.moveOffset(dx: dx, dy: dy)
                              return newShape
                          }
    }
}
