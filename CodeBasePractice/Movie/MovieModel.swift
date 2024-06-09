//
//  MovieModel.swift
//  CodeBasePractice
//
//  Created by 쌩 on 6/9/24.
//

import Foundation

// MARK: - Movies
struct Movies: Codable {
    let boxOfficeResult: BoxOfficeResult?
    let faultInfo: FaultInfo?
}

// MARK: - FaultInfo
struct FaultInfo: Codable {
    let message, errorCode: String?
}


// MARK: - BoxOfficeResult
struct BoxOfficeResult: Codable {
    let boxofficeType, showRange: String?
    let dailyBoxOfficeList: [Movie]?
}

struct Movie: Codable {
    let rnum, rank, rankInten: String?
    let rankOldAndNew: RankOldAndNew?
    let movieCD, movieNm, openDt, salesAmt: String?
    let salesShare, salesInten, salesChange, salesAcc: String?
    let audiCnt, audiInten, audiChange, audiAcc: String?
    let scrnCnt, showCnt: String?
    
    enum CodingKeys: String, CodingKey {
        case rnum, rank, rankInten, rankOldAndNew
        case movieCD = "movieCd"
        case movieNm, openDt, salesAmt, salesShare, salesInten, salesChange, salesAcc, audiCnt, audiInten, audiChange, audiAcc, scrnCnt, showCnt
    }
}


enum RankOldAndNew: String, Codable {
    case old = "OLD"
    case new = "NEW"
}
