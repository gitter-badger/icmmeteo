//
//  MMTAvtivityIndicator.swift
//  MobileMeteo
//
//  Created by szostakowskik on 27.02.2018.
//  Copyright © 2018 Kamil Szostakowski. All rights reserved.
//

import UIKit
import Foundation

@IBDesignable class MMTActivityIndicator: UIView
{
    // MARK: Properties
    @IBOutlet var messageLabel: UILabel?
    
    @IBInspectable var message: String? {
        didSet { setup(message: message) }
    }
    
    // MARK: Initializers
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        awakeFromNib()
    }
    
    // MARK: Lifecycle methods
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    // MARK: Setup methods
    private func setupView()
    {
        let
        view = loadFromNib()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(view)
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        
        layer.cornerRadius = 10
        clipsToBounds = true
        setup(message: message)
    }
    
    private func setup(message: String?)
    {
        messageLabel?.text = message
        messageLabel?.isHidden = message?.count == 0 || message == nil
    }
}
