//
//  VolumeStatus.swift
//  MVBookcase
//
//  Created by itsjagnezi on 28/08/22.
//

import Foundation

enum VolumeStatus: Codable {
	case all
	case missing 
	case bought
	case delivery
	
	static let allValues = [all, missing, bought, delivery]
}
