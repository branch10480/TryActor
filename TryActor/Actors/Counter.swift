//
//  Counter.swift
//  TryActor
//
//  Created by Toshiharu Imaeda on 2022/09/04.
//

import Foundation

/// Counter アクター
/// クラスと同じく参照型
/// データへの同期アクセスを可能にする
actor Counter {
  var value = 0

  func increment() -> Int {
    value += 1
    return value
  }

  /// 新しい値までインクリメントする
  func resetSlowly(to newValue: Int) {
    print("## Start resetting slowly")
    value = 0
    for _ in 0..<newValue {
      // ここで呼び出す increment() はActor内での呼び出しなので一貫性が保たれる
      print(increment())
    }
  }
}
