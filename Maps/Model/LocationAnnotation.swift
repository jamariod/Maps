//
//  LocationAnnotation.swift
//  Maps
//
//  Created by Jamario Davis on 7/21/20.
//

import Foundation
import MapKit

class LocationAnnotation: NSObject, MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    
    init(title: String, coordinate: CLLocationCoordinate2D){
        self.title = title
        self.coordinate = coordinate
    }
}
