//
//  TipsTableViewController.swift
//  fingertips
//
//  Created by Yin Li on 7/12/14.
//  Copyright (c) 2014 Whyllee. All rights reserved.
//

import UIKit

class TipsTableViewController: UITableViewController, UITableViewDelegate {
    
    let min:Float = 0;
    let max:Float = 1000.0;
    var scale:Float = 0.25;
    var current:Float = 30;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clearsSelectionOnViewWillAppear = false
        self.tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "tipsCell");
        
        self.tableView.selectRowAtIndexPath(_valueToIndex(current), animated: true, scrollPosition: .Middle)
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        self.current = Float(indexPath.row);
        self.tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: .Middle, animated: true)
    }

    // #pragma mark - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        assert(self.max > self.min)
        assert(self.scale > 0)
        return Int((self.max - self.min) / self.scale);
    }

    override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell? {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("tipsCell", forIndexPath: indexPath) as UITableViewCell;
        let value = self._indexToValue(indexPath);
        cell.textLabel.text = "\(_formatValue(value))"
        return cell
    }
    
    func _formatValue(value:Float) -> String {
        return NSString(format:"%.2f", value);
    }

    func _indexToValue(indexPath:NSIndexPath!) -> Float {
        return Float(indexPath.row) * self.scale + self.min
    }
    
    func _valueToIndex(value:Float) -> NSIndexPath {
        return NSIndexPath(forRow: Int((value - self.min)/self.scale), inSection: 0)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView?, canEditRowAtIndexPath indexPath: NSIndexPath?) -> Bool {
    // Return NO if you do not want the specified item to be editable.
    return true
    }
    */
}
