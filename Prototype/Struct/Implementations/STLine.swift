//
//  STLine.swift
//  Prototype
//
//  Created by Choiwansik on 2022/08/15.
//

import Foundation

internal struct STLine {
    internal var startPoint: STPoint = STPoint(x: .zero, y: .zero)
    internal var endPoint: STPoint = STPoint(x: .zero, y: .zero)
}

extension STLine: STShape {

    internal func draw() -> String {
        return "LINE(start: \(self.startPoint.draw()), end: \(self.endPoint.draw()))"
    }

    internal mutating func moveOffset(dx: Int, dy: Int) {
        self.startPoint.moveOffset(dx: dx, dy: dy)
        self.endPoint.moveOffset(dx: dx, dy: dy)
    }

}
