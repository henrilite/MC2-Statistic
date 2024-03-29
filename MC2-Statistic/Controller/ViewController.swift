//
//  ViewController.swift
//  MC2-Statistic
//
//  Created by Henri Lie Jaya on 06/07/19.
//  Copyright © 2019 Henri Lie Jaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var collectionNumber   = ["1","2","3","4","5","6","7","8","9","10"]
    var handlingData = [["5","40","15","25"],["51","40","15","25"],["3","3","3","3"],["4","4","4","4"],["4","4","4","4"]]
    lazy var statisticModel: StatisticModel = StatisticModel()
    var dataStatistic = [Statistic]()
    let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
   
    
//        var tableDataTitle = ["Total Game","Total Strike", "Right Handling", "Wrong Handling"]
    
    @IBOutlet weak var button1Tapped: StatisticButton!
    @IBOutlet weak var button2Tapped: StatisticButton!
    @IBOutlet weak var button3Tapped: StatisticButton!
    @IBOutlet weak var button4Tapped: StatisticButton!
    @IBOutlet weak var button5Tapped: StatisticButton!
    @IBOutlet weak var buttonAllTapped: StatisticButton!
    
    @IBOutlet weak var chartView: UIView!
    
    @IBOutlet weak var handlingView: UIView!
    
    @IBOutlet weak var swingTitle: UILabel!
    
    @IBOutlet weak var rightHandlingTitle: UILabel!
    @IBOutlet weak var wrongHandlingTitle: UILabel!
    
    @IBOutlet weak var rightHandlingCount: UILabel!
    @IBOutlet weak var wrongHandlingCount: UILabel!
    
    @IBOutlet weak var popupButtonOutlet: StatisticButton!
    
//    @IBOutlet weak var detailTableView: UITableView!
    
    @IBOutlet var popupView: UIView!
    @IBOutlet weak var popupCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        detailTableView.delegate    = self
//        detailTableView.dataSource  = self
        
        popupCollectionView.delegate    = self
        popupCollectionView.dataSource  = self
        
        view.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        
//        displayData(statisticModel.getData(Index: 0))
        loadViewFunc()
        
        button1Tapped.backgroundColor = .white
        button2Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button3Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button4Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button5Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        buttonAllTapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        
        button1Tapped.tintColor         = .black
        button2Tapped.tintColor         = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1180436644)
        button3Tapped.tintColor         = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1180436644)
        button4Tapped.tintColor         = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1180436644)
        button5Tapped.tintColor         = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1180436644)
        buttonAllTapped.tintColor       = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1180436644)
        
        handlingView.backgroundColor = #colorLiteral(red: 0.137254902, green: 0.137254902, blue: 0.2509803922, alpha: 1)
        handlingView.layer.cornerRadius = 20
        
        swingTitle.textColor = .white
        
        rightHandlingTitle.textColor = #colorLiteral(red: 0.3568627451, green: 0.9607843137, blue: 0.7529411765, alpha: 1)
        wrongHandlingTitle.textColor = #colorLiteral(red: 0.9607843137, green: 0.3568627451, blue: 0.3568627451, alpha: 1)
        
        rightHandlingCount.textColor = .white
        rightHandlingCount.textAlignment = .center
        rightHandlingCount.text = statisticModel.valueNumberData[0][2]
        
        wrongHandlingCount.textColor = .white
        wrongHandlingCount.textAlignment = .center
        wrongHandlingCount.text = statisticModel.valueNumberData[0][3]
        
        popupButtonOutlet.backgroundColor = #colorLiteral(red: 0.1254901961, green: 0.1254901961, blue: 0.2392156863, alpha: 1)
        
        popupView.backgroundColor = #colorLiteral(red: 0.1254901961, green: 0.1254901961, blue: 0.2392156863, alpha: 1)
        
