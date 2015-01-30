// RUN: %target-run-simple-swift | FileCheck %s

// REQUIRES: objc_interop

import Foundation

#if os(OSX)
import AppKit
#endif

#if os(iOS)
import UIKit
#endif

extension CGColorSpace {
  class func deviceRGB() -> CGColorSpace {
    return CGColorSpaceCreateDeviceRGB()
  }
}

extension CGColor {
  class func create(#colorSpace: CGColorSpace, #components: [CGFloat])
      -> CGColor {
    return CGColorCreate(colorSpace, components)
  }

  var r: CGFloat { return CGColorGetComponents(self)[0] }
  var g: CGFloat { return CGColorGetComponents(self)[1] }
  var b: CGFloat { return CGColorGetComponents(self)[2] }
}

let pink = CGColor.create(colorSpace: .deviceRGB(),
                          components: [1.0, 0.5, 0.25, 1.0])

// CHECK: 1.0
println(pink.r)
// CHECK-NEXT: 0.5
println(pink.g)
// CHECK-NEXT: 0.25
println(pink.b)

