//
//  ViewController.swift
//  SimpleCounter
//
//  Created by Кирилл Серебрянный on 08.12.2024.
//

import UIKit

let COUNTER_PREFIX_TEXT = "Значение счётчика: "

class ViewController: UIViewController {
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var logTextView: UITextView!

    let feedback = UIImpactFeedbackGenerator(style: .light)
    let dateFormatter = DateFormatter()

    var counterValue = 0 {
        didSet {
            counterLabel.text =
                counterValue == 0
                ? String(0) : COUNTER_PREFIX_TEXT + String(counterValue)
        }
    }
    var log = [String()] {
        didSet {
            logTextView.text = log.joined(separator: "\n")
            let range = NSMakeRange(logTextView.text.count - 1, 1)
            logTextView.scrollRangeToVisible(range)
        }
    }

    @IBAction func didPressInButton() {
        feedback.impactOccurred()
    }
    @IBAction func didPressOutMinusButton() {
        if counterValue > 0 {
            counterValue -= 1
            logEvent("значение изменено на -1")
            return
        }
        logEvent("попытка уменьшить значение счётчика ниже 0")
    }
    @IBAction func didPressOutPlusButton() {
        counterValue += 1
        logEvent("значение изменено на +1")
    }
    @IBAction func didPressOutResetButton() {
        if (counterValue == 0) {
            return
        }
        counterValue = 0
        logEvent("значение сброшено")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.alpha = 0
        counterValue = 0
        log.append("История изменений:")
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "HH:mm:ss dd.MM.yyyy"
    }

    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        UIView.animate(
            withDuration: 2.0,
            animations: {
                self.containerView.alpha = 1
            })
    }
    
    private func logEvent(_ event: String) {
        let date = dateFormatter.string(from: Date())
        log.append("\(date) \(event)")
    }

}
