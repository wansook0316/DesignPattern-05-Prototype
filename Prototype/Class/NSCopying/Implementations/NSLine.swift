//
//  NSLine.swift
//  Prototype
//
//  Created by Choiwansik on 2022/08/15.
//

import Foundation

internal class NSLine {

    internal convenience init(startPoint: NSPoint, endPoint: NSPoint) {
        self.init()
        
        self.startPoint = startPoint
        self.endPoint = endPoint
    }

    internal var startPoint: NSPoint = NSPoint()
    internal var endPoint: NSPoint = NSPoint()
}

extension NSLine: NSCopying {
    
    func copy(with zone: NSZone? = nil) -> Any { // NSCopying에서는 Any를 return
        // Class이기 때문에 Deep copy 필요
        guard let newStartPoint = self.startPoint.copy() as? NSPoint,
              let newEndPoint = self.endPoint.copy() as? NSPoint else {
            return NSObject()
        }

        return NSLine(startPoint: newStartPoint,
                      endPoint: newEndPoint)
    }

}

extension NSLine: CLShape {

    internal func draw() -> String {
        return "LINE(start: \(self.startPoint.draw()), end: \(self.endPoint.draw()))"
    }

    internal func moveOffset(dx: Int, dy: Int) {
        self.startPoint.moveOffset(dx: dx, dy: dy)
        self.endPoint.moveOffset(dx: dx, dy: dy)
    }

}
