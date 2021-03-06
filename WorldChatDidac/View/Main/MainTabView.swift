//
//  MainTabView.swift
//  WorldChatDidac
//
//  Created by Dídac Edo Gibert on 14/4/21.
//

import SwiftUI

struct MainTabView: View {
    let user: User
    @Binding var selectedIndex: Int
    
    public var locationManager = LocationManager()
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedIndex) {
                PublicationView()
                    .onTapGesture {
                        selectedIndex = 0
                    }
                    .tabItem {
                        Image(systemName: "house")
                    }.tag(0)
            
                SearchView()
                    .onTapGesture {
                        selectedIndex = 1
                    }
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }.tag(1)
            
                UploadPostView(placePost: "", tabIndex: $selectedIndex)
                    .onTapGesture {
                        selectedIndex = 2
                    }
                    .tabItem {
                        Image(systemName: "plus.square")
                    }.tag(2)
                
                PlaceView()
                    .onTapGesture {
                        selectedIndex = 3
                    }
                    .tabItem {
                        Image(systemName: "airplane")
                    }.tag(3)
            
                ProfileView(user: user)
                    .onTapGesture {
                        selectedIndex = 4
                    }
                    .tabItem {
                        Image(systemName: "person")
                    }.tag(4)
            }
            .navigationTitle(tabTitle)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: logoutButton, trailing: conversation)
            .accentColor(.black)
        }
    }
    
    var logoutButton: some View {
        Button {
            AuthViewModel.shared.signout()
        } label: {
            Text("Logout").foregroundColor(.black)
        }
    }
    var conversation: some View {
        NavigationLink(
            destination: ConversationsView(user: user),
            label: {
                Image(systemName: "paperplane")
                    .foregroundColor(.black)
            })
    }
    
    
    var tabTitle: String {
        switch selectedIndex {
        case 0:
            return "WorldChat"
        case 1:
            return ""
        case 2:
            return ""
        case 3:
            return "Lugares"
        case 4:
            return "Perfil"
        default:
            return ""
        }
    }
}
