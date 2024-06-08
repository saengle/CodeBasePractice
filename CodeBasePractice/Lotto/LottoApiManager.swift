//
//  LottoApiManager.swift
//  CodeBasePractice
//
//  Created by 쌩 on 6/7/24.
//

import Foundation

import Alamofire

class LottoApiManager {
    
    static func fetchLotto(keyword: Int) -> [LottoModel] {
        let url = (SecureApi.lottoUrl) + String(keyword)
        var myLotto: [LottoModel] = []
        AF.request(url).responseDecodable(of: LottoModel.self) { response in
            switch response.result {
            case .success(let value):
//                print(value, "응답 성공")
                    myLotto.append(value)
            case .failure(let error):
                print(error, "응답 실패")
            }
        }
        return myLotto
    }
    
}
