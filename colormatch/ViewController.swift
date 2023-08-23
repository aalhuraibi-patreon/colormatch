//
//  ViewController.swift
//  colormatch
//
//  Created by Aya Fareed on 8/4/23.
//

import UIKit

class ViewController: UIViewController {

  var redSlider: UISlider!
  var greenSlider: UISlider!
  var blueSlider: UISlider!
  var colorView: UIView!
  var targetColor: UIColor!
  var targetColorView: UIView!
  var redArrow: UIImageView!
  var greenArrow: UIImageView!
  var blueArrow: UIImageView!
  var answerButton: UIButton!
  var newGameButton: UIButton!
  var colorViewCenterXConstraint: NSLayoutConstraint!
  var colorViewCenterYConstraint: NSLayoutConstraint!
  var similarityLabel: UILabel!
  var redLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    colorView = UIView()
    targetColor = generateRandomColor()
    targetColorView = UIView()
    redSlider = UISlider()
    redSlider.minimumValue = 0
    redSlider.maximumValue = 1
    redSlider.value = 0.0

    greenSlider = UISlider()
    greenSlider.minimumValue = 0
    greenSlider.maximumValue = 1
    greenSlider.value = 0.0

    blueSlider = UISlider()
    blueSlider.minimumValue = 0
    blueSlider.maximumValue = 1
    blueSlider.value = 0.0

    redArrow = UIImageView(image: UIImage(systemName: "arrow.down"))
    redArrow.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(redArrow)
    greenArrow = UIImageView(image: UIImage(systemName: "arrow.down"))
    greenArrow.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(greenArrow)
    blueArrow = UIImageView(image: UIImage(systemName: "arrow.down"))
    blueArrow.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(blueArrow)
    redArrow.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
    greenArrow.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
    blueArrow.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
    redArrow.isHidden = true
    greenArrow.isHidden = true
    blueArrow.isHidden = true

    answerButton = UIButton()
    answerButton.setTitle("answer", for: .normal)
    answerButton.setTitleColor(UIColor.white, for: .normal)
    newGameButton = UIButton()
    newGameButton.setTitle("new color", for: .normal)
    newGameButton.setTitleColor(UIColor.white, for: .normal)
    answerButton.backgroundColor = UIColor(red: 255/255, green: 192/255, blue: 203/255, alpha: 1)
    view.addSubview(answerButton)

    newGameButton.backgroundColor = UIColor(red: 255/255, green: 192/255, blue: 203/255, alpha: 1)
    view.addSubview(newGameButton)
    similarityLabel = UILabel()
    similarityLabel.translatesAutoresizingMaskIntoConstraints = false
    similarityLabel.textColor = .black
    similarityLabel.textAlignment = .center
    similarityLabel.text = ""
    view.addSubview(similarityLabel)

