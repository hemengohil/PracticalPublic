//
//  TableArticales+Helper.swift
//  DRCPractical
//
//  Created by Hemen on 09/03/22.
//

import Foundation
import CoreData

typealias ArticlesCDM = TableArticales

extension ArticlesCDM{
    
    static var allArticles: [ArticlesCDM]?{
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: String(describing: TableArticales.self))
        if let arrTblRecorded = try? DatabaseHelper.shared.context.fetch(fetchRequest){
            return (arrTblRecorded as? [TableArticales])
        }
        return nil
    }
    
    static func fetchTitle(title:String) -> TableArticales? {
        let userFetchid: NSFetchRequest<TableArticales> = TableArticales.fetchRequest()
        userFetchid.predicate = NSPredicate(format: "title == %@", title)
        let arrlist = try? CoreDataStack.shared.managedContext.fetch(userFetchid)
        if (arrlist?.count)! > 0 {
            return arrlist?.first
        }
        return nil
    }
    
    static func createUser(author:String?, title:String?, newsURL:String?, newsImage:String?, newsDate:String?) -> Bool?{
        
        var tblRecordedTemp : TableArticales?
        if let uTitle = title,let object = fetchTitle(title: uTitle) {
            tblRecordedTemp = object
        }else if let tblRecorded = NSEntityDescription.insertNewObject(forEntityName: String(describing: TableArticales.self), into: DatabaseHelper.shared.context) as? TableArticales {
            tblRecordedTemp = tblRecorded
        }
        if let tblRecorded = tblRecordedTemp {
            tblRecorded.author = author
            tblRecorded.title = title
            
            tblRecorded.newsURL = newsURL
            tblRecorded.newsImage = newsImage
            tblRecorded.newsDate = Date()

            CoreDataStack.shared.saveContext()
            return true
        }
        return false
    }

    static func createArtical(dict: NSDictionary){
        
        guard let author = dict.value(forKey: "author") as? String else {
            return
        }
        guard let title = dict.value(forKey: "title") as? String  else {
            return
        }
        guard let newsURL = dict.value(forKey: "url") as? String  else {
            return
        }
        guard let newsImage = dict.value(forKey: "urlToImage") as? String  else {
            return
        }
        guard let newsDate = dict.value(forKey: "publishedAt") as? String  else {
            return
        }
        if let isSuccess = ArticlesCDM.createUser(author: author, title: title, newsURL: newsURL, newsImage: newsImage, newsDate: newsDate){
            print("Success DB \(isSuccess)")
        }
        
    }

}
