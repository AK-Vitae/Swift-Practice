import SwiftUI
import Combine

[1, 2, 3].publisher.sink(receiveCompletion: { completion in
    switch completion {
    case .finished:
        print("finished succesfully")
    case .failure(let error):
        print(error)
    }
}, receiveValue: { value in
    print("received a value: \(value)")
})

// Publishers with Failure type Never allows for omission of receiveComplettion
[1, 2, 3].publisher.sink(receiveValue: { value in
    print("received a value: \(value)")
})


class User {
    var email = "default"
}

var user = User()

["ak.ramadugu@gmail.com"].publisher.assign(to: \.email, on: user) // only possiuble if the key path we want to assign to belongs to a class

//

let myNotification = Notification.Name("test.customNotification")

func listenToNotifications1() {
    NotificationCenter.default.publisher(for: myNotification)
        .sink(receiveValue: { notification in
            print("Received a notification")
        })
    
    NotificationCenter.default.post(Notification(name: myNotification))
}

listenToNotifications1()
NotificationCenter.default.post(Notification(name: myNotification)) // AnyCancellable is already torn down

var subscription: AnyCancellable?
func listenToNotifications2() {
    subscription = NotificationCenter.default.publisher(for: myNotification)
        .sink(receiveValue: { notification in
            print("Received a notification")
        })
    
    NotificationCenter.default.post(Notification(name: myNotification))
}

listenToNotifications2()
NotificationCenter.default.post(Notification(name: myNotification))

var cancellables = Set<AnyCancellable>()
func listenToNotifications3() {
    NotificationCenter.default.publisher(for: myNotification)
        .sink(receiveValue: { notification in
            print("Received a notification!")
        }).store(in: &cancellables) // Will store AnyCancellable into the set and so the result will not be deallocated and can be used outside
    
    NotificationCenter.default.post(Notification(name: myNotification))
}
