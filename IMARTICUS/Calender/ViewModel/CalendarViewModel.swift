//
//  CalendarViewModel.swift
//  IMARTICUS
//
//  Created by Sandeep Ahuja on 04/09/21.
//

import Foundation

class CalendarViewModel {
  // MARK: - Initalizer
  init() {
    #if !RELEASE
    print("[ARC DEBUG] Init HomeViewModel")
    #endif
  }

  deinit {
    #if !RELEASE
    print("[ARC DEBUG] Deinit HomeViewModel")
    #endif
  }

  // MARK: - Properties
  let days = ["Today", "Yesterday", "Tomorrow"]

  var numberOfCellsForOfficeCollectionView: Int {
    return 3
  }
}
