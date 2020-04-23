//
//  DrawView.swift
//  Drawing app
//
//  Created by Trey Winward on 12/4/19.
//  Copyright © 2019 Trey Winward. All rights reserved.
//

import UIKit

class DrawView: UIView {
    var currentLines = [Line]()
    var strokeColor = UIColor.black
    var strokeWidth = Float(10.0)
    var currentLineCap = CGLineCap.round
    
    
    @IBAction func clearButton(_ sender: Any) {
        currentLines.removeAll()
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let drawView = UIGraphicsGetCurrentContext()
            else{
                return
        }
 
        currentLines.forEach { (line) in
            drawView.setStrokeColor(line.color.cgColor)
            drawView.setLineWidth(CGFloat(line.LineWidth))
            drawView.setLineCap(line.LineCap)
            for (i, p) in line.points.enumerated() {
                if i == 0 {
                    drawView.move(to: p)
                } else {
                    drawView.addLine(to: p)
                }
            }
            drawView.strokePath()
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       currentLines.append(Line.init(color: strokeColor, LineWidth: strokeWidth, points: [], LineCap: currentLineCap))
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else{
            return
        }
        
        guard var endLine = currentLines.popLast() else{
            return
        }
        endLine.points.append(point)
        currentLines.append(endLine)
        
        setNeedsDisplay()
    }
    
    
    func setStrokeWidth(width: Float){
        self.strokeWidth = Float(width)
    }
    
    // MARK: - colors
    
    @IBAction func colorBlue(_ sender: UIButton) {
        strokeColor = .blue
    }
    
    @IBAction func colorBlack(_ sender: UIButton) {
        strokeColor = .black
    }
    
    @IBAction func colorGray(_ sender: UIButton) {
        strokeColor = .darkGray
    }
    
    @IBAction func colorGreen(_ sender: UIButton) {
        strokeColor = .green
    }
    
    @IBAction func colorRed(_ sender: UIButton) {
        strokeColor = .red
    }
    
    @IBAction func colorYellow(_ sender: UIButton) {
        strokeColor = .yellow
    }
    
    
    // MARK: - slider
    @IBAction func LineSize(_ sender: UISlider) {
        print(sender.value)
        setStrokeWidth(width: sender.value)
    }
    
    
    @IBAction func RoundLines(_ sender: UIButton) {
        self.currentLineCap = .round
    }
    
    
    @IBAction func SquareLines(_ sender: UIButton) {
        self.currentLineCap = .square
    }
    
    
    
}
