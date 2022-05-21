//
//  StarViewController.swift
//  paintApp
//
//  Created by Abi on 13.05.2022.
//

import UIKit

class StarViewController: UIViewController {
    
    @IBOutlet weak var starView: StarView!
    
    @IBAction func cornerRadiusSliderDidSlide(_ sender: UISlider) {
        starView.cornerRadius = CGFloat(sender.value)
    }

    @IBAction func rotationSliderDidSlide(_ sender: UISlider) {
        starView.rotation = CGFloat(sender.value)
    }
}
