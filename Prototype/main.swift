//
//  main.swift
//  Prototype
//
//  Created by Choiwansik on 2022/08/15.
//

import Foundation

internal func main() {

    // Point

    let point1 = DPPoint(x: 0, y: 0)
    print(point1.draw())

    let point2 = DPPoint(x: 100, y: 0)
    print(point2.draw())

    // Line

    let line1 = DPLine(startPoint: point1,
                       endPoint: point2)
    print(line1.draw())

    // Group(rectangle)

    // line1을 복사하여 변 하나 생성
    guard let lineCopy = line1.clone() as? DPLine else {
        return
    }

    let point3 = DPPoint(x: 100, y: 100)

    let point4 = DPPoint(x: 0, y: 100)

    let line2 = DPLine(startPoint: point2,
                       endPoint: point3)

    let line3 = DPLine(startPoint: point3,
                       endPoint: point4)

    let line4 = DPLine(startPoint: point4,
                       endPoint: point1)

    let rect = DPGroup(name: "Rect")
            .add(shape: lineCopy)
            .add(shape: line2)
            .add(shape: line3)
            .add(shape: line4)

    print(rect.draw())
}

internal func Point출력테스트() {

}

internal func Line출력테스트() {

}

internal func GroupRECT출력테스트() {

}


main()
