//
//  ViewController.swift
//  gaisakovPW1
//
//  Created by IsakovG-HSE on 17.09.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var K1: UIView!
    @IBOutlet weak var K2: UIView!
    
    
    @IBOutlet var views: [UIView]!
    override func viewDidLoad() {
        super.viewDidLoad()
        let angle1: CGFloat = -66 * .pi / 180
        let angle2: CGFloat = 66 * .pi / 180
        K1.transform =  CGAffineTransform(rotationAngle: angle1)
        K2.transform =  CGAffineTransform(rotationAngle: angle2)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func buttonWasPressed(_ sender: Any) {
        let button = sender as? UIButton 
        button?.isEnabled = false
        var colors = generateColors(k: views.count)
        var corners = Array (generateCornres(k: views.count))
        colors.shuffle()
        corners.shuffle()
        UIView.animate(withDuration: 0.35, animations: {
            
            
            for i in 0..<self.views.count {
                self.views[i].layer.cornerRadius = CGFloat(corners[i])
                self.views[i].backgroundColor = colors[i]
            }
        }, completion: { _ in
            button?.isEnabled = true
        })
    }
    func generateColors(k: Int) -> [UIColor] {
        var colors: [UIColor] = []
        // Если коротко, то мне захотелось, чтобы цвета не были слишком
        // похожими, поэтому они находятся на некотором
        // расстоянии друг от друга
        let step = 1.0 / Double(k)
        for i in 0..<k {
            // Добавил небольшую случайность
            // Если я правильно рассчитал, то цвета в теории
            // могут быть близки друк к другу, но
            // это маловероятно (а одинаковыми они не могут быть, поэтому без set)
            let shade = Double(i) * Double(step) + .random(in: 0...step/2.1)
            let color = UIColor( hue: shade, saturation: 0.85, brightness: 0.9, alpha: 1.0)
            colors.append(color)
        }
        return colors
        
        
    }
    func generateCornres(k:Int) -> Set<Double> {
        var corners = Set<Double>()
        while corners.count < k {
            let newCorner: Double = .random(in: 0...25)
            corners.insert(newCorner)
        }
        return corners
    }
    
    
    
}
