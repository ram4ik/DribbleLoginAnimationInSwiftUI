//
//  ContentView.swift
//  DribbleLoginAnimationInSwiftUI
//
//  Created by ramil on 26.10.2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var animation = false
    @State private var loginOn = false
    @State private var codeDrop = false
    @State private var animationOn = false
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Image(systemName: "chevron.left.slash.chevron.right")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 120, height: 90)
                    .aspectRatio(contentMode: .fill)
                    .offset(y: codeDrop ? 0 : -400)
                    .animation(.spring(response: 0.5, dampingFraction: 0.65))
                    .padding(.bottom, 20)
                
                Text("SwiftUI")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .bold()
                    .frame(width: UIScreen.main.bounds.width / 2, height: 35)
                    .opacity(animationOn ? 5 : 0)
                    .animation(.linear)
            }.offset(y: loginOn ? 0 : 0.75)
            
            CodeTextField(email: $email, password: $password)
                .opacity(loginOn ? 5 : 0.75)
                .animation(.easeInOut)
            Spacer()
            
            CodeButton()
                .opacity(password.isEmpty || email.isEmpty ? 0 : 5)
        }.background(Color.green)
        .edgesIgnoringSafeArea(.all)
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                withAnimation {
                    animationOn.toggle()
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    codeDrop.toggle()
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.9) {
                withAnimation {
                    loginOn.toggle()
                }
            }
        }
    }
}

struct CodeTextField: View {
    @Binding var email: String
    @Binding var password: String
    
    var body: some View {
        VStack {
            TextField("email", text: $email)
                .keyboardType(.emailAddress)
                .padding(10)
                .background(Color.white)
                .cornerRadius(5)
                .shadow(color: Color.black.opacity(0.5), radius: 5, x: 2, y: 2)
            
            SecureField("password", text: $password)
                .padding(10)
                .background(Color.white)
                .cornerRadius(5)
                .shadow(color: Color.black.opacity(0.5), radius: 5, x: 2, y: 2)
        }.padding(50)
    }
}

struct CodeButton: View {
    var body: some View {
        Button(action: {
            
        }, label: {
            Text("Code Go")
                .font(.system(size: 22, weight: .heavy, design: .rounded))
                .foregroundColor(Color.white)
                .frame(width: UIScreen.main.bounds.width / 2, height: 50)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding()
                .shadow(color: Color.black.opacity(0.5), radius: 5, x: 2, y: 2)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
