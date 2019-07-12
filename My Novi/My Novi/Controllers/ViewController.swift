//
//  ViewController.swift
//  My Novi
//
//  Created by Adminstrator on 30/10/18.
//  Copyright © 2018 home. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var dashBoardCollectionView: UICollectionView!
    let dashboard = UIStoryboard(name: "Main", bundle: nil)
    var itemarray: [Items] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item1 = Items(name: "Construction Updates", url: "http://www.cityofnovi.org/Government/City-Services/Public-Services/Engineering-Division/Drive,-Ride,-Walk-Novi-(road-and-non-motorized-fac.aspx#AppStart", colorCode: ["#6c8b3b"], imageName: "Construction96")
        itemarray.append(item1)
        
        let item2 = Items(name: "Job Opportunities", url: "http://www.cityofnovi.org/Government/City-Services/Human-Resources/Available-Job-Postings.aspx#Jobs", colorCode: ["#571740"], imageName: "JobOpps96")
        itemarray.append(item2)
        
        let item3 = Items(name: "Recreation", url: "http://www.cityofnovi.org/Government/City-Services/Parks,-Recreation-and-Cultural-Services.aspx", colorCode: ["#571740"], imageName: "Recreation96")
        itemarray.append(item3)
        
        let item4 = Items(name: "Pay Utility Bills/Taxes", url: "https://bsaonline.com/?uid=362&sitetransition=true", colorCode: ["#06525f"], imageName: "PayBills96")
        itemarray.append(item4)
        
        let item5 = Items(name: "Parks & Rec Registration", url: "https://secure.rec1.com/MI/novi-parks-recreation-cultural-services/catalog", colorCode: ["#c3962d"], imageName: "ParksRecRegistration96")
        itemarray.append(item5)
        
        let item7 = Items(name: "Visit City Website", url: "http://www.cityofnovi.org", colorCode: ["#42315a"], imageName: "CityWebsite96")
        itemarray.append(item7)
        
        let item8 = Items(name: "Facebook", url: "https://www.facebook.com/CityofNovi/", colorCode: ["#42315a"], imageName: "Facebook96")
        itemarray.append(item8)
        
        let item9 = Items(name: "Connect with City Hall", url: "http://www.cityofnovi.org/Reference/City-Directory.aspx#Departments", colorCode: ["#961b32"], imageName: "Connect96")
        itemarray.append(item9)
        
//        let item10 = Items(name: "Report an Issue", url: "http://novimi.qscend.com/311/request/add", colorCode: "#571740", imageName: "ReportIssue96")
//        itemarray.append(item10)
        
        let item11 = Items(name: "Development Projects in Process", url: "http://www.cityofnovi.org/Government/City-Services/Community-Development/Development-Projects-in-Process.aspx#AppStart", colorCode: ["#231f20"], imageName: "DevProjects96")
        itemarray.append(item11)
        
        let item12 = Items(name: "Staff Directory", url: "http://cityofnovi.org/Reference/City-Directory.aspx#StaffAlpha", colorCode: ["#231f20"], imageName: "StaffDirectory96")
        itemarray.append(item12)
        
        let item13 = Items(name: "Calendar", url: "http://cityofnovi.org/Community/Calendar.aspx", colorCode: ["#42315a"], imageName: "Calendar96")
        itemarray.append(item13)
        
        let item14 = Items(name: "Search", url: "http://www.cityofnovi.org/Reference/Search.aspx", colorCode: ["#42315a"], imageName: "Search96")
        itemarray.append(item14)
        
        let item15 = Items(name: "Studio NoVI", url: "http://psevents.net/002/00328/NoviPlayerFullUI/iplay.asp", colorCode: ["#42315a"], imageName: "StudioNoVI96")
        itemarray.append(item15)
        
        dashBoardCollectionView.delegate = self;
        dashBoardCollectionView.dataSource = self;
        dashBoardCollectionView.reloadData();
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btnOpenParkViewController(_ sender: Any) {
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemarray.count;
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DashboardCell", for: indexPath) as! DashboardCell

        let currentItem = itemarray[indexPath.row]
        cell.cellItemImage.image = UIImage.init(named: currentItem.itemImage)
        cell.cellItemDescription.text = currentItem.itemName
        return cell;
        
    }
    @IBAction func btnReportAConcernClicked(_ sender: Any) {
   
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let urlOfWebsite = itemarray[indexPath.row].ItemUrl
            guard let url = URL(string: urlOfWebsite) else { return }
            UIApplication.shared.open(url)
        }

    }

extension ViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = collectionView.bounds.width/4.0
        
        if UIDevice.current.userInterfaceIdiom == .pad{
            return CGSize(width: yourWidth, height: 150)
        }else{
            return CGSize(width: yourWidth, height: 100)
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == .pad  ?  15 :  10

    }
    
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
