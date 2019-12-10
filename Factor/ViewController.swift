//
//  ViewController.swift
//  Factor
//
//  Created by Pavlo Pedai on 10/12/19.
//  Copyright © 2019 Pavlo Pedai. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputTextField
            .rx
            .text
            .asObservable()
            .throttle(1.0, scheduler: MainScheduler.instance)
            .map({ (text) -> Int in
                guard let value = text, let intValue = Int(value) else { return 0 }
                return intValue
            })
            .map({ (value) -> String in
                return "\(Factor.factorRecursive(value: value))"
            })
            .bind(to: outputLabel.rx.text)
            .disposed(by: bag)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        inputTextField.becomeFirstResponder()
    }
}

