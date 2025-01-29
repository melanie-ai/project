//
//  ContentView.swift
//  new
//
//  Created by Melanie Laveriano on 12/19/24.
//

import SwiftUI

// MARK: - Models
struct User: Identifiable {
    let id = UUID()
    let name: String
    let age: Int
    let bio: String
    let interests: [String]
    var profileImages: [String]
    var isBlurred: Bool = true
}

struct Match: Identifiable {
    let id = UUID()
    let user: User
    var conversations: [Message] = []
}

struct Message: Identifiable {
    let id = UUID()
    let sender: String
    let content: String
    let timestamp: Date
}

// MARK: - View Models
class DatingViewModel: ObservableObject {
    @Published var potentialMatches: [User] = []
    @Published var currentMatches: [Match] = []
    
    init() {
        // Sample data
        potentialMatches = [
            User(name: "KYS", age: 42, bio: "Love hiking and photography",
                 interests: ["Travel", "Photography", "Hiking"],
                 profileImages: ["person1"]),
            User(name: "Sam", age: 26, bio: "Coffee enthusiast and book lover",
                 interests: ["Reading", "Coffee", "Art"],
                 profileImages: ["person2"])
        ]
    }
    
    func revealProfile(_ user: User) {
        if let index = potentialMatches.firstIndex(where: { $0.id == user.id }) {
            potentialMatches[index].isBlurred = false
        }
    }
    
    func createMatch(with user: User) {
        let newMatch = Match(user: user)
        currentMatches.append(newMatch)
        potentialMatches.removeAll(where: { $0.id == user.id })
    }
}

// MARK: - Views
struct ContentView: View {
    @StateObject private var viewModel = DatingViewModel()
    
    var body: some View {
        TabView {
            DiscoverView(viewModel: viewModel)
                .tabItem {
                    Label("Discover", systemImage: "sparkles")
                }
            
            MatchesView(viewModel: viewModel)
                .tabItem {
                    Label("Matches", systemImage: "heart.fill")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
    }
}

struct DiscoverView: View {
    @ObservedObject var viewModel: DatingViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(viewModel.potentialMatches) { user in
                        ProfileCard(user: user, viewModel: viewModel)
                    }
                }
                .padding()
            }
            .navigationTitle("Discover")
        }
    }
}

struct ProfileCard: View {
    let user: User
    @ObservedObject var viewModel: DatingViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Profile Image
            ZStack {
                Image(user.profileImages[0])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 400)
                    .clipped()
                
                if user.isBlurred {
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .overlay {
                            VStack {
                                Text("Chat to reveal")
                                    .font(.headline)
                                Button("Start Chatting") {
                                    viewModel.revealProfile(user)
                                }
                                .buttonStyle(.bordered)
                            }
                        }
                }
            }
            
            // User Info
            VStack(alignment: .leading, spacing: 8) {
                Text("\(user.name), \(user.age)")
                    .font(.title2)
                    .bold()
                
                Text(user.bio)
                    .font(.subheadline)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(user.interests, id: \.self) { interest in
                            Text(interest)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(20)
                        }
                    }
                }
            }
            .padding()
            
            Button(action: {
                viewModel.createMatch(with: user)
            }) {
                Text("Like Profile")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

struct MatchesView: View {
    @ObservedObject var viewModel: DatingViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.currentMatches) { match in
                NavigationLink(destination: ChatView(match: match)) {
                    HStack {
                        Image(match.user.profileImages[0])
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text(match.user.name)
                                .font(.headline)
                            Text("Tap to chat")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Matches")
        }
    }
}

struct ChatView: View {
    let match: Match
    @State private var messageText = ""
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(match.conversations) { message in
                        MessageBubble(message: message)
                    }
                }
                .padding()
            }
            
            HStack {
                TextField("Type a message...", text: $messageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    // Send message action
                }) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.blue)
                }
            }
            .padding()
        }
        .navigationTitle(match.user.name)
    }
}

struct MessageBubble: View {
    let message: Message
    
    var body: some View {
        HStack {
            if message.sender == "currentUser" {
                Spacer()
            }
            
            Text(message.content)
                .padding()
                .background(message.sender == "currentUser" ? Color.blue : Color.gray.opacity(0.2))
                .foregroundColor(message.sender == "currentUser" ? .white : .black)
                .cornerRadius(20)
            
            if message.sender != "currentUser" {
                Spacer()
            }
        }
    }
}

struct ProfileView: View {
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("Name", text: .constant(""))
                    TextField("Bio", text: .constant(""))
                    DatePicker("Birthday", selection: .constant(Date()), displayedComponents: .date)
                }
                
                Section(header: Text("Interests")) {
                    // Add interests management here
                }
                
                Section(header: Text("Photos")) {
                    // Add photo management here
                }
                
                Section(header: Text("Settings")) {
                    Toggle("Show Profile", isOn: .constant(true))
                    Toggle("Notifications", isOn: .constant(true))
                }
            }
            .navigationTitle("Profile")
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
