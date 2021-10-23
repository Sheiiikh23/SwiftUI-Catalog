//
//  HostingController.swift
//  SwiftUI 2.0 watchOS Extension
//
//  Created by Lucas Abijmil on 07/12/2020.
//

import WatchKit
import Foundation
import SwiftUI

final class HostingController: WKHostingController<ResetFocus> {
  override var body: ResetFocus {
    return ResetFocus()
  }
}
