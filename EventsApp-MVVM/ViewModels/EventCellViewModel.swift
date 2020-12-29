//
//  EventCellViewModel.swift
//  EventsApp-MVVM
//
//  Created by Justyna Kowalkowska on 29/12/2020.
//

import UIKit

struct EventCellViewModel {
    
    var yearText: String {
        "1 year"
    }
    
    var monthText: String {
        "2 months"
    }
    
    var weekText: String {
        "3 weeks"
    }
    
    var dayText: String {
        "2 days"
    }
    
    var dateText: String {
        "25 Mar 2020"
    }
    
    var eventName: String {
        "Barbados"
    }
    
    var backgroundImage: UIImage {
        #imageLiteral(resourceName: "new-year")
    }
    
}
