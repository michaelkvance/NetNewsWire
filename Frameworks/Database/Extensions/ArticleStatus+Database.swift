//
//  ArticleStatus+Database.swift
//  Database
//
//  Created by Brent Simmons on 7/3/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import RSDatabase
import Data

extension ArticleStatus {
	
	convenience init(articleID: String, dateArrived: Date, row: FMResultSet) {
		
		let read = row.bool(forColumn: DatabaseKey.read)
		let starred = row.bool(forColumn: DatabaseKey.starred)
		let userDeleted = row.bool(forColumn: DatabaseKey.userDeleted)
		
//		let accountInfoPlist = accountInfoWithRow(row)
		
		self.init(articleID: articleID, read: read, starred: starred, userDeleted: userDeleted, dateArrived: dateArrived, accountInfo: nil)
	}
	
	func databaseDictionary() -> NSDictionary {
		
		let d = NSMutableDictionary()
		
		d[DatabaseKey.articleID] = articleID
		d[DatabaseKey.read] = read
		d[DatabaseKey.starred] = starred
		d[DatabaseKey.userDeleted] = userDeleted
		d[DatabaseKey.dateArrived] = dateArrived
		
//		if let accountInfo = accountInfo, let data = PropertyListTransformer.data(withPropertyList: accountInfo) {
//			d[DatabaseKey.accountInfo] = data
//		}

		return d.copy() as! NSDictionary
	}
}

extension ArticleStatus: DatabaseObject {
	
	public var databaseID: String {
		get {
			return articleID
		}
	}
}
