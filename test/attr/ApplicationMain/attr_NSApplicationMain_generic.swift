// RUN: %target-swift-frontend %clang-importer-sdk -parse -parse-as-library -verify %s

// REQUIRES: objc_interop

import AppKit

@NSApplicationMain // expected-error{{generic 'NSApplicationMain' classes are not supported}}
class MyDelegate<T>: NSObject, NSApplicationDelegate {
}
