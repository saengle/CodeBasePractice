//
//  URLSessionDelegate.swift
//  CodeBasePractice
//
//  Created by 쌩 on 7/2/24.
//

import UIKit

class URLSessionDelegateViewController: UIViewController {
    
    enum Nasa: String, CaseIterable {
        
        static let baseURL = "https://apod.nasa.gov/apod/image/"
        
        case one = "2308/sombrero_spitzer_3000.jpg"
        case two = "2212/NGC1365-CDK24-CDK17.jpg"
        case three = "2307/M64Hubble.jpg"
        case four = "2306/BeyondEarth_Unknown_3000.jpg"
        case five = "2307/NGC6559_Block_1311.jpg"
        case six = "2304/OlympusMons_MarsExpress_6000.jpg"
        case seven = "2305/pia23122c-16.jpg"
        case eight = "2308/SunMonster_Wenz_960.jpg"
        case nine = "2307/AldrinVisor_Apollo11_4096.jpg"
        
        static var photo: URL {
            return URL(string: Nasa.baseURL + Nasa.allCases.randomElement()!.rawValue)!
        }
    }
    
    private let myButton = UIButton()
    private let textLabel = UILabel()
    private let myImageView = UIImageView()
    
    var total: Double = 0 // Image's total Bytes
    var buffer: Data? {
        didSet {
            let result = Double(buffer?.count ?? 0) / total
            textLabel.text = "\(result * 100) / 100"
        }
    }
    
    var session = URLSession()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
        myButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
    
    private func configureUI() {
        [myButton, textLabel, myImageView].forEach{view.addSubview($0)}
        myButton.backgroundColor = .brown
        myButton.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }
        textLabel.backgroundColor = .cyan
        textLabel.snp.makeConstraints { make in
            make.top.equalTo(myButton.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }
        myImageView.backgroundColor = .blue
        myImageView.snp.makeConstraints { make in
            make.top.equalTo(textLabel.snp.bottom).offset(20)
            make.bottom.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            
        }
    }
    
    @objc
    private func buttonClicked() {
        callRequest()
    }
    
    func callRequest() {
        buffer = Data()
        let request = URLRequest(url: Nasa.photo)
        
        session = URLSession(configuration: .default, delegate: self, delegateQueue: .main)
        
        session.dataTask(with: request).resume()
    }
}

extension URLSessionDelegateViewController: URLSessionDataDelegate {
    // MARK: 서버에서 최초로 응답을 받은 경우에 호출됨 (ex. 상태코드)
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse) async -> URLSession.ResponseDisposition {
        print(#function, response)
        if let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) {
            
            // 총 데이터의 양 얻기
            let contentLength = response.value(forHTTPHeaderField: "Content-Length")!
            
            total = Double(contentLength)!
            return .allow
        } else {
            return .cancel
        }
        
    }
        
    
    // MARK:  서버에서 데이터를 받아올 때 나누어서 받아와질때마다 반복적으로 호출 됨
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        buffer?.append(data)
    }
    
    // MARK:  응답이 완료가 될 때 호출됨.
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: (any Error)?) {
        if let error = error {
            textLabel.text = "문제가 발생했습니다."
        } else {
            print("성공") // completionHandler 시점과 동일
            guard let buffer = buffer else {
                print("Buffer nil")
                return
            }
            let image = UIImage(data: buffer)
            myImageView.image = image
        }
    }
}
