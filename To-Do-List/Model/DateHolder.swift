//
//  DateHolder.swift
//  To-Do-List
//
//  Created by Afrah Saleh on 18/11/1445 AH.
//

import CoreData
import SwiftUI

class DateHolder: ObservableObject
{
    
    @Published var date = Date()
    @Published var taskItems: [TaskItem] = []
    
    let calender: Calendar = Calendar.current
    
    func moveDate(_ days: Int,_ context: NSManagedObjectContext){
        
        date = calender.date(byAdding: .day, value: days, to: date)!
        refreshTaskItems(context)
        
    }
    
    fileprivate func refreshTaskItems(_ context: NSManagedObjectContext) {
        taskItems = fetchTaskItems(context)
    }
    
    init(_ context: NSManagedObjectContext){
        refreshTaskItems(context)
    }
    
    func saveContext(_ context: NSManagedObjectContext) {
       do {
           try context.save()
           refreshTaskItems(context)
       } catch {
           let nsError = error as NSError
           fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
       }
   }
    
    
    func fetchTaskItems(_ context: NSManagedObjectContext) ->  [TaskItem]
    {
        do
        {
            return try context.fetch(dailyTaskFetch()) as [TaskItem]
        }
        catch let error
        {
            fatalError("Unresolved error \(error)")
        }
    }
    
    func dailyTaskFetch() -> NSFetchRequest<TaskItem> {
        let request = TaskItem.fetchRequest()
        
        request.sortDescriptors = sortOrder()
        request.predicate = predicate()
        return request
    }
    
    private func sortOrder() -> [NSSortDescriptor]
    {
        let completedDateSort = NSSortDescriptor(keyPath: \TaskItem.completedDate, ascending: true)
        let timeSort = NSSortDescriptor(keyPath: \TaskItem.scheduleTime, ascending: true)
        let dueDateSort = NSSortDescriptor(keyPath: \TaskItem.dueDate, ascending: true)

        return [completedDateSort, timeSort, dueDateSort]
    }
    
    private func predicate() -> NSPredicate {
          let startOfDay = calender.startOfDay(for: date)
          let endOfDay = calender.date(byAdding: .day, value: 1, to: startOfDay)!

          return NSPredicate(format: "dueDate >= %@ AND dueDate < %@", startOfDay as NSDate, endOfDay as NSDate)
      }
}
