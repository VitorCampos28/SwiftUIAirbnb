//
//  ListingDetailView.swift
//  ProjetoSwiftUI
//
//  Created by Vitor Campos on 30/10/23.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    let listing: Listing
    @State private var cameraPosition: MapCameraPosition
    
    init(listing: Listing) {
        self.listing = listing
        
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: listing.latitude, longitude: listing.longitude), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        self._cameraPosition = State(initialValue: .region(region))
    }
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                ListingImageCarouselView(listing: listing)
                    .frame(height: 320)
                
                Button(action: {dismiss()}, label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background{
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(32)
                })
            }
            
            VStack(alignment: .leading, spacing: 8, content: {
                Text(listing.title)
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading, content: {
                    RatingView(withReviews: true, rating: listing.rating)
                        .foregroundStyle(.black)
                    
                    Text("\(listing.city), \(listing.state)")
                })
                .font(.caption)
            })
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            //host info view
            HStack(content: {
                VStack(alignment: .leading, spacing: 4,content: {
                    Text("Entire \(listing.type.description) hosted by \(listing.ownerName)")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                    
                    HStack(spacing: 2, content: {
                        Text("\(listing.numbersOfguests) guests - ")
                        Text("\(listing.numberOfBedrooms) bedrooms - ")
                        Text("\(listing.numbersOfBeds) beds - ")
                        Text("\(listing.numbersOfBethrooms) baths")
                    })
                    .font(.caption)
                })
                .frame(width: 300, alignment: .leading)
                
                Spacer()
                
                Image(listing.ownerImageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            })
            .padding()
            
            Divider()
            
            // listing features
            VStack(alignment: .leading, spacing: 16, content: {
                ForEach(listing.features) { feature in
                    HStack(spacing: 12, content: {
                        Image(systemName: feature.ImageName)
                        
                        VStack(alignment: .leading, content: {
                            Text(feature.title)
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text(feature.subTitle)
                                .font(.caption)
                                .foregroundStyle(.gray)
                        })
                        Spacer()
                    })
                }
            })
            .padding()
            
            Divider()
            
            // beedrooms view
            VStack(alignment: .leading, content: {
                Text("Where you'll sleep")
                    .font(.headline)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16, content: {
                        ForEach(1 ... listing.numberOfBedrooms, id: \.self) { bedroom in
                            VStack {
                                Image(systemName: "bed.double")
                                
                                Text("Bedroom \(bedroom)")
                            }
                            .frame(width: 132, height: 100)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.gray)
                            }
                        }
                    })
                }
                .scrollTargetBehavior(.paging)
            })
            .padding()
            
            Divider()
            
            // listing amenities
            VStack(alignment: .leading, spacing: 16, content: {
                Text("What this place offers")
                    .font(.headline)
                
                ForEach( listing.amenities ) { amenity in
                    HStack {
                        Image(systemName: amenity.imageName)
                            .frame(width: 32)
                        
                        Text(amenity.title)
                            .font(.footnote)
                        
                        Spacer()
                    }
                }
            })
            .padding()
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16, content: {
                Text("Where you'll be")
                    .font(.headline)
                
                Map(position: $cameraPosition)
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            })
            .padding()
        }
        .ignoresSafeArea()
        .toolbar(.hidden, for: .tabBar)
        .padding(.bottom, 64)
        .overlay(alignment: .bottom) {
            VStack {
                Divider()
                    .padding(.bottom)
                
                HStack {
                    VStack(alignment: .leading, content: {
                        Text("$\(listing.pricePerNight * listing.numberOfNights)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("Total before taxes")
                            .font(.footnote)
                        let (day, lastDay, month) = self.getCurrentDay(endDate: listing.numberOfNights)
                        Text("\(month) \(day) - \(lastDay)")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                    })
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Reserve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.horizontal, 32)
            }
            .background(.white)
        }
    }
}

extension ListingDetailView {
    func getCurrentDay(endDate: Int) -> (String, String, String) {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .month], from: Date())
        
        if let day = components.day, let month = MounthLabel(rawValue: components.month ?? 1) {
            return ("\(day)", "\(day + endDate)", "\(month)")
        }
        return ("", "", "")
    }
}

#Preview {
    ListingDetailView(listing: DeveloperPreview().listings[0])
}
