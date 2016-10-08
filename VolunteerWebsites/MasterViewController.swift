//
//  MasterViewController.swift
//  VolunteerWebsites
//
//  Created by Zoe on 10/5/16.
//  Copyright © 2016 Zoe. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    let escottEmail = "escott@ugm.org"
    var displaySegment = 0  //0==website, email==1, phone==2
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var homelessServices: [Service] = [
        Service(name: "Northwest Harvest", urlString: "http://www.northwestharvest.org/opportunities", email: "volunteer@northwestharvest.org"),
        Service(name: "Hope Place", urlString: "http://hopeplace.ugm.volunteerhub.com/events/index", email: "escott@ugm.org"),
        Service(name: "Emergency Family Shelter", urlString: "http://efs.ugm.volunteerhub.com/events/index", email: "escott@ugm.org"),
        Service(name: "UGM Group Volunteering", urlString: "http://groups.ugm.volunteerhub.com/events/index", email: "meng@ugm.org"),
        Service(name: "Elementary Program Volunteer", urlString: "http://elementary.ugm.volunteerhub.com/events/index", email: "escott@ugm.org"),
        Service(name: "Congregations for the Homeless (must email)", urlString: "http://www.cfhomeless.org/volunteer-opportunities/", email: "volunteer@cfhomeless.org"),
        Service(name: "Distribution", urlString: "http://distribution.ugm.volunteerhub.com/events/index", email: "escott@ugm.org"),
    Service(name: "Capitol Hill Women's Shelter", urlString: "http://chws.ugm.volunteerhub.com/events/index", email: "escott@ugm.org"),
    Service(name: "Books To Prisoners", urlString: "http://www.bookstoprisoners.net/volunteer/", email: "bookstoprisoners@live.com"),
    Service(name: "Mary's Place", urlString: "http://www.marysplaceseattle.org/support-us/volunteer/", email: "info@marysplaceseattle.org"),
    Service(name: "", urlString: "", email: ""),
    Service(name: "", urlString: "", email: ""),
    
    ]
    var healthServices: [Service] = [
        
        Service(name: "Seattle Children's Hospital", urlString: "http://www.seattlechildrens.org/ways-to-help/volunteer/application-process/", email: "http://www.seattlechildrens.org/about/connect-with-us-online/"),
        Service(name: "Full Life Care", urlString: "http://www.fulllifecare.org/donate-now/volunteer/#section1", email: "gingers@fulllifecare.org"),
        Service(name: "Harborview (UW Medicine)", urlString: "http://www.uwmedicine.org/harborview/volunteer", email: "http://www.uwmedicine.org/about/contact-us#hmc"),
        Service(name: "", urlString: "", email: ""),
        Service(name: "", urlString: "", email: ""),
        
        
    
        
    ]

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
                if ((tabBarController?.selectedIndex = 1) != nil) {
                    object = healthServices[indexPath.row]
                } /*else if ((tabBarController?.selectedIndex = 3) != nil) {
                    object = healthServices[indexPath.row]
                }*/
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
        }
        return healthServices.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        
        var object = homelessServices[indexPath.row]
        
        if tabBarController?.selectedIndex == 1 {
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

