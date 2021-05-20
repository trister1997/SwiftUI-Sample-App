//
//  TVDetailViewModel.swift
//  Sample TV App
//
//  Created by Tyler Rister on 5/19/21.
//

import Combine
import Foundation

class TVDetailViewModel: ObservableObject {
    @Published var tvShow: TVShowDetails?
    private var cancelBag = Set<AnyCancellable>()
    
    init(showId: Int) {
        NetworkManager.shared.getTvShow(id: showId)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(_):
                    break
                case .finished:
                    break
                }
            }, receiveValue: { [unowned self] show in
                self.tvShow = show
            })
            .store(in: &cancelBag)
    }
    
    deinit {
        cancelBag.forEach { cancellable in
            cancellable.cancel()
        }
    }
}
