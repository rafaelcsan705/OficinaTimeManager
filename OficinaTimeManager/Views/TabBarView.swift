//
//  TabBarView.swift
//  OficinaTimeManager
//
//  Created by Rafael Santos on 12/10/2024.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        ZStack {
            
            VStack {
                TabView {
                    JobsView()
                        .tabItem {
                            Label("Trabalhos", systemImage: "hammer.fill")
                        }
                    ClientView()
                        .tabItem {
                            Label("Clientes", systemImage: "person.2.fill")
                        }
                }
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .padding(.horizontal, 16)
                        .shadow(color: .gray, radius: 10, y: -2)
                )
                .cornerRadius(20)
                .padding(.bottom, 16)
            }
        }
    }
}

#Preview {
    TabBarView()
}
