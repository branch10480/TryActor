//
//  Sample1.swift
//  TryActor
//
//  Created by Toshiharu Imaeda on 2022/09/04.
//

import Foundation

final class Sample1: Sample {
  private let counter = Counter()

  func execute() {
    Task.detached { [weak self] in
      guard let self = self else { return }
      print("## 1st")
      print(await self.counter.increment())
    }
    Task.detached { [weak self] in
      guard let self = self else { return }
      print("## 2nd")
      print(await self.counter.increment())
    }

    Task.detached { [weak self] in
      await self?.counter.resetSlowly(to: 8)
    }
    Task.detached { [weak self] in
      await self?.counter.resetSlowly(to: 5)
    }
  }
}
