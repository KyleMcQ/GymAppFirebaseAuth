//
//  RepsAndWeightInputView.swift
//  GymApp_Login
//
//  Created by Kyle on 21/03/2024.
//

import SwiftUI

struct RepsAndWeightInputView: View {
    @Binding var reps: String
    @Binding var weight: String
    
    var body: some View {
        VStack {
            TextField("Reps", text: $reps)
                .keyboardType(.numberPad)
            TextField("Weight", text: $weight)
                .keyboardType(.decimalPad)
        }
    }
}


#Preview {
    RepsAndWeightInputView(reps: .constant("10"), weight: .constant("150"))
}
