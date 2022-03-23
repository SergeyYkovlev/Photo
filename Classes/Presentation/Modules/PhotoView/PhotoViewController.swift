//
//  ViewController.swift
//  Photo
//
//  Created by Сергей Яковлев on 22.03.2022.
//

import Foundation
import UIKit
import CollectionViewTools

protocol PhotoViewInput: AnyObject {
    func update(with viewModel: PhotoViewModel, force: Bool, animated: Bool)
}

protocol PhotoViewOutput: AnyObject {
    func viewDidLoad()
}
class PhotoViewController: UIViewController {

    private let output: PhotoViewOutput
    private var viewModel: PhotoViewModel

    private lazy var collectionViewManager: CollectionViewManager = .init(collectionView: collectionView)

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.alwaysBounceVertical = true
        view.contentInsetAdjustmentBehavior = .never
        view.isPrefetchingEnabled = false
        return view
    }()

    init(viewModel: PhotoViewModel, output: PhotoViewOutput) {
        self.viewModel = viewModel
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(collectionView)
        output.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
        collectionView.contentInset = view.safeAreaInsets
        collectionView.scrollIndicatorInsets = collectionView.contentInset
    }
}

extension PhotoViewController: PhotoViewInput, ViewUpdate {
    func update(with viewModel: PhotoViewModel, force: Bool, animated: Bool) {
        let oldViewModel = self.viewModel
        self.viewModel = viewModel
        view.setNeedsLayout()
        view.layoutIfNeeded()
        func updateViewModel<Value: Equatable>(_ keyPath: KeyPath<PhotoViewModel, Value>, configurationBlock: (Value) -> Void) {
            update(new: viewModel, old: oldViewModel, keyPath: keyPath, force: force, configurationBlock: configurationBlock)
        }
        collectionViewManager.update(with: viewModel.listSectionItems, animated: animated)
    }
}
