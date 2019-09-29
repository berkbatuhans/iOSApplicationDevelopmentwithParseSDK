//
//  ExploreVC.swift
//  ParseServeriOSDemo
//
//  Created by Berk Batuhan ŞAKAR on 23.09.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import UIKit
import MapKit

class ExploreVC: UIViewController {
    
    // MARK: - Properties
    
    var mapView: MKMapView!
    var locationManager: CLLocationManager!
    
    let venues = [
    Venue(title: "Talia Garden", address: "", website: "www.taliagarden.com", type: .restaurants, latitude: 41.1254633, longitude: 29.2562662)]
    var cities: [Venue] = []
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLocationManager()
        configureMapView()
        enableLocationService()
//        fetchLocationOnMap(venues)
        
        if let url = URL(string: "https://gist.githubusercontent.com/ozdemirburak/4821a26db048cc0972c1beee48a408de/raw/4754e5f9d09dade2e6c461d7e960e13ef38eaa88/cities_of_turkey.json") {
           URLSession.shared.dataTask(with: url) { data, response, error in
              if let data = data {
                  do {
                    let res = try JSONDecoder().decode([CityE].self, from: data)
                    res.forEach { (city) in
                        print(city)
                        let annotations = MKPointAnnotation()
                        annotations.title = city.name
                        
                        annotations.coordinate = CLLocationCoordinate2D(latitude: Double(city.latitude)!, longitude: Double(city.longitude)!)
                        self.mapView.addAnnotation(annotations)
//
                    }
                  } catch let error {
                     print(error)
                  }
               }
           }.resume()
        }
        
    
    }
    
    // MARK: - Helper Functions
    
    
    func fetchLocationOnMap(_ venues: [Venue]){
        for venue in venues {
            let annotations = MKPointAnnotation()
            annotations.title = venue.title
            
            annotations.coordinate = CLLocationCoordinate2D(latitude: venue.latitude, longitude: venue.longitude)
            mapView.addAnnotation(annotations)
        }
    }
    
    func configureLocationManager() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
    }
    
    func configureMapView() {
        mapView = MKMapView()
        mapView.showsUserLocation = true
        mapView.delegate = self
        mapView.userTrackingMode = .follow
        
        view.addSubview(mapView)
        mapView.frame = view.frame
    }
    
    func centerMapOnUserLocation(){
        guard let coordinate = locationManager.location?.coordinate else {
            return
        }
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 2000, longitudinalMeters: 2000)
        mapView.setRegion(region, animated: true)
    }
}


// MARK: - MKMapViewDelegate
extension ExploreVC: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        UIView.animate(withDuration: 0.5) {
            //self.centerMapButton.alpha = 1
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else {
            return nil
        }
        
        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            annotationView?.tintColor = UIColor.green
            let button = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = button
        } else {
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }
    
}
extension ExploreVC : CLLocationManagerDelegate {
    
    func enableLocationService() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            print("Kullanıcı bu uygulamanın konum servislerini kullanıp kullanamayacağı konusunda henüz bir seçim yapmamıştır.")
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Bu uygulama konum servislerini kullanmak için yetkili değil.")
        case .denied:
            print("Kullanıcı açıkça bu uygulama için konum servislerinin kullanılmasını reddetti veya konum servisleri şu anda Ayarlar’da devre dışı bırakıldı.")
        case .authorizedAlways:
            print("Bu uygulama herhangi bir zamanda konum hizmetlerini başlatmak için yetkilidir.")
        case .authorizedWhenInUse:
            print("Bu uygulama ön planda çalışırken çoğu konum hizmetini başlatmaya yetkilidir.")
            locationManager.startUpdatingLocation()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        @unknown default:
            print("default error location")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        guard locationManager.location != nil else { return }
        centerMapOnUserLocation()
    }
}
