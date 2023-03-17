//
//  FirstHeader.swift
//  CollectionViewHeader
//
//  Created by jiwon Yoon on 2023/03/17.
//

import UIKit
import SnapKit

final class FirstHeader: UICollectionReusableView {
    static let identifier = "FirstHeader"
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title1)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .label
        label.text = "PhoneBook"
        
        return label
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        [
            titleLabel
        ]
            .forEach {
                view.addSubview($0)
            }
        
        titleLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        return view
    }()
    
    
    func setupCell() {
        setupViews()
    }
}

private extension FirstHeader {
    func setupViews() {
        [
            containerView
        ]
            .forEach {
                addSubview($0)
            }
        
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
