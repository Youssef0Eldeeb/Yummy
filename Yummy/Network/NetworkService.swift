//
//  NetworkService.swift
//  Yummy
//
//  Created by Youssef Eldeeb on 04/09/2022.
//

import Foundation
import Alamofire

class NetworkService{
    

//    func fetchDataFromApiByAlamofire(completion: @escaping (AllDishes?,String?) -> Void ){
//            if let url = URL(string: "https://yummie.glitch.me/dish-categories"){
//                let request = AF.request(url,method: .get,encoding: JSONEncoding.default)
//                request.responseJSON { dataResponse in
//                    if let data = dataResponse.data{
//                        let jsonDecoder = JSONDecoder()
//                        if let decodedObj = try? jsonDecoder.decode(Welcome.self, from: data){
//                            print(decodedObj.data?.categories?[0].name)
//                            completion(decodedObj.data,nil)
//
//                        }
//                    }
//                    if let error = dataResponse.error{
//                        completion(nil, error.localizedDescription)
//                    }
//                }
//            }
//        }
//
    
    
    func fetch <T: Decodable>(path: String, responseClass: T.Type, completion:@escaping (Result<T?, NSError>) -> Void){
        let url = "https://yummie.glitch.me/\(path)"
        AF.request(url, method: .get).validate().responseDecodable(of: T.self) { response in
            guard let responseObj = response.value else { return }
            completion(.success(responseObj))
        }
    }
    
    func send <T: Decodable>(name: String, dishId: String, responseClass: T.Type, completion:@escaping (Result<T?, NSError>) -> Void){
        let params = ["name": name]
        let url = "https://yummie.glitch.me/orders/\(dishId)"
        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default).validate().responseDecodable(of: T.self) { response in
            guard let responseObj = response.value else { return }
            completion(.success(responseObj))
        }
    }
    
}
