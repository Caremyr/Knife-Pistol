import SwiftUI
import PlaygroundSupport
import UIKit
import Foundation
import Darwin


let dimSimulazione = CGRect (x: 0, y: 0, width: 640, height: 360)
//Simulation dimension
let dimDialogueBox = CGRect(x: 60, y: 160, width: 640, height: 220)
//Dialogue Box dimension and position
let WilliamImg = UIImage(named: "William1.png")!
//Importing William Sprite
let EldritchImg = UIImage(named: "EldritchCreature.png")!
//Importing monster sprite
let ButtonImg = UIImage(named: "Button1.png")!
//Importing Button sprite

//Background trasparente per il testo
let coloreBackTesto = UIColor(white: 0, alpha: 0)


//Arrays that contain: the names of the one speaking at the moment, the actualy text spoken/narrated and the type of dialogue box that is being used (nwith a name box or without it)
let nameArray = ["William","William","William","The Abonmination", "The Abonmination"]

//let dialogueArray = ["GEORGE! ... ", "George where the hell are  you? ...", "Bloody hell my han burns like a motherfcuker... and I don't understand what's going on...","You awakened something truly dangerous human, your end is near and your soul is impure, redeem yourself and fight, or flee and you will perish...","There is a mark on your hand, I know who you are."]
let dialogueArray = ["GEORGE! ... ", "George where the hell are  you? ...", "Bloody hell my han burns like a motherfcuker... and I don't understand what's going on...","yOu AwAkEnEd SoMeThInG tRuLy DaNgErOuS hUmAn, YoUr eNd iS nEaR aNd YoUr SoUl Is ImPuRe, ReDeEm YoUrSeLf AnD fIgHt, Or FlEe AnD YoU wIlL PeRiSh...","tHeRe iS a MaRk On YoUr hAnD, i KnOw WhO yOu ArE."]
let dialogueBoxArray = ["DialogueBox2.png","DialogueBox2.png","DialogueBox2.png","DialogueBox2.png","DialogueBox2.png"]

//Index variable that keeps track of my position in the arrays
var counter = 0

//Importing the button sprite
let arrow = UIImage(named: "Button1.png")


class PrologueController: UIViewController{
    
    //Class variables
    let Vista = UIView()
    let sfondo = UIImageView(frame: dimSimulazione)
    let testo = UITextView()
    let WilliamSprite = UIImageView()
    let testoBox = UIImageView(frame: dimDialogueBox)
    let EldritchSprite = UIImageView()
    let nextButton = UIButton()
    let sfondoNero = UITextView()
    let speakerName = UITextView()

    override func loadView() {
        super.loadView()                                                        //Riprendo la loadView della classe View originale
        self.view = Vista                                                       //view è la variabile della classe originale e ci chiavo la mia
        creaVista()                                                             //Quando carica la vista, deve richiamare la funzione che ho creato io
    }
    
    func creaVista(){
        Vista.frame = dimSimulazione
        
        Vista.addSubview(sfondo)
        Vista.addSubview(testoBox)
        Vista.addSubview(WilliamSprite)
        Vista.addSubview(EldritchSprite)
        Vista.addSubview(nextButton)
        Vista.addSubview(testo)
        Vista.addSubview(sfondoNero)
        Vista.addSubview(speakerName)
        
        //Handling black background for fade in
        sfondoNero.frame = dimSimulazione
        sfondoNero.isEditable = false
        sfondoNero.backgroundColor = .black
        sfondoNero.layer.zPosition = 10
        
        //Bringing the background onto the scene
        sfondo.image = UIImage(named: "SmokeyShop.png")
        sfondo.layer.zPosition = 1
        
        //Fading animation for the background
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1){
            UIView.animate(withDuration: 2.0, animations: {() -> Void in self.sfondoNero.alpha = 1
            })
            UIView.animate(withDuration: 2.0, animations: {() -> Void in self.sfondoNero.alpha = 0
            })
        }

        
        addNextButton()
    }

    func addNextButton(){
        nextButton.layer.zPosition = 6
        nextButton.frame = CGRect(x: 570, y: Vista.frame.maxY - 60, width: 60, height: 40)
        nextButton.setBackgroundImage(ButtonImg, for: .normal)
        nextButton.tag = 0
        nextButton.addTarget(self, action: #selector(nextLabel), for: .touchUpInside)
    }
    
    @objc func nextLabel(){
        if(counter == 0){
            //I enter this if statement only the first time the button is pressed, meaning when the counter is equal to 0 at the beginning of the scene
            
            //The first time the button is pressed we bring forward all the assets on the image
            
            //Assigning the dialoguebox image and layer position
            testoBox.image = UIImage(named: "DialogueBox2.png")
            testoBox.layer.zPosition = 5
            
            //Assigning William's Sprite image, layer position, canvas position and dimension
            WilliamSprite.image = WilliamImg
            WilliamSprite.frame = CGRect(x: -80, y: Vista.frame.midY - 125, width: WilliamImg.size.width/3, height: WilliamImg.size.height/3)
            WilliamSprite.layer.zPosition = 3
            
            //Assigning the Eldritch Abomination's Sprite image, layer position, canvas position and dimension
            EldritchSprite.image = EldritchImg
            EldritchSprite.frame = CGRect(x: 320, y: 65, width: EldritchImg.size.width/3, height: EldritchImg.size.height/3)
            EldritchSprite.layer.zPosition = 3
            
            //Assigning the string of who is speaking to the appropriate variable, setting the background color to transparent, setting the layer position, the position in the canvas and the dimension
            speakerName.text = nameArray[counter]
            speakerName.backgroundColor = coloreBackTesto
            speakerName.layer.zPosition = 7
            speakerName.frame = CGRect(x: 225, y: 208, width:100 , height:30 )
            
            //Same as before but for the actual text being spoken/narrated
            testo.text = dialogueArray[counter]
            testo.backgroundColor = coloreBackTesto
            testo.layer.zPosition = 7
            testo.frame = CGRect(x:235 ,y:240 ,width:300 ,height:100)
            
            //Creating the fade in effect for the DialogueBox image
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0){
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.testoBox.alpha = 0
                })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.testoBox.alpha = 0.75
                })
            }
            //Creating the fade in effect for William's Sprite
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0){
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.WilliamSprite.alpha = 0
                })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.WilliamSprite.alpha = 1
                })
            }
            //Creating the fade in effect for the Eldritch's being sprite
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0){
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.EldritchSprite.alpha = 0
                })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.EldritchSprite.alpha = 1
                })
            }
            //Creating the fade in effect for the name of who is speaking in the dialogue box
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0){
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.speakerName.alpha = 0
                })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.speakerName.alpha = 1
                })
            }
            //Creating the fade in effeect for the actual text
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0){
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.testo.alpha = 0
                })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.testo.alpha = 1
                })
            }
            //Increasing the counter of the array
            counter += 1
        } else{
            //Assigning the various elements of the various array to their respective variables
            testo.text = dialogueArray[counter]
            speakerName.text = nameArray[counter]
            testoBox.image = UIImage(named: dialogueBoxArray[counter])
            
            counter += 1
        }
    }
}

PlaygroundPage.current.liveView = PrologueController()

