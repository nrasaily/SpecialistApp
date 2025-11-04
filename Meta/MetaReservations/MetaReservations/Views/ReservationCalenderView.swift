import SwiftUI

// Utility for date formatting


import SwiftUI

struct ReservationCalendar: View {

    @State var reservationDate = Date()

    var body: some View {
        Form {
            HStack {
                DatePicker(
                    selection: $reservationDate, in: Date()...,
                    displayedComponents: [.date, .hourAndMinute]
                ) {}
                Button(action: { print("do something!") }) {
                    HStack {
                        Image(systemName: "arrow.right.circle")
                            
                        Text("Done")
                    }
                }
                .foregroundStyle(.white)
                .padding()
                
                .cornerRadius(8)
                    .background(Color.blue)
                    .padding()
                
            }
            Text("Date is \(reservationDate.formatted(date: .long, time: .complete))")
        }
    }
}

#Preview {
    ReservationCalendar()
}
