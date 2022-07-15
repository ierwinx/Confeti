import UIKit

class ViewController: UIViewController {
    
    private let layer = CAEmitterLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        createLayer()
    }

    private func createLayer() {
        
        layer.emitterPosition = CGPoint(x: view.center.x, y: -100)
        
        let colors = [UIColor.red.cgColor, UIColor.green.cgColor, UIColor.white.cgColor]
        
        let cells: [CAEmitterCell] = colors.compactMap { color in
            let cell = CAEmitterCell()
            cell.scale = 0.01
            cell.emissionRange = .pi * 2
            cell.lifetime = 20
            cell.birthRate = 100
            cell.velocity = 150
            cell.color = color
            cell.contents = UIImage(named: "confeti")?.cgImage
            return cell
        }
        
        layer.emitterCells = cells
        
        view.layer.addSublayer(layer)
    }
    
    @IBAction func removeConfetiAction(_ sender: Any) {
        layer.emitterCells = nil
    }
    
}
