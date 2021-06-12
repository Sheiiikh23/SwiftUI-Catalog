//
//  Table, TableColumb.swift
//  macOS
//
//  Created by Lucas Abijmil on 11/06/2021.
//

import SwiftUI

#warning("TO DO – FIXME")

struct TableAndTableColumn: View {


  var body: some View {
    Table(1..<100) { number in
      TableColumn("1") { Text("ok") }
      .width(20)
      TableColumn("2") { Image(systemName: "gear") }
    }
  }
}

struct TableAndTableColumn_Previews: PreviewProvider {
  static var previews: some View {
    TableAndTableColumn()
  }
}
