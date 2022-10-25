//
//  UILoadingLottie.swift
//  
//
//  Created by AlexR on 12/7/22.
//

import UIKit
import Lottie

public class UILoadingLottie: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var animationView: LottieAnimationView!
    @IBOutlet weak var text: UILabel!
    
    public var name: String = "loading"
    public var bundle: Bundle = Bundle.module
    public var loadingText: String = "Loading..."{
        didSet{
            text.text = loadingText
        }
    }
    
    public var loopMode: LottieLoopMode = .loop
    public var backgroundLayer = UIColor(white: 0.37, alpha: 0.25)
        
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.module.loadNibNamed("UILoadingLottie", owner: self, options: nil)
        contentView.fixInView(self)
        self.backgroundColor = backgroundLayer
        configureAnimation()
        configureLabel()
    }
    
    private func configureAnimation(){
        animationView.animationSpeed = 1
        animationView.loopMode = loopMode
        animationView.play()
    }
    
    private func configureLabel(){
        text.preferredMaxLayoutWidth = 300
        text.sizeToFit()
    }
}

extension UIView {
    func fixInView(_ container: UIView!) -> Void{
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame;
        container.addSubview(self);
        
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: container.topAnchor),
            self.leftAnchor.constraint(equalTo: container.leftAnchor),
            self.rightAnchor.constraint(equalTo: container.rightAnchor),
            self.bottomAnchor.constraint(equalTo: container.bottomAnchor)

        ])
    }
}


//private func loadLottie(){
//
//    let view = UIView(frame: self.view.frame)
//
//        animationView.animation = Animation.named(name, bundle: Bundle.main)
//        animationView.contentMode = .scaleAspectFit
//        animationView.loopMode = loopMode
//        animationView.play()
//
//        animationView.translatesAutoresizingMaskIntoConstraints = false
//
//        let subview = UIStackView(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 100)))
//        subview.translatesAutoresizingMaskIntoConstraints = false
//        subview.backgroundColor = .white
//        subview.layer.cornerRadius = 10
//        subview.axis = .vertical
//        subview.isLayoutMarginsRelativeArrangement = true
//        subview.layoutMargins = UIEdgeInsets(top: text == nil ? 0:10, left: 0, bottom: 10, right: 0)
//        subview.addArrangedSubview(animationView)
//        view.backgroundColor = backgroundColor
//        view.addSubview(subview)
//
//        if text == nil {
//            NSLayoutConstraint.activate([
//                subview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                subview.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//                subview.heightAnchor.constraint(equalToConstant: 100),
//                subview.widthAnchor.constraint(equalToConstant: 100),
//                animationView.heightAnchor.constraint(equalTo: subview.heightAnchor),
//                animationView.widthAnchor.constraint(equalTo: subview.widthAnchor)
//            ])
//        }else{
//            let labelView = UILabel()
//            labelView.text = text
//            labelView.textAlignment = .center
//            labelView.numberOfLines = 0
//            labelView.lineBreakMode = .byWordWrapping
//            labelView.preferredMaxLayoutWidth = 300
//            labelView.sizeToFit()
//            subview.addArrangedSubview(labelView)
//            NSLayoutConstraint.activate([
//                subview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                subview.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//                subview.widthAnchor.constraint(equalToConstant: 250),
//                animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                animationView.heightAnchor.constraint(equalToConstant: 100),
//                labelView.leftAnchor.constraint(equalTo: subview.leftAnchor, constant: 10),
//                labelView.rightAnchor.constraint(equalTo: subview.rightAnchor, constant: 10),
//                labelView.bottomAnchor.constraint(equalTo: subview.bottomAnchor, constant: 10),
//                labelView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//            ])
//        }
//
//    self.view.addSubview(view)
//}
