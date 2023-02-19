//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 14.09.2022.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject private var user: UserManager
    
    var nameIsValid = false
    
    var body: some View {
        VStack {
            UserName(
                name: $user.user.name,
                nameIsValid: user.nameIsValid
            )
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(!user.nameIsValid)
        }
    }
    
    private func registerUser() {
        user.user.isRegistered.toggle()
        DataManager.shared.save(user: user.user)
    }
}

struct UserName: View {
    @Binding var name: String
    
    var nameIsValid = false
    
    var body: some View {
        ZStack {
            TextField("Type your name...", text: $name)
                .multilineTextAlignment(.center)
            HStack {
                Spacer()
                Text(name.count.formatted())
                    .foregroundColor(nameIsValid ? .green : .red)
                    .padding([.top, .trailing])
            }
            .padding(.bottom)
        }
    }
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager())
    }
}
