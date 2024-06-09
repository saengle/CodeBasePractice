//
//  LottoApiManager.swift
//  CodeBasePractice
//
//  Created by 쌩 on 6/7/24.
//

import Foundation

import Alamofire

class LottoApiManager {
    
    static func fetchLotto(keyword: Int, completion: @escaping (LottoModel) -> Void)  {
        let url = (SecureApi.lottoUrl) + String(keyword)
        AF.request(url).responseDecodable(of: LottoModel.self) { response in
            switch response.result {
            case .success(let value):
                completion(value)
            case .failure(let error):
                print(error, "응답 실패")
            }
        }
    }
    
}
