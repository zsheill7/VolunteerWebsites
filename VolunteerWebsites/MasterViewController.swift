//
//  MasterViewController.swift
//  VolunteerWebsites
//
//  Created by Zoe on 10/5/16.
//  Copyright © 2016 Zoe. All rights reserved.
//

import UIKit

var homelessServices: [Service] = [
    Service(name: "Northwest Harvest", urlString: "http://www.northwestharvest.org/opportunities", email: "volunteer@northwestharvest.org", phone: "(206) 625-0755", address: "711 Cherry St, Seattle, WA 98104"),
    Service(name: "Hope Place", urlString: "http://hopeplace.ugm.volunteerhub.com/events/index", email: "escott@ugm.org", phone: "(206) 628-2008", address: "3802 South Othello St, Seattle, WA 98118"),
    Service(name: "Emergency Family Shelter", urlString: "http://efs.ugm.volunteerhub.com/events/index", email: "escott@ugm.org", phone: "(206) 621-8474", address: "314 Bell St, Seattle, WA 98121"),
    Service(name: "UGM Group Volunteering", urlString: "http://groups.ugm.volunteerhub.com/events/index", email: "meng@ugm.org", phone: "(206) 723-0767", address: "3802 South Othello St, Seattle, WA 98118"),
    Service(name: "Elementary Program Volunteer", urlString: "http://elementary.ugm.volunteerhub.com/events/index", email: "escott@ugm.org", phone: "(206) 723-0767", address: "314 Bell St, Seattle, WA 98121"),
    Service(name: "Congregations for the Homeless (must email)", urlString: "http://www.cfhomeless.org/volunteer-opportunities/", email: "volunteer@cfhomeless.org", phone: "(425) 289-4044", address: "2650 148th Ave SE #202, Bellevue, WA 98007"),
    Service(name: "Distribution", urlString: "http://distribution.ugm.volunteerhub.com/events/index", email: "escott@ugm.org", phone: "(206) 621-8474", address: "314 Bell St, Seattle, WA 98121"),
    Service(name: "Capitol Hill Women's Shelter", urlString: "http://chws.ugm.volunteerhub.com/events/index", email: "escott@ugm.org", phone: "206.324.1244", address: "620 18th Avenue East, Seattle, WA 98112"),
    Service(name: "Books To Prisoners", urlString: "http://www.bookstoprisoners.net/volunteer/", email: "bookstoprisoners@live.com", phone: "(206) 527-3339", address: "92 Pike St., Box A, Seattle, WA 98101"),
    Service(name: "Mary's Place", urlString: "http://www.marysplaceseattle.org/support-us/volunteer/", email: "info@marysplaceseattle.org", phone: "2066218474", address: "1155 North 130th St, Seattle"),
    Service(name: "Friends of Youth (min 16+)", urlString: "http://www.friendsofyouth.org/volunteerOpp.aspx", email: "volunteer@friendsofyouth.org", phone: "4258696490", address: "13116 NE 132nd St, Kirkland, WA 98034-2306"),
            Service(name: "", urlString: "", email: "", phone: "", address: "")
    
]


var healthServices: [Service] = [
    
    Service(name: "Seattle Children's Hospital", urlString: "http://www.seattlechildrens.org/ways-to-help/volunteer/application-process/", email: "http://www.seattlechildrens.org/about/connect-with-us-online/", phone: "206-987-2000", address: "4800 Sand Point Way NE, Seattle, WA 98105"),
    Service(name: "Full Life Care", urlString: "http://www.fulllifecare.org/donate-now/volunteer/#section1", email: "gingers@fulllifecare.org", phone: "206-224-3790", address: "6555 Ravenna Avenue NE, Seattle WA, 98115"),
        Service(name: "Harborview (UW Medicine)", urlString: "http://www.uwmedicine.org/harborview/volunteer", email: "http://www.uwmedicine.org/about/contact-us#hmc", phone: "206.744.3000​​", address: "325 9th Ave, Seattle, WA 98104"),
        Service(name: "American Red Cross", urlString: "http://www.redcross.org/volunteer/become-a-volunteer#step2", email: "http://www.redcross.org/contact-us/general-inquiry", phone: "1 (800) 733-2767", address: "1900 25th Ave S, Seattle, WA 98144"),
        Service(name: "Overlake Hospital (over 18)", urlString: "http://jobs.jobvite.com/overlakehospital/jobs/team?c=Volunteer", email: "", phone: "(425) 688-5000", address: "1035 116th Ave NE, Bellevue, WA 98004"),
        Service(name: "Bellevue and South Clinic (16+)", urlString: "http://www.seattlechildrens.org/ways-to-help/volunteer/opportunities-bellevue-south-clinic/", email: "BellevueVolunteerServices@Seattlechildrens.org", phone: "(425) 454-4644", address: "1500 116th Ave NE, Bellevue, WA 98004"),
        Service(name: "", urlString: "", email: "", phone: "", address: "")
        
]


