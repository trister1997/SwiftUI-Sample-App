//
//  TVDetailView.swift
//  Sample TV App
//
//  Created by Tyler Rister on 5/19/21.
//

import SwiftUI
import URLImage

struct TVDetailView: View {
    @ObservedObject var viewModel: TVDetailViewModel
    var body: some View {
        if let tvShow = viewModel.tvShow {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        URLImage(URL(string: tvShow.coverPhoto)!, content: { image in
                            image.resizable()
                                .frame(width: 150, height: 255)
                                .aspectRatio(contentMode: .fit)
                        })
                        VStack(alignment: .leading) {
                            Text("\(tvShow.title) (\(String(tvShow.year)))")
                                .font(.system(size: 18, weight: .bold))
                                .lineLimit(2)
                            Text("\(Strings.Titles.rating): \(String(tvShow.rating))")
                                .font(.system(size: 16, weight: .medium))
                                .padding(.top, 8)
                            Text("\(Strings.Titles.rated): \(tvShow.rated)")
                                .font(.system(size: 16, weight: .medium))
                                .padding(.top, 8)
                            Text("\(Strings.Titles.seasons): \(String(tvShow.seasons))")
                                .font(.system(size: 16, weight: .medium))
                                .padding(.top, 8)
                            Text(Strings.Titles.genres)
                                .font(.system(size: 16, weight: .semibold))
                                .padding(.top, 8)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(tvShow.genres, id: \.self) { genre in
                                        Chip(title: genre)
                                            .padding(.all, 4)
                                    }
                                }.introspectScrollView { scrollView in
                                    scrollView.bounces = false
                                }
                            }
                        }.padding(.leading, 8)
                        Spacer()
                    }.padding(.all, 12)
                        .background(Colors.ActionBackground)
                        .cornerRadius(24)
                    Text(Strings.Titles.description)
                        .font(.system(size: 18, weight: .bold))
                    Text(tvShow.description)
                        .font(.system(size: 16, weight: .regular))
                        .padding(.top, 8)
                    RoundedButton(title: Strings.Titles.viewOnImdb) {
                        guard let imdbUrl = URL(string: tvShow.imdbLink) else {
                            return
                        }
                        UIApplication.shared.open(imdbUrl)
                    }.frame(minWidth: 0, maxWidth: .infinity)
                        .padding(.top, 24)
                }.padding(.all, 12)
                .introspectScrollView { scrollView in
                    scrollView.bounces = false
                }
            }.background(Colors.BackgroundPaper)
        }
    }
}

struct TVDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TVDetailView(viewModel: TVDetailViewModel(showId: 1))
    }
}
