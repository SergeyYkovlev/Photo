//
//  PhotoViewModel.swift
//  Photo
//
//  Created by Сергей Яковлев on 22.03.2022.
//

import Foundation
import CollectionViewTools

class MainViewModel {
    let listSectionItems: [GeneralCollectionViewDiffSectionItem]

    init(state: MainState, listItemsFactory: MainListItemsFactory) {
        listSectionItems = listItemsFactory.makeSectionItems(state: state)
    }

}
