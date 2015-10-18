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

  override func viewDidLoad() {
    super.viewDidLoad()
    startNewRound()
    updateLabels()
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }

  @IBAction func showAlert() {
    let difference = abs(currentValue - targetValue)
    let points = 100 - difference
    score += points

    let message = "You scored \(points) points"
    let alert = UIAlertController(title: "Hello, World", message: message, preferredStyle: .Alert)
    let action = UIAlertAction(title: "OK", style: .Default, handler: nil)

    alert.addAction(action)
    presentViewController(alert, animated: true, completion: nil)

    startNewRound()
    updateLabels()
    }

    @IBAction func sliderMoved(sender: UISlider) {
      currentValue = lroundf(sender.value)
    }

}

