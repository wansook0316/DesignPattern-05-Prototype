//
//  DPLine.swift
//  Prototype
//
//  Created by Choiwansik on 2022/08/15.
//

import Foundation

internal class DPLine: NSObject {

    internal convenience init(startPoint: DPPoint, endPoint: DPPoint) {
        self.init()
        
        self.startPoint = startPoint
        self.endPoint = endPoint
    }

    internal var startPoint: DPPoint = DPPoint()
    internal var endPoint: DPPoint = DPPoint()
}

extension DPLine: Prototype {

    internal func clone() -> NSObject {
        // Class이기 때문에 Deep copy 필요
        guard let newStartPoint = self.startPoint.clone() as? DPPoint,
              let newEndPoint = self.endPoint.clone() as? DPPoint else {
            return NSObject()
        }

        return DPLine(startPoint: newStartPoint,
                      endPoint: newEndPoint)
    }

}

extension DPLine: CLShape {

    internal func draw() -> String {
        return "LINE(start: \(self.startPoint.draw()), end: \(self.endPoint.draw()))"
    }

    internal func moveOffset(dx: Int, dy: Int) {
        self.startPoint.moveOffset(dx: dx, dy: dy)
        self.endPoint.moveOffset(dx: dx, dy: dy)
    }

}
