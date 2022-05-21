//
//  ToolType.swift
//  paintApp
//
//  Created by Abi on 16.05.2022.
//

import Foundation

enum ToolType: String, CaseIterable {
    case pencil = "pencil"
    case rectangle = "rectangle.fill"
    case triangle = "triangle.fill"
    case circle = "circle.fill"
    case brush = "book.closed" // looks like eraser
}

extension CaseIterable where Self: Equatable {
    func next() -> Self {
        let all = Self.allCases
        let idx = all.firstIndex(of: self)!
        let next = all.index(after: idx)
        return all[next == all.endIndex ? all.startIndex : next]
    }
}
