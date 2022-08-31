//
//  LottieDownloadViewController.swift
//  cs-zadatak1
//
//  Created by Ana Ljubek on 23.08.2022..
//

import UIKit
import Lottie

enum DownloadKeyFrames: CGFloat{
    case startProgress = 140
    case endProgress = 187
    case completion = 240
}

class LottieDownloadViewController: UIViewController {
    
    weak var coordinator: LottieDownloadCoordinator?
    
    // UIView u nibu --> custom class: AnimationView
    // u nibu promijeniti naziv animacije
    
    @IBOutlet weak var anvProgressAnimation: AnimationView!
    @IBOutlet weak var anbLikeButton: AnimatedButton!
    @IBOutlet weak var ansSwitch: AnimatedSwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        anvProgressAnimation.backgroundColor = .clear
        
        startProgress()
        
        anbLikeButton.backgroundColor = .clear
        anbLikeButton.animation = Animation.named("like-button")
        anbLikeButton.setPlayRange(fromProgress: 12/51, toProgress: 1, event: .touchUpInside)
        
        ansSwitch.backgroundColor = .clear
        ansSwitch.animationSpeed = 3
        ansSwitch.animation = Animation.named("switch")
        ansSwitch.setProgressForState(fromProgress: 0, toProgress: 0.5, forOnState: true)
        ansSwitch.setProgressForState(fromProgress: 0.5, toProgress: 1, forOnState: false)
    }
    
    func startProgress(){
        anvProgressAnimation.play(fromFrame: 0, toFrame: DownloadKeyFrames.startProgress.rawValue, loopMode: .none){ (_) in
            //self.download()
        }
    }
    
    func startDownload(){
        anvProgressAnimation.play(fromFrame: DownloadKeyFrames.startProgress.rawValue, toFrame: DownloadKeyFrames.endProgress.rawValue, loopMode: .none){ (_) in
            self.endProgress()
        }
    }
    
    func progress(to progress: CGFloat){
        let progressRange = DownloadKeyFrames.endProgress.rawValue - DownloadKeyFrames.startProgress.rawValue
        let progressFrame = progressRange * progress
        let currentFrame = progressFrame + DownloadKeyFrames.startProgress.rawValue
        
        anvProgressAnimation.currentFrame = currentFrame
    }
    
    func endProgress(){
        anvProgressAnimation.play(fromFrame: DownloadKeyFrames.endProgress.rawValue, toFrame: DownloadKeyFrames.completion.rawValue, loopMode: .none){ (_) in
            
        }
    }
    
    deinit{
        print("deinit \(self)")
    }
}
/*
extension LottieDownloadViewController: URLSessionDownloadDelegate{
    func download() {
        // 1. URL to download from
        let url = URL(string: "https://archive.org/download/SampleVideo1280x7205mb/SampleVideo_1280x720_5mb.mp4")!
      
        // 2. Setup download task and start download
        let configuration = URLSessionConfiguration.default
        let operationQueue = OperationQueue()
        let session = URLSession(configuration: configuration, delegate: self, delegateQueue: operationQueue)
        let downloadTask = session.downloadTask(with: url)
        downloadTask.resume()
    }
    
    // handles download progress
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
      
        let percentDownloaded: CGFloat = CGFloat(totalBytesWritten) / CGFloat(totalBytesExpectedToWrite)
        
        DispatchQueue.main.async {
            self.progress(to: percentDownloaded)
        }
      }
      
    // finishes download
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        DispatchQueue.main.async {
            self.endProgress()
        }
    }
}
*/
