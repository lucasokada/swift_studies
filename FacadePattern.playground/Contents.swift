import UIKit

//Armazena dados do Hotel
struct Hotel {
    
}

//API do hotel
struct HotelBooking {
    static func getHotelForDates(to: Date, from: Date) -> [Hotel]? {
        let hotels = [Hotel]()
        return hotels
    }
    
    static func bookHotel(hotel: Hotel) {
        
    }
}

struct Flight {
    
}

struct FlightBooking {
    static func getFlightForDates(to: Date, from: Date) -> [Flight]? {
        let flights = [Flight]()
        return flights
    }
    
    static func bookFlight(flight: Flight) {
        
    }
}

struct RentalCar {
    
}

struct RentalCarBooking {
    static func getRentalCardForDates(to: Date, from: Date) -> [RentalCar]? {
        let rentalCar = [RentalCar]()
        return rentalCar
    }
    
    static func bookRentalCar(rentalCar: RentalCar) {
        
    }
}

struct TravelFacade {
    var hotels: [Hotel]?
    var flights: [Flight]?
    var cars: [RentalCar]?
    
    init(to: Date, from: Date) {
        hotels = HotelBooking.getHotelForDates(to: to, from: from)
        flights = FlightBooking.getFlightForDates(to: to, from: from)
        cars = RentalCarBooking.getRentalCardForDates(to: to, from: from)
        
        func bookTrip(hotel: Hotel, flight: Flight, car: RentalCar) {
            HotelBooking.bookHotel(hotel: hotel)
            FlightBooking.bookFlight(flight: flight)
            RentalCarBooking.bookRentalCar(rentalCar: car)
        }
    }
}
