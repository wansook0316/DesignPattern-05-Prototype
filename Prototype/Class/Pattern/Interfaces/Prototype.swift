//
//  Prototype.swift
//  Prototype
//
//  Created by Choiwansik on 2022/08/15.
//

import Foundation

internal protocol Prototype {

    // prototype 패턴에서 반환타입은 최상위 클래스로 하는 경향이 많음
    func clone() -> NSObject

}
