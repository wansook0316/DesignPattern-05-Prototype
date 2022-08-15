//
//  NSPoint.swift
//  Prototype
//
//  Created by Choiwansik on 2022/08/15.
//

import Foundation

internal class NSPoint {

    internal convenience init(x: Int, y: Int) {
        self.init()
        
        self.x = x
        self.y = y
    }

    internal var x: Int = .zero
    internal var y: Int = .zero
}

extension NSPoint: NSCopying {

    func copy(with zone: NSZone? = nil) -> Any { // NSCopying에서는 Any를 return
        return NSPoint(x: self.x, y: self.y)
    }

}

extension NSPoint: Shape {

    internal func draw() -> String {
        return "POINT(x: \(self.x), y: \(self.y))"
    }

    internal func moveOffset(dx: Int, dy: Int) {
        self.x += dx
        self.y += dy
    }

}
