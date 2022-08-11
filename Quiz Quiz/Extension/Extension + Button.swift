//
//  Extension + Button.swift
//  Quiz Quiz
//
//  Created by Mac on 01.08.2022.
//

import Foundation
import UIKit

extension UIButton {
    func makeAnimation() {
        self.addTarget(self, action: #selector(holdDown), for: .touchUpInside)
        self.addTarget(self, action: #selector(holdInside), for: .touchDown)
    }
    
    @objc func holdInside() {
        
        self.backgroundColor = .lightGray
        self.tintColor = .white
    }
    
    @objc func holdDown() {
        let seconds = 0.3
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.backgroundColor = .white
            self.tintColor = .black
        }
    }
}