    setupViews()

  }

  func setupViews() {
    view.addSubview(targetColorView)
    view.addSubview(colorView)
    view.addSubview(redSlider)
    view.addSubview(greenSlider)
    view.addSubview(blueSlider)

    colorView.translatesAutoresizingMaskIntoConstraints = false
    targetColorView.translatesAutoresizingMaskIntoConstraints = false
    redSlider.translatesAutoresizingMaskIntoConstraints = false
    greenSlider.translatesAutoresizingMaskIntoConstraints = false
    blueSlider.translatesAutoresizingMaskIntoConstraints = false
    answerButton.translatesAutoresizingMaskIntoConstraints = false
    newGameButton.translatesAutoresizingMaskIntoConstraints = false
    redSlider.isUserInteractionEnabled = true
    greenSlider.isUserInteractionEnabled = true
    blueSlider.isUserInteractionEnabled = true

    redSlider.minimumTrackTintColor = UIColor.red
    redSlider.maximumTrackTintColor = UIColor.gray
    redSlider.thumbTintColor = UIColor.white

    greenSlider.minimumTrackTintColor = UIColor.green
    greenSlider.maximumTrackTintColor = UIColor.gray
    greenSlider.thumbTintColor = UIColor.white

    blueSlider.minimumTrackTintColor = UIColor.blue
    blueSlider.maximumTrackTintColor = UIColor.gray
    blueSlider.thumbTintColor = UIColor.white

    redLabel = UILabel()
    redLabel.translatesAutoresizingMaskIntoConstraints = false
    redLabel.text = "red"
    redLabel.textColor = UIColor.red
    let blueLabel = UILabel()
    blueLabel.translatesAutoresizingMaskIntoConstraints = false
    blueLabel.text = "blue"
    blueLabel.textColor = UIColor.blue
    let greenLabel = UILabel()
    greenLabel.translatesAutoresizingMaskIntoConstraints = false
    greenLabel.text = "green"
    greenLabel.textColor = UIColor.green
    view.addSubview(redLabel)
    view.addSubview(blueLabel)
    view.addSubview(greenLabel)

    NSLayoutConstraint.activate([
      targetColorView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
      targetColorView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80),
      targetColorView.widthAnchor.constraint(equalToConstant: 100),
      targetColorView.heightAnchor.constraint(equalToConstant: 100),

      colorView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
      colorView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -80),
      colorView.widthAnchor.constraint(equalToConstant: 100),
      colorView.heightAnchor.constraint(equalToConstant: 100),

      redSlider.topAnchor.constraint(equalTo: colorView.bottomAnchor, constant: 100),
      redSlider.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80),

      greenSlider.topAnchor.constraint(equalTo: redSlider.bottomAnchor, constant: 20),
      greenSlider.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80),

      blueSlider.topAnchor.constraint(equalTo: greenSlider.bottomAnchor, constant: 20),
      blueSlider.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80),


      redSlider.trailingAnchor.constraint(equalTo: colorView.trailingAnchor),
      greenSlider.trailingAnchor.constraint(equalTo: colorView.trailingAnchor),
      blueSlider.trailingAnchor.constraint(equalTo: colorView.trailingAnchor),
      redLabel.centerYAnchor.constraint(equalTo: redSlider.centerYAnchor),
      redLabel.trailingAnchor.constraint(equalTo: redSlider.leadingAnchor, constant: -10),
      blueLabel.centerYAnchor.constraint(equalTo: blueSlider.centerYAnchor),
      blueLabel.trailingAnchor.constraint(equalTo: blueSlider.leadingAnchor, constant: -10),
      greenLabel.centerYAnchor.constraint(equalTo: greenSlider.centerYAnchor),
      greenLabel.trailingAnchor.constraint(equalTo: greenSlider.leadingAnchor, constant: -10),
      answerButton.topAnchor.constraint(equalTo: blueSlider.bottomAnchor, constant: 50),
      answerButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100),
      answerButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
      newGameButton.topAnchor.constraint(equalTo: answerButton.bottomAnchor, constant: 25),
      newGameButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100),
      newGameButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
      similarityLabel.topAnchor.constraint(equalTo: newGameButton.bottomAnchor, constant: 20),
      similarityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      similarityLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
    ])
    targetColorView.backgroundColor = targetColor
    updateColorView()
    redSlider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
    greenSlider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
    blueSlider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
    answerButton.addTarget(self, action: #selector(checkColor), for: .touchUpInside)
    newGameButton.addTarget(self, action: #selector(reset), for: .touchUpInside)

  }

  @objc func reset() {
    print("reset started")
    redSlider.value = 0.0
    greenSlider.value = 0.0
    blueSlider.value = 0.0

    targetColor = generateRandomColor()
    targetColorView.backgroundColor = targetColor

    UIView.animate(withDuration: 0.5) {
      self.colorView.frame = CGRect(x: self.view.bounds.width - 180, y: 160, width: 100, height: 100)
    }

    redArrow.isHidden = true
    greenArrow.isHidden = true
    blueArrow.isHidden = true

    similarityLabel.text = ""

    updateColorView()
    print("reset ended")
  }

  @objc func sliderChanged() {
    print("Slider value changed")
    let red = CGFloat(redSlider.value)
    let green = CGFloat(greenSlider.value)
    let blue = CGFloat(blueSlider.value)
    colorView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
  }

  func generateRandomColor() -> UIColor {
    return UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
  }

  func updateColorView() {
    let color = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    colorView.backgroundColor = color
  }
  @objc func checkColor() {
    print("checkColor started")
    print("Red Slider Value: \(redSlider.value)")
    print("Green Slider Value: \(greenSlider.value)")
    print("Blue Slider Value: \(blueSlider.value)")
    print("ColorView Background Color: \(colorView.backgroundColor ?? UIColor.clear)")

    guard let targetRGB = rgb(color: targetColor), let answerRGB = rgb(color: colorView.backgroundColor ?? UIColor.black) else {
        print("Failed to extract RGB values")
        return
    }

    print("Target RGB: \(targetRGB)")
    print("Answer RGB: \(answerRGB)")

//      guard let answerRGB = rgb(color: colorView.backgroundColor ?? UIColor.black) else {return}
      positionArrow(arrow: redArrow, slider: redSlider, targetValue: targetRGB.red)
      positionArrow(arrow: greenArrow, slider: greenSlider, targetValue: targetRGB.green)
      positionArrow(arrow: blueArrow, slider: blueSlider, targetValue: targetRGB.blue)

      let redDifference = pow(answerRGB.red - targetRGB.red, 2)
      let greenDifference = pow(answerRGB.green - targetRGB.green, 2)
      let blueDifference = pow(answerRGB.blue - targetRGB.blue, 2)
      let distance = sqrt(redDifference + greenDifference + blueDifference)
      let similarityPercentage = (1 - (distance / sqrt(3))) * 100
    print("Calculated Similarity Percentage: \(similarityPercentage)")

      CATransaction.begin()
      UIView.animate(withDuration: 1.0, animations: {
        print("Inside animation block")
          self.colorView.frame = CGRect(x: self.targetColorView.frame.origin.x + 20, y: self.targetColorView.frame.origin.y + 20, width: self.colorView.frame.width, height: self.colorView.frame.height)
          self.view.layoutIfNeeded()
      }) { (completed) in
          if completed {
            print("Animation completed with status: \(completed)")
              UIView.performWithoutAnimation {
                  self.similarityLabel.text = String(format: "Score: %.2f%%", similarityPercentage)
                  self.view.layoutIfNeeded()
              }
          }
      }
      CATransaction.commit()
    print("checkColor ended")
  }

//  @objc func checkColor() {
//    guard let targetRGB = rgb(color: targetColor) else {return}
//    guard let answerRGB = rgb(color: colorView.backgroundColor ?? UIColor.black) else {return}
//    positionArrow(arrow: redArrow, slider: redSlider, targetValue: targetRGB.red)
//    positionArrow(arrow: greenArrow, slider: greenSlider, targetValue: targetRGB.green)
//    positionArrow(arrow: blueArrow, slider: blueSlider, targetValue: targetRGB.blue)
//
//    let redDifference = pow(answerRGB.red - targetRGB.red, 2)
//    let greenDifference = pow(answerRGB.green - targetRGB.green, 2)
//    let blueDifference = pow(answerRGB.blue - targetRGB.blue, 2)
//    let distance = sqrt(redDifference + greenDifference + blueDifference)
////    DispatchQueue.main.async {[weak self] in
////      self?.similarityLabel.text = String(format: "Similarity: %.2f", distance)
////    }
//
//
////    UIView.animate(withDuration: 1.0) {
////      self.colorView.frame = CGRect(x: self.targetColorView.frame.origin.x + 20, y: self.targetColorView.frame.origin.y + 20, width: self.colorView.frame.width, height: self.colorView.frame.height)
//////          self.similarityLabel.text = String(format: "Score: %.2f", ( distance))
////    }
//    CATransaction.begin()
//    UIView.animate(withDuration: 1.0, animations: {
//        self.colorView.frame = CGRect(x: self.targetColorView.frame.origin.x + 20, y: self.targetColorView.frame.origin.y + 20, width: self.colorView.frame.width, height: self.colorView.frame.height)
//      self.view.layoutIfNeeded()
//    }) { (completed) in
//        if completed {
//            let redDifference = pow(answerRGB.red - targetRGB.red, 2)
//            let greenDifference = pow(answerRGB.green - targetRGB.green, 2)
//            let blueDifference = pow(answerRGB.blue - targetRGB.blue, 2)
//            let distance = sqrt(redDifference + greenDifference + blueDifference)
//          let similarityPercentage = (1 - (distance / sqrt(3))) * 100
//
////          self.colorView.backgroundColor = UIColor.cyan
//            self.similarityLabel.text = String(format: "Similarity: %.2f", similarityPercentage)
////          DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
////              self.similarityLabel.text = String(format: "Similarity: %.2f", distance)
////          }
//          UIView.performWithoutAnimation {
//                          self.similarityLabel.text = String(format: "Similarity: %.2f", distance)
//                          self.view.layoutIfNeeded()
//                      }
//        }
//    }
//    CATransaction.commit()
//  }

  func positionArrow(arrow: UIImageView, slider: UISlider, targetValue: CGFloat) {
    let thumbRect = slider.thumbRect(forBounds: slider.bounds, trackRect: slider.trackRect(forBounds: slider.bounds), value: Float(targetValue))
    let thumbCenterX = thumbRect.midX
    arrow.isHidden = false
    arrow.center = CGPoint(x: slider.frame.minX + thumbCenterX, y: slider.frame.minY - 10)
    print("Arrow Position for \(slider): \(slider.frame.minX + thumbCenterX)")
  }

  func rgb(color: UIColor) -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)? {
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 0
    return color.getRed(&red, green: &green, blue: &blue, alpha: &alpha) ? (red, green, blue, alpha) : nil
  }
}

