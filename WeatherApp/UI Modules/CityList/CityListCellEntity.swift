//
//  CityListCellEntity.swift
//  WeatherApp
//
//  Created by Sai Kishore Swaminathan on 29/06/23.
//

import Foundation
import UIKit


public final class CityListCellEntity: UICollectionViewCell {

    var cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()

    override init(frame: CGRect) {
         super.init(frame: frame)
         setupCell()
     }

     required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
         setupCell()
     }

     private func setupCell() {
         backgroundColor = .gray
         contentView.addSubview(cityLabel)

         NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            cityLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cityLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
         ])
     }
}
