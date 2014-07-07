//
//  ViewController.swift
//  Tic Tac Toe 2
//
//  Created by Pandu on 6/28/14.
//  Copyright (c) 2014 Pandurang Yachwad Creation. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var ticTacImage1 : UIImageView = nil
    @IBOutlet var ticTacImage2 : UIImageView = nil
    @IBOutlet var ticTacImage3 : UIImageView = nil
    @IBOutlet var ticTacImage4 : UIImageView = nil
    @IBOutlet var ticTacImage5 : UIImageView = nil
    @IBOutlet var ticTacImage6 : UIImageView = nil
    @IBOutlet var ticTacImage7 : UIImageView = nil
    @IBOutlet var ticTacImage8 : UIImageView = nil
    @IBOutlet var ticTacImage9 : UIImageView = nil
    
    @IBOutlet var ticTacButton1 : UIButton = nil
    @IBOutlet var ticTacButton2 : UIButton = nil
    @IBOutlet var ticTacButton3 : UIButton = nil
    @IBOutlet var ticTacButton4 : UIButton = nil
    @IBOutlet var ticTacButton5 : UIButton = nil
    @IBOutlet var ticTacButton6 : UIButton = nil
    @IBOutlet var ticTacButton7 : UIButton = nil
    @IBOutlet var ticTacButton8 : UIButton = nil
    @IBOutlet var ticTacButton9 : UIButton = nil
    
    @IBOutlet var ticTacResetButton : UIButton = nil
    
    @IBOutlet var ticTacUserMessage : UILabel = nil
    
    var plays = Dictionary<Int, Int>()
    var done = false
    var aiDeciding = false
    
    @IBAction func UIButtonClicked(sender:UIButton) {
    
        if (isOccupied(sender.tag) && !done){
            ticTacUserMessage.hidden = false
            ticTacUserMessage.text = "Double dip! Click other box!"
            return
        }
        ticTacUserMessage.hidden = true
        if (!plays[sender.tag] && !aiDeciding && !done){
            setImageForSpot(sender.tag, player: 1)
        }
        checkForWin()
        aiTurn()
    }
    
    func setImageForSpot(spot: Int, player: Int){
        var playerMark = player == 1 ? "x" : "o"
        
        plays[spot] = player
        
        switch spot{
            
        case 1:
            
            ticTacImage1.image = UIImage(named: playerMark)
            
        case 2:
            
            ticTacImage2.image = UIImage(named: playerMark)
            
        case 3:
            
            ticTacImage3.image = UIImage(named: playerMark)
            
        case 4:
            
            ticTacImage4.image = UIImage(named: playerMark)
            
        case 5:
            
            ticTacImage5.image = UIImage(named: playerMark)
            
        case 6:
            
            ticTacImage6.image = UIImage(named: playerMark)
            
        case 7:
            
            ticTacImage7.image = UIImage(named: playerMark)
            
        case 8:
            
            ticTacImage8.image = UIImage(named: playerMark)
            
        case 9:
            
            ticTacImage9.image = UIImage(named: playerMark)
            
        default:
            
            ticTacImage9.image = UIImage(named: playerMark)
        }
        
    }

    @IBAction func resetButtonClicked(sender: UIButton){
        
        done = false
        
        ticTacResetButton.hidden = true
        
        ticTacUserMessage.hidden = true
        
        reset()
        
    }
    
    func reset(){
        
        plays = [:]
        
        ticTacImage1.image = nil
        
        ticTacImage2.image = nil
        
        ticTacImage3.image = nil
        
        ticTacImage4.image = nil
        
        ticTacImage5.image = nil
        
        ticTacImage6.image = nil
        
        ticTacImage7.image = nil
        
        ticTacImage8.image = nil
        
        ticTacImage9.image = nil
        
    }
    
    
    func checkForWin(){
        
        var whoWon = ["I": 0, "you": 1]
        
        for(key, value) in whoWon{
            
            if(plays[7] == value && plays[8] == value && plays[9] == value) ||  //Across the bottom
                
                (plays[4] == value && plays[5] == value && plays[6] == value) ||  //Across the Middle
                
                (plays[1] == value && plays[2] == value && plays[3] == value) ||  //Across the top
                
                (plays[1] == value && plays[4] == value && plays[7] == value) ||  //Down the left
                
                (plays[2] == value && plays[5] == value && plays[8] == value) ||  //Down the middle
                
                (plays[3] == value && plays[6] == value && plays[9] == value) ||  //Down the right
                
                (plays[1] == value && plays[5] == value && plays[9] == value) ||  //Cross one
                
                (plays[3] == value && plays[5] == value && plays[7] == value)   //Cross two
                
            {
                
                ticTacUserMessage.hidden = false
                
                if key == "I"{
                    
                    ticTacUserMessage.text = "he he!! Better luck next time!!!"
                    
                } else{
                    
                    ticTacUserMessage.text = "Congrats!! You won!!!"
                    
                }
                
                ticTacResetButton.hidden = false
                
                done = true
                
            }
            
        }
        
    }
    
    func checkBottom(#value: Int) -> (location: String, pattern: String){
        
        return ("bottom", checkFor(value, inList: [7, 8, 9]))
        
    }
    
    
    
    func checkTop(#value: Int) -> (location: String, pattern: String){
        
        return ("top", checkFor(value, inList: [1, 2, 3]))
        
    }
    
    
    
    func checkMiddle(#value: Int) -> (location: String, pattern: String){
        
        return ("middle", checkFor(value, inList: [4, 5, 6]))
        
    }
    
    
    
    func checkLeft(#value: Int) -> (location: String, pattern: String){
        
        return ("left", checkFor(value, inList: [1, 4, 7]))
        
    }
    
    
    
    func checkRight(#value: Int) -> (location: String, pattern: String){
        
        return ("right", checkFor(value, inList: [3, 6, 9]))
        
    }
    
    
    
    func checkCenter(#value: Int) -> (location: String, pattern: String){
        
        return ("center", checkFor(value, inList: [2, 5, 8]))
        
    }
    
    
    
    func checkAcrossDown(#value: Int) -> (location: String, pattern: String){
        
        return ("acrossDown", checkFor(value, inList: [1, 5, 9]))
        
    }
    
    
    
    func checkAcrossUp(#value: Int) -> (location: String, pattern: String){
        
        return ("acrossUp", checkFor(value, inList: [3, 5, 7]))
        
    }
    
    func checkFor(value: Int, inList: Int[]) -> String{
        
        var conclusion = ""
        
        for cell in inList{
            
            if plays[cell] == value{
                
                conclusion += "1"
                
            }else{
                
                conclusion += "0"
                
            }
            
        }
        
        return conclusion
        
    }
    
    
    
    func isOccupied(spot:Int) -> Bool{
        
        return Bool(plays[spot])
        
    }
    
    
    func aiTurn(){
        
        if done{
            
            return
            
        }
        
        aiDeciding = true
        
        //If Two in a row for computer
        
        if let result = rowCheck(value: 0){
            
            var whereToPlayResult = whereToPlay(result.location, pattern:result.pattern)
            
            if !isOccupied(whereToPlayResult){
                
                setImageForSpot(whereToPlayResult, player: 0)
                
                aiDeciding = false
                
                checkForWin()
                
                return
                
            }
            
        }
        
        //If Two in a row for player
        
        if let result = rowCheck(value: 1){
            
            var whereToPlayResult = whereToPlay(result.location, pattern:result.pattern)
            
            if !isOccupied(whereToPlayResult){
                
                setImageForSpot(whereToPlayResult, player: 0)
                
                aiDeciding = false
                
                checkForWin()
                
                return
                
            }
            
        }
        

        //is a center available
        
        if !isOccupied(5){
                    setImageForSpot(5, player: 0)
            
            aiDeciding = false
            
            checkForWin()
            
            return
            
        }
        
        //is a corner available
        
        if let cornerAvailable = firstAvailable(isCorner: true){
            
            setImageForSpot(cornerAvailable, player: 0)
            
            aiDeciding = false
            
            checkForWin()
            
            return
            
        }
        
        // is a side available
        
        if let sideAvailable = firstAvailable(isCorner: false){
            
            setImageForSpot(sideAvailable, player: 0)
            
            aiDeciding = false
            
            checkForWin()
            
            return
            
        }
        
        ticTacUserMessage.hidden = false
        
        ticTacUserMessage.text = " It's a Tie!!! "
        
        ticTacResetButton.hidden = false

        done = true
        
        aiDeciding = false
    }
    
    func firstAvailable(#isCorner: Bool) -> Int?{
        
        var spots = isCorner ? [1, 3, 7, 9]: [2, 4, 6, 8]
        
        for spot in spots{
            
            if !isOccupied(spot){
                
                return spot
                
            }
            
        }
        
        return nil
        
    }
    
    func rowCheck(#value:Int) -> (location: String, pattern: String)?{
        
        var acceptableFinds = ["011", "110", "101"]
        
        var findFuncs = [checkTop, checkBottom, checkMiddle, checkLeft, checkRight, checkCenter, checkAcrossDown, checkAcrossUp]
        
        for algoritham in findFuncs{
            
            var alogorithamResult = algoritham(value:value)
            
            if find(acceptableFinds, alogorithamResult.pattern){
                
                return alogorithamResult
                
            }
            
        }
        
        return nil
        
    }
    
    func whereToPlay(location:String, pattern:String) -> Int{
        
        var leftPattern = "011"
        
        var rightPattern = "110"
        
        var middlePattern = "101"
        
        switch location{
            
        case "top":
            
            if pattern == leftPattern{
                
                return 1
                
            }else if pattern == rightPattern{
                
                return 3
                
            }else{
                
                return 2
                
            }
            
        case "bottom":
            
            if pattern == leftPattern{
                
                return 7
                
            }else if pattern == rightPattern{
                
                return 9
                
            }else{
                
                return 8
                
            }
            
        case "middle":
            
            if pattern == leftPattern{
                
                return 4
                
            }else if pattern == rightPattern{
                
                return 6
                
            }else{
                
                return 5
                
            }
            
        case "left":
            
            if pattern == leftPattern{
                
                return 1
                
            }else if pattern == rightPattern{
                
                return 7
                
            }else{
                
                return 4
                
            }
            
        case "right":
            
            if pattern == leftPattern{
                
                return 3
                
            }else if pattern == rightPattern{
                
                return 9
                
            }else{
                
                return 6
                
            }
            
        case "center":
            
            if pattern == leftPattern{
                
                return 2
                
            }else if pattern == rightPattern{
                
                return 8
                
            }else{
                
                return 5
                
            }
            
        case "acrossDown":
            
            if pattern == leftPattern{
                
                return 1
                
            }else if pattern == rightPattern{
                
                return 9
                
            }else{
                
                return 5
                
            }
            
        case "acrossUp":
            
            if pattern == leftPattern{
                
                return 3
                
            }else if pattern == rightPattern{
                
                return 7
                
            }else{
                
                return 5
                
            }
            
        default: return 4
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

