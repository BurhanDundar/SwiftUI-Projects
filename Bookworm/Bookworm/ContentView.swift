//
//  ContentView.swift
//  Bookworm
//
//  Created by Burhan Dündar on 23.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title),
        SortDescriptor(\.author)
    ]) var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(books){ book in
                    NavigationLink {
                        DetailView(book: book)
                    } label: {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack (alignment: .leading) {
                                Text(book.title ?? "Unkown title")
                                    .font(.headline)
                                Text(book.author ?? "Unkown author")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                //.onDelete(perform: deleteBooks)
            }
            .navigationTitle("Bookworm")
            .toolbar {
                /*ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }*/
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddScreen.toggle()
                    } label: {
                        Label("Add book", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen){
                AddBookView()
            }
        }
    }
    /*
     // Buraya artık ihtiyaç kalmadı çünkü silme işlemi detay sayfasından yapılıyor
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            moc.delete(book)
        }
        
        // try? moc.save
    }
    */
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
