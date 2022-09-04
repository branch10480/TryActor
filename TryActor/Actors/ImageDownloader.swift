//
//  ImageDownloader.swift
//  TryActor
//
//  Created by Toshiharu Imaeda on 2022/09/04.
//

import Foundation
import UIKit

actor ImageDownloader {
  // アクタなのでアクタ内のプロパティにアクセスできるのは1度に一つの処理だけということが保証される
  var cache: [URL: UIImage] = [:]

  func image(from url: URL) async throws -> UIImage {
    if let cached = cache[url] {
      return cached
    }

    // await とあるように、ここで処理が中断される可能性がある
    let image = try await downloadImage(of: url)

    // ↑の待機状態のあとにプロパティへアクセスしているのでこの場合は安全
    // 待機状態になる前にプロパティへアクセスして状態評価をすると危険
    cache[url] = image
    return image
  }

  private func downloadImage(of url: URL) async throws -> UIImage {
    return UIImage()
  }
}
