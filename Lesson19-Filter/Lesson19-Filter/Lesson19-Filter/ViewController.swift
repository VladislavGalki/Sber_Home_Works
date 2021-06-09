//
//  ViewController.swift
//  Lesson19-Filter
//
//  Created by Владислав Галкин on 08.06.2021.

import UIKit

class ViewController: UIViewController {
    
    let filterHelper = Filter()
    var filteredImage = [UIImage]()
    var selectedImage = UIImage()
    var filterName = String()
    
    lazy var tapGesture: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        return tap
    }()
    
    private lazy var preferencesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "gear"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(openPreferences) , for: .touchUpInside)
        return button
    }()
    
    lazy var pickerView: UIImagePickerController = {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()
    
    lazy var imageView: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.backgroundColor = .lightGray
        image.layer.cornerRadius = 20
        image.addGestureRecognizer(tapGesture)
        image.isUserInteractionEnabled = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.minimumLineSpacing = 10
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(CollectionVIewCell.self, forCellWithReuseIdentifier: CollectionVIewCell.identifier)
        collection.backgroundColor = .secondarySystemBackground
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.delegate = self
        collection.isHidden = true
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let settings = UIBarButtonItem(customView: preferencesButton)
        navigationItem.setRightBarButton(settings, animated: true)
        
        view.addSubview(imageView)
        view.addSubview(collectionView)
        setupUI()
    }
    
    func setupUI() {
        
        let imageLayouts = [
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 400)
        ]
        
        let collectionLayout = [
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 100)
        ]
        NSLayoutConstraint.activate(imageLayouts)
        NSLayoutConstraint.activate(collectionLayout)
    }
    
    @objc func selectImage() {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
        present(pickerView, animated: true, completion: nil)
    }
    
    @objc private func openPreferences() {
        let intensyVC = IntencyViewController()
        intensyVC.modalPresentationStyle = .custom
        intensyVC.transitioningDelegate = self
        intensyVC.intensityValue = { [weak self] value in
            guard let self = self else { return }
            self.imageView.image = self.filterHelper.createPhotoFIlter(image: self.selectedImage, filterName: self.filterName, intensity: value)
        }
        present(intensyVC, animated: true, completion: nil)
    }
}
// MARK: - UIViewControllerTransitioningDelegate
extension ViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
}

//MARK: - CollectionView
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        filterName = filterHelper.filters[indexPath.item]
        navigationItem.title = filterName
        imageView.image = filteredImage[indexPath.item]
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionVIewCell.identifier, for: indexPath) as? CollectionVIewCell else { return UICollectionViewCell() }
        cell.filteredImage.image = filteredImage[indexPath.item]
        return cell
    }
}

//MARK: - UIImagePickerControllerDelegate
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        selectedImage = image
        imageView.image = selectedImage
        
        filteredImage = filterHelper.filters.map({ [self] item in
            filterHelper.createPhotoFIlter(image: selectedImage, filterName: item, intensity: 0.5)
        })
        
        collectionView.isHidden = false
        collectionView.reloadData()
        dismiss(animated: true, completion: nil)
    }
}