//        detailTableView.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        
        popupCollectionView.backgroundColor = #colorLiteral(red: 0.1254901961, green: 0.1254901961, blue: 0.2392156863, alpha: 1)
        
        print(popupView.frame)
    }
    
    @IBAction func buttonDay1(_ sender: UIButton) {
        StatisticChartView.flagColor = 0
        loadViewFunc()
        button1Tapped.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button2Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button3Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button4Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button5Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        buttonAllTapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button1Tapped.tintColor         = .black
        button2Tapped.tintColor         = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1180436644)
        button3Tapped.tintColor         = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1180436644)
        button4Tapped.tintColor         = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1180436644)
        button5Tapped.tintColor         = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1180436644)
        buttonAllTapped.tintColor       = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1180436644)
//        displayData(statisticModel.getData(Index: 0))
//        detailTableView.reloadData()
        rightHandlingCount.text = statisticModel.valueNumberData[0][2]
        wrongHandlingCount.text = statisticModel.valueNumberData[0][3]
    }
    
    @IBAction func buttonDay2(_ sender: UIButton) {
        StatisticChartView.flagColor = 1
        loadViewFunc()
        button1Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button2Tapped.backgroundColor = .white
        button3Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button4Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button5Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        buttonAllTapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button1Tapped.tintColor         = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1180436644)
        button2Tapped.tintColor         = .black
        button3Tapped.tintColor         = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1180436644)
        button4Tapped.tintColor         = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1180436644)
        button5Tapped.tintColor         = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1180436644)
        buttonAllTapped.tintColor       = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1180436644)
//        displayData(statisticModel.getData(Index: 1))
//        detailTableView.reloadData()
        rightHandlingCount.text = statisticModel.valueNumberData[1][2]
        wrongHandlingCount.text = statisticModel.valueNumberData[1][3]
    }
    
    @IBAction func buttonDay3(_ sender: UIButton) {
        StatisticChartView.flagColor = 2
        loadViewFunc()
        button1Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button2Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button3Tapped.backgroundColor = .white
        button4Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button5Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        buttonAllTapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button1Tapped.tintColor         = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1180436644)
        button2Tapped.tintColor         = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1180436644)
        button3Tapped.tintColor         = .black
        button4Tapped.tintColor         = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1180436644)
        button5Tapped.tintColor         = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1180436644)
        buttonAllTapped.tintColor       = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1180436644)
//        displayData(statisticModel.getData(Index: 2))
//        detailTableView.reloadData()
        rightHandlingCount.text = statisticModel.valueNumberData[2][2]
        wrongHandlingCount.text = statisticModel.valueNumberData[2][3]
    }
    
    @IBAction func buttonDay4(_ sender: UIButton) {
        StatisticChartView.flagColor = 3
        loadViewFunc()
        button1Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button2Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button3Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button4Tapped.backgroundColor = .white
        button5Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        buttonAllTapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button1Tapped.tintColor         = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1180436644)
        button2Tapped.tintColor         = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1180436644)
        button3Tapped.tintColor         = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1180436644)
        button4Tapped.tintColor         = .black
        button5Tapped.tintColor         = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1180436644)
        buttonAllTapped.tintColor       = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1180436644)
//        displayData(statisticModel.getData(Index: 3))
//        detailTableView.reloadData()
        rightHandlingCount.text = statisticModel.valueNumberData[3][2]
        wrongHandlingCount.text = statisticModel.valueNumberData[3][3]
        
    }
    
    @IBAction func buttonDay5(_ sender: UIButton){
        StatisticChartView.flagColor = 4
        loadViewFunc()
        button1Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button2Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button3Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button4Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button5Tapped.backgroundColor = .white
        buttonAllTapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button1Tapped.tintColor         = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1180436644)
        button2Tapped.tintColor         = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1180436644)
        button3Tapped.tintColor         = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1180436644)
        button4Tapped.tintColor         = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1180436644)
        button5Tapped.tintColor         = .black
        buttonAllTapped.tintColor       = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1180436644)
