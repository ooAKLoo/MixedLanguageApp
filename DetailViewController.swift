//
//  DetailViewController.swift
//  MixedLanguageApp
//
//  Created by 杨东举 on 2025/3/13.
//

// DetailViewController.swift
import UIKit

@objc class DetailViewController: UIViewController {
    
    private let messageLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = "详情页面"
        view.backgroundColor = .white
        
        // 配置消息标签
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        messageLabel.font = UIFont.systemFont(ofSize: 18)
        messageLabel.text = "等待状态更新..."
        
        view.addSubview(messageLabel)
        
        // 设置约束
        NSLayoutConstraint.activate([
            messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    // 提供给 Objective-C 调用的更新消息方法
    @objc public func updateMessage(withText text: String) {
        // 确保在主线程上更新 UI
        DispatchQueue.main.async { [weak self] in
            self?.messageLabel.text = text
        }
    }
}
