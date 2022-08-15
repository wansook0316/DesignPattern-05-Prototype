//
//  CLShape.swift
//  Prototype
//
//  Created by Choiwansik on 2022/08/15.
//

import Foundation

internal protocol CLShape: AnyObject {

    func draw() -> String

    func moveOffset(dx: Int, dy: Int)

}
