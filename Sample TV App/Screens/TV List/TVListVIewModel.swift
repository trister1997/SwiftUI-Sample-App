//
//  TVListVIewModel.swift
//  Sample TV App
//
//  Created by Tyler Rister on 5/19/21.
//

import Combine
import Foundation

class TVListViewModel: ObservableObject {
    private var tvShows: [TVShow] = []
    @Published var filteredTvShows: [TVShow] = []
    private var cancelBag = Set<AnyCancellable>()
    @Published var error: String? = nil
    @Published var searchString: String = ""
    
    init() {
        NetworkManager.shared.getTvShows()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { [unowned self] completion in
                switch completion {
                case .failure(_):
                    self.error = Strings.Errors.errorLoadingTVShows
                    break
                case .finished:
                    break
                }
            }, receiveValue: { [unowned self] tvShows in
                self.tvShows = tvShows
                self.filteredTvShows = tvShows
            })
            .store(in: &cancelBag)
        $searchString
            .removeDuplicates()
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .sink { [unowned self] _ in
                self.searchTVShows()
            }
            .store(in: &cancelBag)
    }
    
    func searchTVShows() {
        if searchString == "" {
            filteredTvShows = tvShows
        } else {
            filteredTvShows = tvShows.filter { $0.title.contains(searchString) }
        }
    }
    
    deinit {
        cancelBag.forEach { cancellable in
            cancellable.cancel()
        }
    }
}
