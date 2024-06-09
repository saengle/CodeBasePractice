//
//  MovieApiManager.swift
//  CodeBasePractice
//
//  Created by 쌩 on 6/9/24.
//

import UIKit

import Alamofire

class MovieApiManager {
    
    func fetchDataAlamofire(query: String, completion: @escaping((Result<Movies, Error>) -> Void)) {
        // Mark:  query를 파라미터 타입의 딕셔너리에 담음
        let parameters = [
            "key" : SecureApi.movieKey,
            "targetDt" : query
        ]
        
        //          let headers: HTTPHeaders = [
        //              "X-Naver-Client-Id": "\(apiID)",
        //              "X-Naver-Client-Secret": "\(apiSecret)"]
        
        // Mark:파라미터에 쿼리를 담고(파라미터 형식의 딕셔너리에 담은)
        // encoding을 JSONEncoding.default로 함
        /*
         * 딕셔너리 형태는 URL뒤에 붙지도 않고, json 형식도 아니다. 따라서 따로 encoding을 해줘야한다.
         * 쿼리 파라미터는 URL 뒤에 붙는다. 따라서 URLEncoding.default이다.
         * Body에 담는 데이터의 타입은 JSON이다. 따라서 Body에 데이터를 담으려면 JSONEncoding.default로 해줘야한다.
         */
        
        AF.request(SecureApi.movieUrl, method: .get, parameters: parameters ,encoding: URLEncoding.default).responseDecodable(of: Movies.self) { response in
            print(response)
            switch response.result {
            case .success(let repositories):
                completion(.success((repositories)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}


