import SwiftUI
import Lottie

public struct LoadingLottie: UIViewRepresentable {
    var name: String
    var text: String?
    var bundle: Bundle
    
    public var loopMode: LottieLoopMode = .loop
    public var backgroundColor = UIColor(white: 0.37, alpha: 0.25)
    
    var animationView = LottieAnimationView()
    
    public init(name: String,
                bundle: Bundle,
                text: String? = nil){
        self.name = name
        self.bundle = bundle
        self.text = text
    }
    
    public init(name: String, bundle: Bundle){
        self.name = name
        self.bundle = bundle
        self.text = nil
    }
    
    public init(text: String? = "Loading..."){
        self.name = "loading"
        self.bundle = Bundle.module
        self.text = text
    }
    
    public func makeUIView(context: UIViewRepresentableContext<LoadingLottie>) -> UIView {
        let view = UIView(frame: .zero)
        
        animationView.animation = Animation.named(name, bundle: bundle)
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
        view.backgroundColor = backgroundColor

        if text == nil {
            view.addSubview(subview)
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
            labelView.preferredMaxLayoutWidth = 230
            labelView.sizeToFit()
            subview.addArrangedSubview(labelView)
            view.addSubview(subview)
            NSLayoutConstraint.activate([
                subview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                subview.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                subview.widthAnchor.constraint(equalToConstant: 250),
                animationView.centerXAnchor.constraint(equalTo: subview.centerXAnchor),
                animationView.heightAnchor.constraint(equalToConstant: 100),
                labelView.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
                labelView.centerXAnchor.constraint(equalTo: subview.centerXAnchor)
            ])
        }
        
        return view
    }
    
    public func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LoadingLottie>) {}
}
