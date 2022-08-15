//
//  STPoint.swift
//  Prototype
//
//  Created by Choiwansik on 2022/08/15.
//

import Foundation

internal struct STPoint {
    internal var x: Int = .zero
    internal var y: Int = .zero
}

extension STPoint: STShape {

    internal func draw() -> String {
        return "POINT(x: \(self.x), y: \(self.y))"
    }

    internal mutating func moveOffset(dx: Int, dy: Int) {
        self.x += dx
        self.y += dy
    }

}
