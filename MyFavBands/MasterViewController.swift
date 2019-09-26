        import UIKit

        class MasterViewController: UITableViewController {

            var detailViewController: DetailViewController? = nil
        //********1) comment out below line
        //    var objects = [Any]()
            //******** Add array
            var listArray = NSMutableArray()

            override func viewDidLoad() {
                super.viewDidLoad()
                // Do any additional setup after loading the view.
        //*******2) comment out below until line:  navigationItem.rightBarButtonItem = addButton
        //        navigationItem.leftBarButtonItem = editButtonItem
        //
        //        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        //        navigationItem.rightBarButtonItem = addButton
        //********3) Add next two lines for array and title
                listArray = ["3pc", "blackeyedpeas","blackstreet","boy2men","commissioned", "dru hill","earthwindfire", "isleybrothers","jodeci", "silk"]
                title = "My Favorite Bands"
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

   // @objc
  //  func insertNewObject(_ sender: Any) {
  //      objects.insert(NSDate(), at: 0)
  //      let indexPath = IndexPath(row: 0, section: 0)
   //     tableView.insertRows(at: [indexPath], with: .automatic)
  //  }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = listArray[indexPath.row] as! String
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = (object as String) + ".jpg"
                controller.title = listArray[indexPath.row] as? String
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                self.splitViewController?.preferredDisplayMode = .primaryHidden
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let object = listArray[indexPath.row] as! NSString
        cell.textLabel!.text = object.description
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }

   // override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
  //      if editingStyle == .delete {
  //          objects.remove(at: indexPath.row)
  //          tableView.deleteRows(at: [indexPath], with: .fade)
  //      } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
  //      }
 //   }


}

