//
//  ViewController.swift
//  TinderUI
//
//  Created by 佐々木駿 on 2019/09/17.
//  Copyright © 2019 shun.sasaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBAction func pangesture(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)
        let xFromCenter = card.center.x - view.center.x
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
    }
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var labelArray:[String] = []
    var colorValiation:[UIColor] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return labelArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SwipeCollectionViewCell
        cell.text.backgroundColor = colorValiation[indexPath.row]
        cell.text.text = labelArray[indexPath.row]
        cell.text.textColor = .white
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let custoLayout = SwipeCustomViewLayout()
        self.collectionView.collectionViewLayout = custoLayout
        self.collectionView.dataSource = self
        self.collectionView!.register(UINib(nibName: "SwipeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        labelArray = ["テスト", "テスト2", "テスト3", "テスト4", "テスト5", "テスト6" ]
        colorValiation = [.black, .red, .green, .blue, .cyan, .yellow]
    }


}

