//
//  ViewController.swift
//  Photo
//
//  Created by Сергей Яковлев on 22.03.2022.
//

import Foundation
import UIKit
import CollectionViewTools

protocol MainViewInput: AnyObject {
    func update(with viewModel: MainViewModel, force: Bool, animated: Bool)
}

protocol MainViewOutput: AnyObject {
    func viewDidLoad()
}
class MainViewController: UIViewController {

    private let output: MainViewOutput
    private var viewModel: MainViewModel

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

    init(viewModel: MainViewModel, output: MainViewOutput) {
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

extension MainViewController: MainViewInput, ViewUpdate {
    func update(with viewModel: MainViewModel, force: Bool, animated: Bool) {
        let oldViewModel = self.viewModel
        self.viewModel = viewModel
        view.setNeedsLayout()
        view.layoutIfNeeded()
        func updateViewModel<Value: Equatable>(_ keyPath: KeyPath<MainViewModel, Value>, configurationBlock: (Value) -> Void) {
            update(new: viewModel, old: oldViewModel, keyPath: keyPath, force: force, configurationBlock: configurationBlock)
        }
        collectionViewManager.update(with: viewModel.listSectionItems, animated: animated)
    }
}
