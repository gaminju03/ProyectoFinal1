//
//  Webservices.swift
//  ProyectoFinal
//
//  Created by Juan on 21/04/20.
//  Copyright © 2020 usuario. All rights reserved.
//

import Foundation

class Webservices {
    func getPosts(completion: @escaping ([Post]?) ->()){
       // guard let url = URL (string: "https://jsonplaceholder.typicode.com/posts") else{
        guard let url = URL (string: "https://api.punkapi.com/v2/beers?beer_name=all") else{
            fatalError("Invalid URL")
            
        }
        
        
        
        URLSession.shared.dataTask(with: url){ data, response,error in
            
            guard let data = data, error == nil else {
                
               DispatchQueue.main.async {
                    completion(nil)
               }
             
                return
            }

            
           let posts = try? JSONDecoder().decode([Post].self, from: data)
            DispatchQueue.main.async {
                 completion(posts)
            }
           
        }.resume()
    }
}


