//
//  PhotoViewModel.swift
//  Photo
//
//  Created by Сергей Яковлев on 22.03.2022.
//

import Foundation
import CollectionViewTools

class PhotoViewModel {
    let listSectionItems: [GeneralCollectionViewDiffSectionItem]

    init(state: PhotoState, listItemsFactory: MainListItemsFactory) {
        listSectionItems = listItemsFactory.makeSectionItems(state: state)
    }

}
