//
//  MultiLabelViewController.swift
//  MixedLanguageApp
//
//  Created by 杨东举 on 2025/3/13.
//

// MultiLabelViewController.swift
import UIKit

// 内容类型枚举
@objc public enum ContentType: Int {
    case type1 = 1
    case type2 = 2
    case type3 = 3
}

@objc public class MultiLabelViewController: UIViewController {
    
    // 三种不同类型的标签
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let statusLabel = UILabel()
    
    // 存储内容类型
    private let contentType: ContentType
    
    // 初始化方法，接受内容类型参数
    @objc public init(contentType: Int) {
        self.contentType = ContentType(rawValue: contentType) ?? .type1
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureLabelsForContentType()
    }
    
    private func setupUI() {
        title = "多标签页面"
        view.backgroundColor = .white
        
        // 配置标题标签
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        view.addSubview(titleLabel)
        
        // 配置描述标签
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.numberOfLines = 0
        view.addSubview(descriptionLabel)
        
        // 配置状态标签
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.textAlignment = .center
        statusLabel.font = UIFont.italicSystemFont(ofSize: 14)
        statusLabel.textColor = .darkGray
        view.addSubview(statusLabel)
        
        // 设置约束
        NSLayoutConstraint.activate([
            // 标题标签约束
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // 描述标签约束
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            // 状态标签约束
            statusLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 50),
            statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            statusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            statusLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func configureLabelsForContentType() {
        switch contentType {
        case .type1:
            titleLabel.text = "类型一标题"
            titleLabel.textColor = .systemBlue
            descriptionLabel.text = "这是类型一的描述文本。这种类型通常用于展示重要信息。"
            statusLabel.text = "状态：活跃"
            
        case .type2:
            titleLabel.text = "类型二标题"
            titleLabel.textColor = .systemGreen
            descriptionLabel.text = "这是类型二的描述文本。这种类型通常用于展示次要信息或辅助内容。"
            statusLabel.text = "状态：待处理"
            
        case .type3:
            titleLabel.text = "类型三标题"
            titleLabel.textColor = .systemOrange
            descriptionLabel.text = "这是类型三的描述文本。这种类型通常用于展示警告或特殊信息。"
            statusLabel.text = "状态：需注意"
        }
    }
    
    // 提供更新所有标签的方法
    @objc public func updateLabels(title: String, description: String, status: String) {
        titleLabel.text = title
        descriptionLabel.text = description
        statusLabel.text = status
    }
    
    // 单独更新标题
    @objc public func updateTitle(_ title: String) {
        titleLabel.text = title
    }
    
    // 单独更新描述
    @objc public func updateDescription(_ description: String) {
        descriptionLabel.text = description
    }
    
    // 单独更新状态
    @objc public func updateStatus(_ status: String) {
        statusLabel.text = status
    }
}
