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

    private struct Constants {
        static let authorLabelLeftInset: CGFloat = 15
        static let authorLAbelBottomInset: CGFloat = 15
    }

    private(set) lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()

    private(set) lazy var view = UIView()

    private(set) lazy var image = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        addSubview(view)
        addSubview(image)
        addSubview(authorLabel)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {

        authorLabel.configureFrame { maker in
            maker.right()
                .left(inset: Constants.authorLabelLeftInset)
                .bottom(inset: Constants.authorLAbelBottomInset)
                .heightToFit()
        }

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