//        displayData(statisticModel.getData(Index: 4))
//        detailTableView.reloadData()
        rightHandlingCount.text = statisticModel.valueNumberData[4][2]
        wrongHandlingCount.text = statisticModel.valueNumberData[4][3]
    }
    
    @IBAction func buttonAllDay(_ sender: UIButton) {
        StatisticChartView.flagColor = 6
        loadViewFunc()
        button1Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button2Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button3Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button4Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button5Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        buttonAllTapped.backgroundColor = .white
        button1Tapped.tintColor         = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1180436644)
        button2Tapped.tintColor         = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1180436644)
        button3Tapped.tintColor         = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1180436644)
        button4Tapped.tintColor         = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1180436644)
        button5Tapped.tintColor         = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1180436644)
        buttonAllTapped.tintColor       = .black
//        displayData(statisticModel.getData(Index: 5))
//        detailTableView.reloadData()
        rightHandlingCount.text = String(Int(statisticModel.valueNumberData[0][2])! + Int(statisticModel.valueNumberData[1][2])! + Int(statisticModel.valueNumberData[2][2])! + Int(statisticModel.valueNumberData[3][2])! + Int(statisticModel.valueNumberData[4][2])!)
        wrongHandlingCount.text = String(Int(statisticModel.valueNumberData[0][3])! + Int(statisticModel.valueNumberData[1][3])! + Int(statisticModel.valueNumberData[2][3])! + Int(statisticModel.valueNumberData[3][3])! + Int(statisticModel.valueNumberData[4][3])!)
    }
    
    @IBAction func popupButton(_ sender: Any) {
            let blurEffectView = UIVisualEffectView(effect: self.blurEffect)
            blurEffectView.frame = self.view.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            self.view.addSubview(blurEffectView)
            self.view.addSubview(self.popupView)
            
            self.popupView.layer.cornerRadius = 24.0
            self.popupView.center = self.view.center
    }
    
    @IBAction func donePopoverButton(_ sender: Any) {
        self.popupView.removeFromSuperview()
        let blurView = self.view.subviews[self.view.subviews.count - 1]
        blurView.removeFromSuperview()
    }
    
    private func loadViewFunc() {
        chartView.contentMode = .scaleAspectFit
        StatisticChartView.playAnimation()
    }


}

//extension ViewController: UITableViewDataSource, UITableViewDelegate{
//
//    func displayData(_ dataStatistic: [Statistic]){
//        self.dataStatistic = dataStatistic
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return dataStatistic.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = detailTableView.dequeueReusableCell(withIdentifier: "cellStatistic") as! StatisticTableViewCell
//        cell.displayData(dataStatistic[indexPath.row])
//        return cell
//    }
//
//
//}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return statisticModel.collectionNumber.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let popupCell:PopupCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopupCard", for: indexPath) as! PopupCollectionViewCell
        
        popupCell.backgroundColor = #colorLiteral(red: 0.137254902, green: 0.137254902, blue: 0.2509803922, alpha: 1)
        popupCell.layer.cornerRadius = 20
        popupCell.swingDivider.image = UIImage(named: "Divider")
        popupCell.scoreDivider.image = UIImage(named: "Divider")
        
//        popupCell.swingFirstIndicator.textColor     = .white
//        popupCell.swingSecondIndicator.textColor    = .white
        popupCell.swingFirstScore.textColor         = .white
        popupCell.swingSecondScore.textColor        = .white
        
        popupCell.popupNumberLabel.text = statisticModel.collectionNumber[indexPath.row]
        
//        popupCell.swingFirstIndicator.text = statisticModel.collectionFirstIndicator[indexPath.row]
//        popupCell.swingSecondIndicator.text = statisticModel.collectionSecondIndicator[indexPath.row]
        
        popupCell.swingFirstIndicator.image = UIImage(named: statisticModel.collectionFirstIndicator[indexPath.row])
        popupCell.swingSecondIndicator.image = UIImage(named: statisticModel.collectionSecondIndicator[indexPath.row])
        
        popupCell.swingFirstScore.text = statisticModel.collectionFirstScore[indexPath.row]
        popupCell.swingSecondScore.text = statisticModel.collectionSecondScore[indexPath.row]
        
        return popupCell
    }
    
    
}
