//
//  CollectionViewToolsCell.swift
//  Photo
//
//  Created by Сергей Яковлев on 22.03.2022.
//

import Foundation
import Framezilla
import CollectionViewTools

final class ImageCollectionViewCell: UICollectionViewCell {

    private(set) lazy var view = UIView()

    private(set) lazy var image = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        addSubview(view)
        addSubview(image)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {

        view.configureFrame { maker in
            maker.top()
                .bottom()
                .right()
                .left()
        }

        image.configureFrame { maker in
            maker.top()
                .bottom()
                .left()
                .right()
        }
    }
}
