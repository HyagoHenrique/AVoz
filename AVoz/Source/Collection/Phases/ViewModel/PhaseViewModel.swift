//
//  PhaseViewModel.swift
//  AVoz
//
//  Created by Hyago Henrique on 29/12/21.
//

import FirebaseFirestore
import SwiftUI

final class PhaseViewModel: ObservableObject {
    @Published var fase: [(name: String, fase: String)] = [ (name: "Primeira Fase", fase: "phaseOne"),
                                                            (name: "Segunda Fase I", fase: "phaseTwo"),
                                                            (name: "Segunda Fase II", fase: "phaseThree") ]
}
