//
//  MainListItemsFactory.swift
//  Photo
//
//  Created by Сергей Яковлев on 22.03.2022.
//

import CollectionViewTools

final class MainListItemsFactory {

    weak var viewController: PhotoViewController?
    weak var output: PhotoViewOutput?
    var cellItems: [ImageCollectionViewCellItem] = []

    func makeSectionItems(state: PhotoState) -> [GeneralCollectionViewDiffSectionItem] {
        for photo in state.photos {
            let ratio: CGFloat = CGFloat(photo.width) / CGFloat(photo.height)
            let item = ImageCollectionViewCellItem(imageURL: photo.urls.regular,
                                                   ratio: CGFloat(ratio))
            cellItems.append(item)
        }
        let sectionItem = GeneralCollectionViewDiffSectionItem(cellItems: cellItems)
        sectionItem.insets.top = 10
        sectionItem.minimumLineSpacing = 2
        return [sectionItem]
    }
}
