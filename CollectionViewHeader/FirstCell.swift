//
//  FirstCell.swift
//  CollectionViewHeader
//
//  Created by jiwon Yoon on 2023/03/16.
//

import UIKit
import SnapKit

final class FirstCell: UICollectionViewCell {
    static let identifier = "CollectionViewCell"
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        
        label.numberOfLines = 2
        
        return label
    }()
    
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        [
            nameLabel,
            numberLabel
        ]
            .forEach {
                view.addSubview($0)
            }
        
        let offset: CGFloat = 16.0
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(offset)
            $0.leading.equalToSuperview().offset(offset)
            $0.bottom.equalToSuperview().offset(-offset)
            $0.width.greaterThanOrEqualTo(150.0)
        }
        
        nameLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        
        numberLabel.snp.makeConstraints {
            $0.centerY.equalTo(nameLabel)
            $0.leading.equalTo(nameLabel.snp.trailing).offset(8.0)
            $0.trailing.equalToSuperview().offset(-offset)
        }
        
        return view
    }()
    
    func setupCell(name: String, number: String) {
        nameLabel.text = name
        numberLabel.text = number
        setupViews()
    }
}

private extension FirstCell {
    func setupViews() {
        [
            containerView
        ]
            .forEach {
                contentView.addSubview($0)
            }
        
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
