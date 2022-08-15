//
//  main.swift
//  Prototype
//
//  Created by Choiwansik on 2022/08/15.
//

import Foundation

internal func main() {
//    ProtoType패턴을사용한테스트()
//    NSCopying을사용한테스트()
    Struct를사용한테스트()
}

internal func ProtoType패턴을사용한테스트() {
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
    guard let lineCopy = line1.clone() as? DPLine else { // line1을 복사하여 변 하나 생성
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

internal func NSCopying을사용한테스트() {
    // Point
    let point1 = NSPoint(x: 0, y: 0)
    print(point1.draw())

    let point2 = NSPoint(x: 100, y: 0)
    print(point2.draw())

    // Line
    let line1 = NSLine(startPoint: point1,
                       endPoint: point2)
    print(line1.draw())

    // Group(rectangle)
    guard let lineCopy = line1.copy() as? NSLine else { // line1을 복사하여 변 하나 생성
        return
    }

    let point3 = NSPoint(x: 100, y: 100)
    let point4 = NSPoint(x: 0, y: 100)

    let line2 = NSLine(startPoint: point2,
                       endPoint: point3)
    let line3 = NSLine(startPoint: point3,
                       endPoint: point4)
    let line4 = NSLine(startPoint: point4,
                       endPoint: point1)

    let rect = NSGroup(name: "Rect")
            .add(shape: lineCopy)
            .add(shape: line2)
            .add(shape: line3)
            .add(shape: line4)
    print(rect.draw())
}

internal func Struct를사용한테스트() {
    // Point
    let point1 = STPoint(x: 0, y: 0)
    print(point1.draw())

    let point2 = STPoint(x: 100, y: 0)
    print(point2.draw())

    // Line
    let line1 = STLine(startPoint: point1,
                       endPoint: point2)
    print(line1.draw())

    // Group(rectangle)
    let lineCopy = line1 // 할당하면서 copy가 끝남

    let point3 = STPoint(x: 100, y: 100)
    let point4 = STPoint(x: 0, y: 100)

    let line2 = STLine(startPoint: point2,
                       endPoint: point3)
    let line3 = STLine(startPoint: point3,
                       endPoint: point4)
    let line4 = STLine(startPoint: point4,
                       endPoint: point1)

    // 함수 리턴시 복사하므로 chaining 불가
    var rect = STGroup(name: "Rect")
    rect.add(shape: lineCopy)
    rect.add(shape: line2)
    rect.add(shape: line3)
    rect.add(shape: line4)

    print(rect.draw())
}


main()
