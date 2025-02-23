//
//  ContentView.swift
//  Chapter22
//
//  Created by Louise Rennick on 2025-02-19.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var store = RomStore()
    @State private var query = "Sculptures"
    @State private var showQueryField = false
    
    var body: some View {
        NavigationStack {
            ZStack {
               
                Image("Hall")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all) //
                    .opacity(0.3)

                // Main content
                VStack {
                    Text("You searched for '\(query)'")
                        .padding(5)
                        .background(Color.gray)
                        .cornerRadius(10)
                    
                    List(store.objects, id: \.objectID) { object in
                        if !object.isPublicDomain, let url = URL(string: object.objectURL) {
                            NavigationLink(destination: SafariView(url: url)) {
                                WebIndicatorView(title: object.title)
                            }
                            .listRowBackground(Color.romBackground)
                            .foregroundColor(.white)
                        } else {
                            NavigationLink(destination: ObjectView(object: object)) {
                                Text(object.title)
                            }
                            .listRowBackground(Color.romForeground)
                        }
                    }
                    .navigationTitle("The ROM")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                showQueryField = true
                            }) {
                                Text("Search the ROM")
                                    .foregroundColor(Color.black)
                                    .padding(.horizontal)
                                    .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.romBackground, lineWidth: 2)
                                    )
                            }
                        }
                    }
                    .alert("Search the ROM", isPresented: $showQueryField) {
                        TextField("Enter search term", text: $query)
                        Button("Search") {
                            // Implement search logic
                        }
                    }
                }
                .padding(.bottom , 420)
                .padding(.horizontal, 10)// Optional padding for the content inside the VStack
            }
            .navigationDestination(for: URL.self) { url in
                SafariView(url: url)
                    .navigationBarTitleDisplayMode(.inline)
                    .ignoresSafeArea()
            }
            .navigationDestination(for: Object.self) { object in
                ObjectView(object: object)
            }
        }
    }
}

struct WebIndicatorView: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Image(systemName: "rectangle.portrait.and.arrow.right.fill")
                .font(.footnote)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

