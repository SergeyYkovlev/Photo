//
//  MainListItemsFactory.swift
//  Photo
//
//  Created by Сергей Яковлев on 22.03.2022.
//

import CollectionViewTools

final class MainListItemsFactory {

    weak var viewController: MainViewController?
    weak var output: MainViewOutput?
    var cellItems: [ImageCollectionViewCellItem] = []

    func makeSectionItems(state: MainState) -> [GeneralCollectionViewDiffSectionItem] {
        for photo in state.photos {
            let ratio: CGFloat = CGFloat(photo.width) / CGFloat(photo.height)
            let item = ImageCollectionViewCellItem(authorName: photo.user.name, viewColor: photo.uiColor, imageURL: photo.urls.regular,
                                                   ratio: CGFloat(ratio))
            cellItems.append(item)
        }
        let sectionItem = GeneralCollectionViewDiffSectionItem(cellItems: cellItems)
        sectionItem.insets.top = 10
        sectionItem.minimumLineSpacing = 2
        return [sectionItem]
    }
}
