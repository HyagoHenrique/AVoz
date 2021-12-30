//
//  FaseViewModel.swift
//  AVoz
//
//  Created by Hyago Henrique on 29/12/21.
//

import Foundation
import SwiftUI

final class FaseViewModel: ObservableObject {
   @Published var fase: [String] = ["Primeira Fase", "Segunda Fase I", "Segunda Fase II"]
}
