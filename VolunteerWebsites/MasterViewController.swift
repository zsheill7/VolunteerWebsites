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
    
    var objects: [Service] = [
        Service(name: "Hope Place", urlString: "http://hopeplace.ugm.volunteerhub.com/events/index", email: "escott@ugm.org"),
        Service(name: "Emergency Family Shelter", urlString: "http://efs.ugm.volunteerhub.com/events/index", email: "escott@ugm.org"),
        Service(name: "UGM Group Volunteering", urlString: "http://groups.ugm.volunteerhub.com/events/index", email: "meng@ugm.org"),
        Service(name: "Elementary Program Volunteer", urlString: "http://elementary.ugm.volunteerhub.com/events/index", email: "escott@ugm.org"),
        Service(name: "Congregations for the Homeless (must email)", urlString: "http://www.cfhomeless.org/volunteer-opportunities/", email: "volunteer@cfhomeless.org"),
        Service(name: "Distribution", urlString: "http://distribution.ugm.volunteerhub.com/events/index", email: "escott@ugm.org"),
    Service(name: "Capitol Hill Women's Shelter", urlString: "http://chws.ugm.volunteerhub.com/events/index", email: "escott@ugm.org"),
    Service(name: "Books To Prisoners", urlString: "http://www.bookstoprisoners.net/volunteer/", email: "bookstoprisoners@live.com"),
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
        self.navigationItem.leftBarButtonItem = self.editButtonItem()

        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(insertNewObject(_:)))
        self.navigationItem.rightBarButtonItem = addButton
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
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
                let object = objects[indexPath.row]
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
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let object = objects[indexPath.row] 
        cell.textLabel!.text = object.name
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            objects.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

