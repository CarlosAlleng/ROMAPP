//
//  RomStore.swift
//  Chapter22
//
//  Created by Louise Rennick on 2025-02-19.
//

import Foundation

class RomStore: ObservableObject {
  @Published var objects: [Object] = []

  init() {
    #if DEBUG
    createDevData()
    #endif
  }
}
