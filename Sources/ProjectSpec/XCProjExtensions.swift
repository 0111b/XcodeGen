//
//  ProjectExtensions.swift
//  XcodeGen
//
//  Created by Yonas Kolb on 19/7/17.
//
//

import Foundation
import xcproj
import PathKit

extension PBXProductType {

    init?(string: String) {
        if let type = PBXProductType(rawValue: string) {
            self = type
        } else if let type = PBXProductType(rawValue: "com.apple.product-type.\(string)") {
            self = type
        } else {
            return nil
        }
    }

    public var isFramework: Bool {
        return self == .framework
    }

    public var isLibrary: Bool {
        return self == .staticLibrary || self == .dynamicLibrary
    }

    public var isExtension: Bool {
        return fileExtension == "appex"
    }

    public var isApp: Bool {
        return fileExtension == "app"
    }

    public var name: String {
        return rawValue.replacingOccurrences(of: "com.apple.product-type.", with: "")
    }
}

extension Platform {

    public var emoji: String {
        switch self {
        case .iOS: return "📱"
        case .watchOS: return "⌚️"
        case .tvOS: return "📺"
        case .macOS: return "🖥"
        }
    }
}
