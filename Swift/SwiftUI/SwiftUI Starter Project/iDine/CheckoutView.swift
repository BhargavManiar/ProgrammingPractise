//
//  CheckoutView.swift
//  iDine
//
//  Created by Bhargav Maniar on 05/05/2021.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    @State private var paymentType = "Cash" // Default value
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    
    let paymentTypes = ["Cash", "Credit Cards", "iDine Points"]
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                
                Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails)
                
                if addLoyaltyDetails {
                    TextField("Enter you iDine ID", text: $loyaltyNumber)
                }
                
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
    }
}
