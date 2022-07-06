//
//  File.swift
//  
//
//  Created by AlexR on 6/7/22.
//

import SwiftUI
import Lottie

public struct LottieView: UIViewRepresentable {
    var name: String
    var loopMode: LottieLoopMode = .playOnce
    var text: String? = nil
    
    var animationView = AnimationView()
    
    public func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        
        animationView.animation = Animation.named(name)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        let subview = UIStackView(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 100)))
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.backgroundColor = .white
        subview.layer.cornerRadius = 10
        subview.axis = .vertical
        subview.isLayoutMarginsRelativeArrangement = true
        subview.layoutMargins = UIEdgeInsets(top: text == nil ? 0:10, left: 0, bottom: 10, right: 0)
        subview.addArrangedSubview(animationView)
        view.backgroundColor = UIColor(named: "LoadingBackground")
        view.addSubview(subview)

        if text == nil {
            NSLayoutConstraint.activate([
                subview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                subview.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                subview.heightAnchor.constraint(equalToConstant: 100),
                subview.widthAnchor.constraint(equalToConstant: 100),
                animationView.heightAnchor.constraint(equalTo: subview.heightAnchor),
                animationView.widthAnchor.constraint(equalTo: subview.widthAnchor)
            ])
        }else{
            let labelView = UILabel()
            labelView.text = text
            labelView.textAlignment = .center
            labelView.numberOfLines = 0
            labelView.lineBreakMode = .byWordWrapping
            labelView.preferredMaxLayoutWidth = 300
            labelView.sizeToFit()
            subview.addArrangedSubview(labelView)
            NSLayoutConstraint.activate([
                subview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                subview.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                subview.widthAnchor.constraint(equalToConstant: 250),
                animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                animationView.heightAnchor.constraint(equalToConstant: 100),
                animationView.widthAnchor.constraint(equalToConstant: 100),
                labelView.leftAnchor.constraint(equalTo: subview.leftAnchor, constant: 10),
                labelView.rightAnchor.constraint(equalTo: subview.rightAnchor, constant: 10),
                labelView.bottomAnchor.constraint(equalTo: subview.bottomAnchor, constant: 10),
                labelView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        }
        
        
        return view
    }
    
    public func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {}
}

