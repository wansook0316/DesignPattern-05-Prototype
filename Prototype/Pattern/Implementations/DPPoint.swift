//
//  DPPoint.swift
//  Prototype
//
//  Created by Choiwansik on 2022/08/15.
//

import Foundation

internal class DPPoint: NSObject {

    internal convenience init(x: Int, y: Int) {
        self.init()
        
        self.x = x
        self.y = y
    }

    internal var x: Int = .zero
    internal var y: Int = .zero
}

extension DPPoint: Prototype {

    internal func clone() -> NSObject {
        return DPPoint(x: self.x, y: self.y)
    }

}

extension DPPoint: Shape {

    internal func draw() -> String {
        return "POINT(x: \(self.x), y: \(self.y))"
    }

    internal func moveOffset(dx: Int, dy: Int) {
        self.x += dx
        self.y += dy
    }

}
