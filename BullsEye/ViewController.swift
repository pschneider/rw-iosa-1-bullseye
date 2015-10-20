//
//  ViewController.swift
//  BullsEye
//
//  Created by Patrick Schneider on 18/10/15.
//  Copyright © 2015 Patrick Schneider. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var roundLabel: UILabel!

  var currentValue = 0
  var targetValue = 0
  var score = 0
  var round = 0

  override func viewDidLoad() {
    super.viewDidLoad()
    startNewGame()
    updateLabels()
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }

  @IBAction func showAlert() {
    let difference = abs(currentValue - targetValue)
    var points = 100 - difference

    var title: String
    switch difference {
    case _ where difference == 0:
      title = "Perfect!"
      points += 100
    case let difference where difference < 5:
      title = "You almost had it!"
      if difference == 1 { points += 50 }
    case _ where difference < 10:
      title = "Pretty good!"
    default:
      title = "Not even close...!"
    }
    score += points
    let message = "You scored \(points) points"
    let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
    let action = UIAlertAction(title: "OK", style: .Default, handler: { action in
      self.startNewRound()
      self.updateLabels()
    })

    alert.addAction(action)
    presentViewController(alert, animated: true, completion: nil)
  }

  @IBAction func sliderMoved(sender: UISlider) {
    currentValue = lroundf(sender.value)
  }

  @IBAction func startOver() {
    startNewGame()
    updateLabels()
  }

  func startNewRound() {
    round += 1
    currentValue = 50
    targetValue = 1 + Int(arc4random_uniform(100))
    slider.value = Float(currentValue)

  }

  func updateLabels() {
    targetLabel.text = "\(targetValue)"
    scoreLabel.text = "\(score)"
    roundLabel.text = "\(round)"
  }

  func startNewGame() {
    round = 0
    score = 0
    startNewRound()
  }

}

