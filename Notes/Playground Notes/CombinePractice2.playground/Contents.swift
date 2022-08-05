import SwiftUI
import Combine

let myLabel = UILabel()

[1, 2, 3].publisher
    .map({ int in
        return "Current value \(int)" // Map integer into string first
    })
    .sink(receiveValue: { string in
        myLabel.text = string // Pass the string to the label
    })

//
let result1 = ["one", "2", "three", "4", "5"].map({ Int($0) }) // Returns array of Int?
print(result1)
let result2 = ["one", "2", "three", "4", "5"].compactMap({ Int($0) }) // In a compact map nil results are dropped -> returns array of Int
print(result2)

["one", "2", "three", "4", "5"].publisher
    .map({ Int($0) }) // Map all the strings to integers while preserving nil
    .replaceNil(with: 0) // replace all the nil values with 0
    .compactMap({$0}) // Unwrap integers
    .sink(receiveValue: { int in
        print(int)
    })

//
let numbers = [1, 2, 3, 4]
let mapped = numbers.map { Array(repeating: $0, count: $0) }
// [[1], [2, 2], [3, 3, 3], [4, 4, 4, 4]]
let flatMapped = numbers.flatMap { Array(repeating: $0, count: $0) } // = to .map + joined(), Flattened the nested arrays to remove one level of nesting
// [1, 2, 2, 3, 3, 3, 4, 4, 4, 4]

//let baseURL = URL(string: "https://www.apple.com")!
//var cancellables = Set<AnyCancellable>() // To hold onto the AnyCancellable that will be created by the sink method
//["/", "/iphone", "/ipad", "/imac"].publisher
//    .setFailureType(to: URLError.self) // This is only needed on iOS 13
//    .flatMap({ path -> URLSession.DataTaskPublisher in
//        let url = baseURL.appendingPathComponent(path)
//        return URLSession.shared.dataTaskPublisher(for: url)
//    })
//    .sink(receiveCompletion: { completion in
//        print("Completed with: \(completion)")
//    }, receiveValue: { result in
//        print(result)
//    }).store(in: &cancellables)

//
[1, 2, 3].publisher
    .print()
    .flatMap(maxPublishers: .max(1), { int in
        return Array(repeating: int, count: 2).publisher
    })
    .sink(receiveValue: { value in
        print("got: \(value)")
    })

//
enum MyError: Error {
    case outOfBounds
}

[1, 2, 3].publisher
    .tryMap({ int in
        guard int < 3 else {
            throw MyError.outOfBounds
        }
        
        return int * 2
    })
    .sink(receiveCompletion: { completion in
        print(completion)
    }, receiveValue: { val in
        print(val)
    })
