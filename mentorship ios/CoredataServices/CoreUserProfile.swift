//
//  CoreUserProfile.swift
//  Created on 27/12/20
//  Created for AnitaB.org Mentorship-iOS
//

import Foundation
import CoreData
import UIKit

class CoreUserProfile {
    
    var HomeUserName = [UserProfileData]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    func NewUserCore(profile: ProfileModel.ProfileData) {
        loadCoredata()
        if (HomeUserName.count != 0 ){
            if(HomeUserName[0].username != profile.name?.capitalized){
                HomeUserName[0].username = profile.name?.capitalized
                HomeUserName[0].id = String(profile.id)
            }
        }
        else{
            let new = UserProfileData(context: context)
            new.username = profile.name!.capitalized
            new.id = String(profile.id)
            HomeUserName.append(new)
        }
        NSLog("printing the profile in coredata \(profile)")
        saveCoredata()
        NSLog("printing count of coredata \(String(HomeUserName.count))")
        NSLog("here we have new user ///// --------------- ///// \(HomeUserName)")
                
        

    }
    
    func test(token: String)  {
        let token = "Bearer " + token
        NSLog("printing token in coreasavedata \(token)")
        
    }
    
    
    func loadCoredata(){
        let request : NSFetchRequest<UserProfileData> = UserProfileData.fetchRequest()
        do{
            try HomeUserName = context.fetch(request)
            NSLog("printing count of coredata \(String(HomeUserName.count))")
            NSLog("here we have new username ///// --------------- ///// \(HomeUserName)")
        }catch{
            NSLog("getting an error in loading data from core \(error)")
        }
    }
    
    func saveCoredata() {
    
        do{
            try context.save()
        }catch{
            NSLog("getting an error in saving coredata of username \(error)")
        }

        
    }

    
}

