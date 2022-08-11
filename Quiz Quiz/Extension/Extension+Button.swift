//
//  Extension+Button.swift
//  Quiz Quiz
//
//  Created by Mac on 31.07.2022.
//

import Foundation
import UIKit

extension UIButton {
    func changeColor() {
        
        self.addTarget(self, action: #selector(holdDown), for: .touchDown)
    }
    
    @objc func holdDown() {
        if self.backgroundColor == .white {
            self.backgroundColor = .systemBlue
            self.setTitleColor(.white, for: .normal)
        } else {
            self.backgroundColor = .white
            self.setTitleColor(.systemBlue, for: .normal)
        }
    }
    
    
    func turnResult() -> String {
        if self.backgroundColor == .systemBlue {
            return self.titleLabel?.text ?? ""
        }
        return ""
    }
    
}
