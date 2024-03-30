//
//  ContentView.swift
//  Trivia
//
//  Created by William Sosropartono on 3/29/24.
//

import SwiftUI



enum QuestionCategory: String, CaseIterable {
    case generalKnowledge = "General Knowledge"
    case science = "Science"
    case history = "History"
    // Add more categories as needed
}

enum QuestionDifficulty: String, CaseIterable {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
    // Add more difficulties as needed
}

enum QuestionType: String, CaseIterable {
    case multipleChoice = "Multiple Choice"
    case trueFalse = "True/False"
}

struct OptionsView: View {
    @State private var numberOfQuestions = 5
    @State private var selectedCategory = QuestionCategory.generalKnowledge
    @State private var selectedDifficulty = QuestionDifficulty.easy
    @State private var selectedType = QuestionType.multipleChoice
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Number of Questions")) {
                    Stepper(value: $numberOfQuestions, in: 1...20) {
                        Text("\(numberOfQuestions) questions")
                    }
                }
                
                Section(header: Text("Category")) {
                    Picker(selection: $selectedCategory, label: Text("Category")) {
                        ForEach(QuestionCategory.allCases, id: \.self) { category in
                            Text(category.rawValue)
                        }
                    }
                }
                
                Section(header: Text("Difficulty")) {
                    Picker(selection: $selectedDifficulty, label: Text("Difficulty")) {
                        ForEach(QuestionDifficulty.allCases, id: \.self) { difficulty in
                            Text(difficulty.rawValue)
                        }
                    }
                }
                
                Section(header: Text("Type")) {
                    Picker(selection: $selectedType, label: Text("Type")) {
                        ForEach(QuestionType.allCases, id: \.self) { type in
                            Text(type.rawValue)
                        }
                    }
                }
            }
            .navigationBarTitle("Trivia Game Generator")
            .navigationBarItems(trailing: Button("Start Game") {
                // Action to start the game with selected options
                startGame()
            })
        }
    }
    
    func startGame() {
        // Implement your game start logic using selected options
        print("Starting game with \(numberOfQuestions) questions in category \(selectedCategory.rawValue), difficulty \(selectedDifficulty.rawValue), and type \(selectedType.rawValue)")
    }
}
struct ContentView: View {
    var body: some View {
        OptionsView()
    }
}

#Preview {
    ContentView()
}
