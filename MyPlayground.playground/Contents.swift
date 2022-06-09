import SwiftUI
import PlaygroundSupport
import UIKit
import Foundation
import Darwin

//Variabili varie ed eventuali
let dimSimulazione = CGRect(x: 0, y: 0, width: 640, height: 360)              //Dimensione Canvas
let dimDialogueBox = CGRect(x: 60, y: 160, width: 640, height: 220)
        //Dimensione quadrato dialoghi
let WilliamImg = UIImage(named: "William1.png")!
let dimWilliam = CGRect(x: -70, y: 65, width: WilliamImg.size.width/3, height: WilliamImg.size.height/3)
let GeorgeImg = UIImage(named: "George.jpg")!
let dimGeorge = CGRect(x:375, y:65, width: GeorgeImg.size.width/3, height: GeorgeImg.size.height/3)
let dimEldritch = CGRect(x:0 ,y:0 ,width: 640 ,height: 360)
let dimChest = CGRect(x:230 , y:90, width:212 , height:188)


var flag = 0

var cassa = false

let texts = [
    "Would you look at that, if it isn't William! What are you doing in my humble shop on this fine morning?",
    "Yo George, you can stop the chitchat, I am only here to sell something.",
    "Fine then, show me what you got this time.",
    "There you go.",
    "Well, it looks like junk to me, worth no more than a few pennies.",
    "Come on George, it is surely worth more than a few pennies, I got through so much trouble to get it. I stole it from the London Crossroad Museum, there was a wide variety of valuables, but I only managed to get this one. ",
    "You see, while I was stealing this item I got discovered by a guard, damn I even had to stab the fat guy to get away, it was close.",
    "Fine then. I'll tell you what, let's make a bet. You can sell it to me like it is, locked, and I'll give you 1 shelling, or you can choose to break it open before selling it and if it is something actually valuable I'll give you double its value, otherwise you get nothing. Seems fair doesn't it? I'll get the tools if you want.",
]
let arrow = UIImage(named: "Button1.png")

class PrologueController: UIViewController{
    
    //Variabili Classe
    let Vista = UIView()
    let sfondo = UIImageView(frame: dimSimulazione)
    let testo = UITextView()
    let texture = UITextView()
    let WilliamSprite = UIImageView(frame :dimWilliam)
    let testoBox = UIImageView(frame: dimDialogueBox)
    let GeorgeSprite = UIImageView(frame: dimGeorge)
    let EldritchSprite = UIImageView(frame: dimEldritch)
    let ChestSprite = UIImageView(frame: dimChest)
    
    let nextButton = UIButton();
    
    let riempimento = texts.count
    
    let ColoreBackTesto = UIColor(white: 0, alpha: 0)
    
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
        Vista.addSubview(GeorgeSprite)
        Vista.addSubview(nextButton)
        Vista.addSubview(texture)
        Vista.addSubview(ChestSprite)
        
        Vista.addSubview(testo)
        
        /*
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1){
            UIView.animate(withDuration: 20.0, animations: {() -> Void in self.testoBox.alpha = 0
            })
            UIView.animate(withDuration: 4.0, animations: {() -> Void in self.testoBox.alpha = 0.75
            })
        }
        */
        
        
        sfondo.image = UIImage(named: "Dealer'sShop.png")
        sfondo.layer.zPosition = 0
        
        testoBox.image = UIImage(named: "DialogueBox2.png")
        testoBox.layer.zPosition = 2
        
        WilliamSprite.image = UIImage(named: "William1.png")
        WilliamSprite.layer.zPosition = 1
        
        GeorgeSprite.image = UIImage(named: "George.jpg")
        GeorgeSprite.layer.zPosition = 1
        
        /*
        EldritchSprite.image = UIImage(named: "E1.png")
        EldritchSprite.layer.zPosition = 1
         */
        
        testo.text = ""
        testo.backgroundColor = ColoreBackTesto
        testo.frame  = CGRect(x:240 , y: 235, width:300, height: 100)
        testo.layer.zPosition = 4
        
        
        addNextButton()
        
    }
    
    func addNextButton(){
        nextButton.layer.zPosition = 20
        nextButton.frame = CGRect (x:570 , y:Vista.frame.maxY-60 ,width:60 ,height:40 )
        nextButton.setBackgroundImage(arrow, for: .normal)
        nextButton.tag = 0
        nextButton.addTarget(self, action: #selector(nextLabel) ,for: .touchUpInside)
        
        
    }
    
    @objc func nextLabel(){
        /*
        if(flag==5){
            cassa = false
            texture.layer.opacity = 0
            ChestSprite.layer.opacity = 0
        }
        if(flag == 4 && cassa == false){
            
            texture.frame = dimSimulazione
            texture.isEditable = false
            texture.backgroundColor = .black
            texture.layer.opacity = 0.75
            texture.layer.zPosition = 10
            cassa = true
            ChestSprite.image = UIImage(named: "ChestAlpha.png")
            ChestSprite.layer.zPosition = 15
            flag += 1
        }
         */
        if(flag >= riempimento){
            testo.text = "Fine Capitolo 1."
        }
        else if(cassa == false){
            testo.text = texts[flag]
            flag += 1
        }
        
    }
}

PlaygroundPage.current.liveView = PrologueController()
