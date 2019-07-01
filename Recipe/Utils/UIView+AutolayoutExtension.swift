//
//  UIView+AutolayoutExtension.swift
//  
//
//  Created by Suryakant Sharma on 09/06/19.
//  Copyright © 2019 Suryakant Sharma. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func fillSuperview() {
        anchor(top: superview?.safeAreaLayoutGuide.topAnchor, leading: superview?.safeAreaLayoutGuide.leadingAnchor, bottom: superview?.safeAreaLayoutGuide.bottomAnchor, trailing: superview?.safeAreaLayoutGuide.trailingAnchor)
    }
    
    func anchorSize(to view: UIView,padding: CGFloat = 0) {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant:padding),
            heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, constant:padding)
        ])
    }
    
    func anchorWidth(widthAnchor:NSLayoutDimension, heightAnchor: NSLayoutDimension,padding: CGFloat = 0) {
        widthAnchor.constraint(equalTo: widthAnchor, constant:padding)
        
    }
    
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    
}