var enviServices: [Service] = [
    Service(name: "Nature Consortium", urlString: "http://www.naturec.org/volunteer/", email: "info@naturec.org", phone: "(206) 923-0853", address: "4408 Delridge Way SW #107, Seattle, WA 98106"),
    Service(name: "Seattle Tilth", urlString: "http://www.seattletilth.org/get-involved/volunteer/index_html", email: "volunteer@seattletilth.org", phone: "(206) 633-0451", address: "Suite 100, 4649 Sunnyside Ave N, Seattle, WA 98103"),
    Service(name: "Seattle Parks and Recreation", urlString: "http://www.seattle.gov/parks/volunteer/current-volunteer-opportunities", email: "parksvolunteer@seattle.gov", phone: "(206) 684-4075", address: "100 Dexter Ave N, Seattle, WA 98109"),
    Service(name: "Adopt-a-Street", urlString: "http://www.seattle.gov/util/EnvironmentConservation/OurCity/AdoptaStreet/index.htm", email: "adoptastreet@seattle.gov", phone: "(206) 684-3000", address: "34018 Seattle, WA 98124-4018"),
    Service(name: "Bellevue Environmental Stewardship (for teens)", urlString: "http://www.ci.bellevue.wa.us/volunteer-teens-environmental-stewardship.htm", email: "ServiceFirst@bellevuewa.gov", phone: "425-452-6129", address: ""),
    Service(name: "", urlString: "", email: "", phone: "", address: ""),
]



var animalServices: [Service] = [
    Service(name: "Seattle Humane Society", urlString: "http://www.seattlehumane.org/volunteer/volunteer-with-us", email: "humane@seattlehumane.com", phone: "(425) 641-0080", address: "13212 SE Eastgate Way, Bellevue, WA 98005"),
    Service(name: "PAWS (kids and teens)", urlString: "https://www.paws.org/kids/volunteer/", email: "", phone: "(425) 787-2500", address: "15305 44th Ave W, Lynnwood, WA 98087"),
        Service(name: "PAWS (18+)", urlString: "https://www.paws.org/get-involved/volunteer/opportunities/", email: "", phone: "(425) 787-2500", address: "15305 44th Ave W, Lynnwood, WA 98087"),
        Service(name: "Seattle Animal Shelter (in-shelter)", urlString: "http://www.seattle.gov/animal-shelter/volunteer/in-shelter", email: "seattleanimalshelter@seattle.gov", phone: "(206) 386-7387", address: "2061 15th Ave W, Seattle, WA 98119"),
        Service(name: "Foster a Cat", urlString: "http://www.seattle.gov/animal-shelter/volunteer/foster-care/foster-cat-program", email: "sasfostercats@gmail.com", phone: "(800) 227-4645", address: ""),
        Service(name: "Foster a Dog", urlString: "http://www.seattle.gov/animal-shelter/volunteer/foster-care/foster-dog-program", email: "sasfosterdogs@gmail.com ", phone: "(800) 227-4645", address: ""),
        Service(name: "", urlString: "", email: "", phone: "", address: ""),
        
]



class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    let escottEmail = "escott@ugm.org"
    var displaySegment = 0  //0==website, email==1, phone==2
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    @IBAction func indexChanged(sender: AnyObject) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            displaySegment = 0
            tableView.reloadData()
        case 1:
            displaySegment = 1
            tableView.reloadData()
        case 2:
            displaySegment = 2
            tableView.reloadData()
        default:
            break;
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        //self.navigationItem.leftBarButtonItem = self.editButtonItem()

        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(insertNewObject(_:)))
       // self.navigationItem.rightBarButtonItem = addButton
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        segmentedControl.tintColor = UIColorFromHex(0x73B1B7, alpha: 1.0)
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(sender: AnyObject) {
       
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
               
                var object = homelessServices[indexPath.row]
                if (tabBarController?.selectedIndex == 1) {
                    object = healthServices[indexPath.row]
                } else if (tabBarController?.selectedIndex == 2) {
                    object = enviServices[indexPath.row]
                } else if (tabBarController?.selectedIndex == 3) {
                    object = animalServices[indexPath.row]
                } else if (tabBarController?.selectedIndex == 1) {
                    object = healthServices[indexPath.row]
                }
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tabBarController?.selectedIndex == 0 {
            return homelessServices.count
        } else if tabBarController?.selectedIndex == 1 {
            return healthServices.count
        } else if tabBarController?.selectedIndex == 2 {
            return enviServices.count
        } else if tabBarController?.selectedIndex == 3 {
            return animalServices.count
        }
        return animalServices.count
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        
        var object = homelessServices[indexPath.row]
        
        if tabBarController?.selectedIndex == 1 {
            object = healthServices[indexPath.row]
        } else if tabBarController?.selectedIndex == 2 {
            object = enviServices[indexPath.row]
        } else if tabBarController?.selectedIndex == 3 {
            object = animalServices[indexPath.row]
        } else if tabBarController?.selectedIndex == 4 {
            object = healthServices[indexPath.row]
        }
        
        cell.textLabel!.text = object.name
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if displaySegment == 0 {
            self.performSegueWithIdentifier("showDetail", sender: self)
        } else if displaySegment == 1 {
            let email = "mailto:\(homelessServices[indexPath.row].email)"
            if let emailURL: NSURL = NSURL(string: email) {
                print("can email")
                UIApplication.sharedApplication().openURL(emailURL)
            }
        }
    }

    /*override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            homelessServices.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }*/
    
    

    
    
    
    
   
    
    



}

