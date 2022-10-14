import Foundation

extension DispatchQueue {
  static func background(_ task: @escaping () -> ()) {
    DispatchQueue.global(qos: .background).async {
      task()
    }
  }

  static func main(_ task: @escaping () -> ()) {
    DispatchQueue.main.async {
      task()
    }
  }
}
