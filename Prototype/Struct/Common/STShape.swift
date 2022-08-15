//
//  STShape.swift
//  Prototype
//
//  Created by Choiwansik on 2022/08/15.
//

import Foundation

internal protocol STShape {

    func draw() -> String

    mutating func moveOffset(dx: Int, dy: Int)

}
