//
//  ViewController.swift
//  TestContextualMenu
//
//  Created by Alvaro Marcos on 16/5/25.
//

import UIKit
import ContextualMenu

class ViewController2: UIViewController {
    // Vista principal que activará el menú contextual
    private let messageView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Vista de emojis (accessoryView)
    private lazy var emojiAccessoryView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .darkGray
        containerView.layer.cornerRadius = 10
        containerView.layer.masksToBounds = true
        
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Añadir emojis
        let emojis = ["😄", "🔥", "😢", "👍", "👎", "🎉", "💯"]
        for emoji in emojis {
            let button = UIButton(type: .system)
            button.setTitle(emoji, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 32)
            button.addTarget(self, action: #selector(onEmojiButtonTapped(_:)), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }
        
        scrollView.addSubview(stackView)
        containerView.addSubview(scrollView)
        
        // Configurar constraints
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            scrollView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            scrollView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            scrollView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 60) // Altura fija para los emojis
        ])
        
        // Configurar tamaño del containerView
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.widthAnchor.constraint(equalToConstant: 300),
            containerView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        return containerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupContextMenu()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(messageView)
        
        // Configurar constraints para la vista del mensaje
        NSLayoutConstraint.activate([
            messageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 30),
            messageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            messageView.widthAnchor.constraint(equalToConstant: 250),
            messageView.heightAnchor.constraint(equalToConstant: 1000)
        ])
    }
    
    private func setupContextMenu() {
        // Añadir interacción de menú contextual
        messageView.addInteraction(
            targetedPreviewProvider: { _ in
                // Usar la misma vista como preview
                return .init(view: self.messageView)
            },
            menuConfigurationProvider: { [weak self] _ in
                guard let self else { return nil }
                return ContextMenuConfiguration(
                    accessoryView: self.emojiAccessoryView,
                    menu: Menu(children: [
                        MenuElement(
                            title: "Reaccionar",
                            handler: { _ in print("Opción de reacción seleccionada") }
                        ),
                        MenuElement(
                            title: "Copiar",
                            handler: { _ in print("Copiar seleccionado") }
                        )
                    ])
                )
            }
        )
    }
    
    @objc private func onEmojiButtonTapped(_ sender: UIButton) {
        guard let emoji = sender.titleLabel?.text else { return }
        print("Emoji seleccionado: \(emoji)")
        // Aquí puedes implementar la lógica para añadir la reacción al mensaje
    }
}
