//
//  VolumeStatus.swift
//  MVBookcase
//
//  Created by Jonas Agnezi on 28/08/22.
//

import Foundation

enum VolumeStatus: Codable {
	case missing 
	case bought
	case delivery
	
	static let allValues = [missing, bought, delivery]
}
