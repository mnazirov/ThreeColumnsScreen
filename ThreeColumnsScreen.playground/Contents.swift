//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    // MARK: - Private UI Elements
    private let squareView = UIView()
    private let customBlueView: UIView = {
        let viewColor = UIView()
        viewColor.backgroundColor = UIColor(.blue)
        return viewColor
    }()
    
    private let mainStackView = UIStackView()
    private let twoItemsStackView = UIStackView()
    private let threeItemsStackViews = UIStackView()

        
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        configureUIElements()
    }
    override func viewWillLayoutSubviews() {
        setConstraints()
    }
    
    // MARK: - Configure UI Elements
    private func configureSquareView() {
        squareView.backgroundColor = .lightGray
        view.addSubview(squareView)
    }
    
    private func configureMainStackView() {
        mainStackView.axis = .horizontal
        mainStackView.spacing = 20
        mainStackView.distribution = .fillEqually
        
        mainStackView.addArrangedSubview(createColorView(color: UIColor(.red)))
        mainStackView.addArrangedSubview(twoItemsStackView)
        mainStackView.addArrangedSubview(threeItemsStackViews)
        
        squareView.addSubview(mainStackView)
    }
    
    private func configureTwoItemsStackView() {
        twoItemsStackView.axis = .vertical
        twoItemsStackView.spacing = 20
        twoItemsStackView.distribution = .fill
        
        twoItemsStackView.addArrangedSubview(createColorView(color: UIColor(.blue)))
        twoItemsStackView.addArrangedSubview(customBlueView)
        
    }
    
    private func configureThreeItems() {
        threeItemsStackViews.axis = .vertical
        threeItemsStackViews.spacing = 20
        threeItemsStackViews.distribution = .fillEqually
        
        threeItemsStackViews.addArrangedSubview(createColorView(color: UIColor(.yellow)))
        threeItemsStackViews.addArrangedSubview(createColorView(color: UIColor(.yellow)))
        threeItemsStackViews.addArrangedSubview(createColorView(color: UIColor(.yellow)))
    }
    
    private func configureUIElements() {
        configureSquareView()
        configureMainStackView()
        configureTwoItemsStackView()
        configureThreeItems()
    }
    
    // MARK: - Generation UIView with a specific color
    private func createColorView(color: UIColor) -> UIView {
        let colorView = UIView()
        colorView.backgroundColor = color

        return colorView
    }
    
    
    // MARK: - Setting constraints
    private func setConstraints() {
        squareView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        twoItemsStackView.translatesAutoresizingMaskIntoConstraints = false
        threeItemsStackViews.translatesAutoresizingMaskIntoConstraints = false
        
        let outsideSpacing: CGFloat = 80
        let insideSpasing: CGFloat = 40
        let widthSquareView: CGFloat = view.bounds.width - outsideSpacing
        
        NSLayoutConstraint.activate([
            squareView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            squareView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            squareView.widthAnchor.constraint(equalToConstant: widthSquareView),
            squareView.heightAnchor.constraint(equalToConstant: widthSquareView),
            
            mainStackView.centerXAnchor.constraint(equalTo: squareView.centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: squareView.centerYAnchor),
            mainStackView.widthAnchor.constraint(equalToConstant: widthSquareView - insideSpasing),
            mainStackView.heightAnchor.constraint(equalToConstant: widthSquareView - insideSpasing),
            
            customBlueView.heightAnchor.constraint(equalToConstant: (widthSquareView - insideSpasing - 20) / 3)
        ])
    }
}
PlaygroundPage.current.liveView = MyViewController()
