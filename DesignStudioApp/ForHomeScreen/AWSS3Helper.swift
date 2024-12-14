//
//  AWSS3Helper.swift
//  DesignStudioApp
//
//  Created by Suleman Abrar on 06/12/2024.
//


//import S3
//import NIO


//class AWSS3Helper {
//    
//    let bucket = AWSConstants().bucket
//    let s3 = S3(accessKeyId: AWSConstants().accessKeyId, secretAccessKey: AWSConstants().secretAccessKey, region: AWSConstants().region)
//        
//    func uploadImage(_ image: UIImage, sender: UIViewController, completion: @escaping (String?) -> ()) {
//        
//        // check internet connection
//        let reachibility = try! Reachability()
//        if reachibility.connection == .unavailable {
//            sender.showAlert(title: "", message: "No Internet Connection")
//            completion(nil)
//            return
//        }
//        
//        guard let imageData = image.jpegData(compressionQuality: 1) else {
//            completion(nil)
//            return
//        }
//        
//        let uuid = UUID().uuidString
//        let fileName = "\(uuid).jpeg"
//        
//        // Put an Object
//        let putObjectRequest = S3.PutObjectRequest(acl: .publicRead,
//                                                   body: imageData,
//                                                   bucket: bucket,
//                                                   contentLength: Int64(imageData.count),
//                                                   key: fileName)
//        
//        let futureOutput = s3.putObject(putObjectRequest)
//        
//        futureOutput.whenSuccess({ (response) in
//            print(response)
//            completion(fileName)
//        })
//        
//        futureOutput.whenFailure({ (error) in
//            print(error)
//            completion(nil)
//        })
//        
//    }
//    
//}
