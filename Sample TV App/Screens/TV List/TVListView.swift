//
//  TVListView.swift
//  Sample TV App
//
//  Created by Tyler Rister on 5/19/21.
//

import SwiftUI

struct TVListView: View {
    @State private var searching: Bool = false
    @ObservedObject var viewModel = TVListViewModel()
    
    var body: some View {
        VStack {
            if searching {
                SearchBar(text: $viewModel.searchString)
                    .padding(.all, 24)
            }
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 16, alignment: .center)]) {
                    ForEach(viewModel.filteredTvShows, id: \.self) { tvShow in
                        NavigationLink(
                            destination: LazyNavigationView(TVDetailView(viewModel: TVDetailViewModel(showId: tvShow.id)).navigationTitle(tvShow.title)),
                            label: {
                                TVShowCell(imageUrl: URL(string: tvShow.coverPhoto)!, title: tvShow.title, year: tvShow.year)
                            })
                    }
                }
            }.padding(.all, 24)
                .onTapGesture {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
        }.background(Colors.BackgroundPaper)
            .navigationBarItems(trailing: HStack(alignment: .center) {
                Spacer()
                Button(action: {
                    searching.toggle()
                }, label: {
                    Images.searchIcon
                })
            })
    }
}

struct TVListView_Previews: PreviewProvider {
    static var previews: some View {
        TVListView()
    }
}
