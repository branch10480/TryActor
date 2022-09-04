//
//  ViewController.swift
//  TryActor
//
//  Created by Toshiharu Imaeda on 2022/09/04.
//

import UIKit

class ViewController: UIViewController {
  private var sample: Sample!

  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    sample.execute()
  }

  private func setup() {
    sample = Sample1()
  }
}

