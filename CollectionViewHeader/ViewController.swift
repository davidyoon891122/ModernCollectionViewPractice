//
//  ViewController.swift
//  CollectionViewHeader
//
//  Created by jiwon Yoon on 2023/03/15.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private lazy var topView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        
        return view
    }()
    
    
    private lazy var mainCollectionView: UICollectionView = {
        let layout = createLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.dataSource = self
        
        collectionView.register(FirstCell.self, forCellWithReuseIdentifier: FirstCell.identifier)
        
        return collectionView
    }()
    
    private lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

private var people: [PersonData] = PersonData.allPersonData

private var dataSource: UICollectionViewDiffableDataSource<Int,PersonData>! = nil

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return people.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstCell.identifier, for: indexPath) as? FirstCell else { return UICollectionViewCell() }
        let person = people[indexPath.item]
        cell.setupCell(name: person.name, number: person.number)
        
        return cell
    }
}

private extension ViewController {
    func setupViews() {
        [
            topView,
            mainCollectionView,
            bottomView,
        ]
            .forEach {
                view.addSubview($0)
            }
        
        topView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(200.0)
        }
        
        mainCollectionView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        bottomView.snp.makeConstraints {
            $0.top.equalTo(mainCollectionView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(200.0)
        }
    }
    
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout(sectionProvider: { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50.0)))
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
            let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50.0)), subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            return section
        })
        
        return layout
    }
}

