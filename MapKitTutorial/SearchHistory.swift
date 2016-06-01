//
//  SearchHistory.swift
//  MapKitTutorial
//
//  Created by Robert Chen on 6/1/16.
//  Copyright © 2016 Thorn Technologies. All rights reserved.
//

import Foundation

struct SearchHistory {
    static let searchHistoryArrayKey = "searchHistoryArrayKey"

    static var searchHistory: [String] {
        let defaults = NSUserDefaults.standardUserDefaults()
        guard let searchHistoryArray: [String] = defaults.arrayForKey(searchHistoryArrayKey) as? [String] else { return [] }
        return Array(Set(searchHistoryArray))
    }
    
    static func appendSearchTerm(searchString: String) {
        var searchHistoryArray = SearchHistory.searchHistory
        searchHistoryArray.append(searchString)
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(searchHistoryArray, forKey: searchHistoryArrayKey)
        defaults.synchronize()
    }

}