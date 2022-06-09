import SwiftUI
import PlaygroundSupport
import UIKit
import Foundation
import Darwin

let dimSimulazione = CGRect(x: 0, y: 0, width: 640, height: 360)
let dimDialogueBox = CGRect(x: 15, y: 160, width: 640, height: 220)
let WilliamImg = UIImage(named: "William1.png")!
let GeorgeImg = UIImage(named: "George.png")!
let ChestImg = UIImage(named: "ChestAlpha.png")!
let arrow = UIImage(named: "Button1.png")!
let nero = UIImage(named: "Black.jpg")!
let ColoreBackTesto = UIColor(white: 0, alpha: 0)

var flag = 0

let narrazione = [
    "Would you look at that, if it isn't William! What are you doing in my humble shop on this fine morning?",
    "Yo George, you can stop the chitchat, I am only here to sell something.",
    "Fine then, show me what you got this time.",
    "There you go.",
    "Well, it looks like junk to me, worth no more than a few pennies.",
    "Come on George, it is surely worth more than a few pennies, I got through so much trouble to get it. I stole it from the London Crossroad Museum, there was a wide variety of valuables, but I only managed to get this one. ",
    "You see, while I was stealing this item I got discovered by a guard, damn I even had to stab the fat guy to get away, it was close.",
    "Fine then. I'll tell you what, let's make a bet. You can sell it to me like it is, locked, and I'll give you 1 shelling, or you can choose to break it open before selling it and if it is something actually valuable I'll give you double its value, otherwise you get nothing. Seems fair doesn't it? I'll get the tools if you want.",
    "[What Williams will do?]"
]

let goodTesto = [
    "ok , let's open it , if if we find anything of value, you'll have to give me more than the double",
    "After George broke the chest open , a little piece of glass came out , it was very heavy compared to its size.",
    "It was not made of mere glass , but it looked like a strange ore that William had never seen; in William's hands it was strangely warm and it glowed.",
    "I told you it was just garbage , take this junk and go away.",
    "When William started to leave , the slab began to heat up more and more in his hands until William's hand burned.",
    "Aching from the burn, William dropped the slab which broke on impact , the broken slab released a strong glow that flooded the shop and blinded the two men.",
    "When the light faded, George vanished and William was left alone , the shop was destroyed, only William and the artifact remained in the scene and from the shards of the artifact something appeared.",
    "GEORGE …. where the hell are you ? …. my hand burns and I don't understand where we are",
    "You have awakened something truly dangerous human, your end is near and your soul is impure, redeem yourself and fight or flee and you will perish , there is a mark on your hand , I know who you are"

]

let badTesto = [
    "George , are you mad ? I don’t wanna break it , take it as it is and give me my money , if you break it you will devalue it",
    "give me this junk and take your few money and go away , I’ll break it by myself",
    "While William walked through the door he saw George breaking the chest out of the corner of his eye.",
    "George found only a strange piece of glass inside the box , it was very heavy compared to its size , It was not made of mere glass , but it looked like a strange ore that George had never seen; and in George’s hands it was strangely warm and it glowed, the slab began to heat up more and more in his hands until George’s hand burned.",
    "Aching from the burn, George dropped the slab which broke on impact , the broken slab released a strong glow that flooded the shop and blinded the merchant",
    "William was now out of the shop , as soon as he saw the strong light , he turned to the store . the shop was destroyed and George vanished. From the shard of the artifact something appeared",
    "who aroused the wrath of the ancients? ….. it was not you , because if your hands had touched the artifact, now your hands would bear the mark"
]

let riempimento = narrazione.count
let riempGood = goodTesto.count
let riempBad = badTesto.count

class Chapter1Controller: UIViewController{
    
    //Variabili Classe
    let Vista = UIView()
    let sfondo = UIImageView(frame: dimSimulazione)
    let testo = UITextView()
    let texture = UITextView()
    let WilliamSprite = UIImageView()
    let testoBox = UIImageView(frame: dimDialogueBox)
    let GeorgeSprite = UIImageView()
    let ChestSprite = UIImageView()
    let nextButton = UIButton()
    let choice1 = UIButton()
    let testo1 = UITextView()
    let choice2 = UIButton()
    let testo2 = UITextView()
    let goodText = UITextView()
    let goodButton = UIButton()
    let badText = UITextView()
    let badButton = UIButton()
    let sfondoNero = UIImageView()
        
    override func loadView() {
        super.loadView()
        self.view = Vista
        creaVista()
    }
    
    func creaVista(){
        Vista.frame = dimSimulazione
        Vista.addSubview(sfondo)
        Vista.addSubview(testoBox)
        Vista.addSubview(WilliamSprite)
        Vista.addSubview(GeorgeSprite)
        Vista.addSubview(nextButton)
        Vista.addSubview(texture)
        Vista.addSubview(testo)
        Vista.addSubview(choice1)
        Vista.addSubview(testo1)
        Vista.addSubview(choice2)
        Vista.addSubview(testo2)
        Vista.addSubview(goodText)
        Vista.addSubview(goodButton)
        Vista.addSubview(badText)
        Vista.addSubview(badButton)
        Vista.addSubview(ChestSprite)
        Vista.addSubview(sfondoNero)
        
        sfondo.image = UIImage(named: "Dealer'sShop.png")
        sfondo.layer.zPosition = 0
        
        texture.frame = dimSimulazione
        texture.isEditable = false
        texture.backgroundColor = .white
        texture.layer.zPosition = 10
                
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1){
            UIView.animate(withDuration: 2.0, animations: {() -> Void in self.texture.alpha = 1
            })
            UIView.animate(withDuration: 2.0, animations: {() -> Void in self.texture.alpha = 0
            })
        }
        
        testoBox.layer.zPosition = 4
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1){
            UIView.animate(withDuration: 20.0, animations: {() -> Void in self.testoBox.alpha = 0
            })
            UIView.animate(withDuration: 4.0, animations: {() -> Void in self.testoBox.alpha = 0.75
            })
        }
        
        WilliamSprite.image = WilliamImg
        WilliamSprite.frame = CGRect(x: -70, y: 65, width: WilliamImg.size.width/3, height: WilliamImg.size.height/3)
        WilliamSprite.layer.zPosition = 1
        
        GeorgeSprite.image = GeorgeImg
        GeorgeSprite.frame = CGRect(x:355, y:40, width: GeorgeImg.size.width/3, height: GeorgeImg.size.height/3)
        GeorgeSprite.layer.zPosition = 1
        
        testo.isEditable = false
        testo.backgroundColor = ColoreBackTesto
        testo.frame = CGRect(x: 195, y: Vista.frame.maxY - 125, width: 300, height: 100)
        testo.layer.zPosition = 5
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1){
            UIView.animate(withDuration: 20.0, animations: {() -> Void in self.testo.alpha = 0
            })
            UIView.animate(withDuration: 4.0, animations: {() -> Void in self.testo.alpha = 1
            })
        }
        
        addNextButton()
    }
    
    func addNextButton(){
        nextButton.layer.zPosition = 9
        nextButton.frame = CGRect (x:525 , y:Vista.frame.maxY-60 ,width:60 ,height:40 )
        nextButton.setBackgroundImage(arrow, for: .normal)
        nextButton.tag = 0
        nextButton.addTarget(self, action: #selector(nextLabel) ,for: .touchUpInside)
    }
    
    @objc func nextLabel(){
        testo.text = narrazione[flag+1]
        flag += 1
        if (flag == 1){
            testoBox.image = UIImage(named: "DialogueBox2.png")
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()){
                UIView.animate(withDuration: 1.0, animations: {() -> Void in self.testoBox.alpha = 0
                })
                UIView.animate(withDuration: 1.0, animations: {() -> Void in self.testoBox.alpha = 1
                })
            }
            testo.text = narrazione[0]
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()){
                UIView.animate(withDuration: 1.0, animations: {() -> Void in self.testo.alpha = 0
                })
                UIView.animate(withDuration: 1.0, animations: {() -> Void in self.testo.alpha = 1
                })
            }
            
        }
        if(flag == 3){
            ChestSprite.image = ChestImg
            ChestSprite.frame = CGRect(x:Vista.frame.midX - 70 , y:90, width:152 , height:128)
            ChestSprite.layer.zPosition = 3
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()){
                UIView.animate(withDuration: 1.0, animations: {() -> Void in self.ChestSprite.alpha = 0
                })
                UIView.animate(withDuration: 1.0, animations: {() -> Void in self.ChestSprite.alpha = 1
                })
            }
            sfondoNero.image = nero
            sfondoNero.frame = dimSimulazione
            sfondoNero.layer.zPosition = 2
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()){
                UIView.animate(withDuration: 1.0, animations: {() -> Void in self.sfondoNero.alpha = 0
                })
                UIView.animate(withDuration: 1.0, animations: {() -> Void in self.sfondoNero.alpha = 0.5
                })
            }
        }
        if(flag == 4){
            ChestSprite.image = ChestImg
            ChestSprite.frame = CGRect(x:Vista.frame.midX - 70 , y:90, width:152 , height:128)
            ChestSprite.layer.zPosition = 1
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()){
                UIView.animate(withDuration: 1.0, animations: {() -> Void in self.ChestSprite.alpha = 1
                })
                UIView.animate(withDuration: 1.0, animations: {() -> Void in self.ChestSprite.alpha = 0
                })
            }
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()){
                UIView.animate(withDuration: 1.0, animations: {() -> Void in self.sfondoNero.alpha = 0.5
                })
                UIView.animate(withDuration: 1.0, animations: {() -> Void in self.sfondoNero.alpha = 0
                })
            }
        }

        if(flag + 1 == riempimento){
            nextButton.removeFromSuperview()
            
            testo1.text = ">Open."
            testo1.isEditable = false
            testo1.font = .italicSystemFont(ofSize: 14)
            testo1.backgroundColor = ColoreBackTesto
            testo1.frame = CGRect(x: 195, y: Vista.frame.maxY - 100, width: 100, height: 30)
            testo1.layer.zPosition = 5
            
            addChoice1()
            
            testo2.text = ">Don't open."
            testo2.isEditable = false
            testo2.font = .italicSystemFont(ofSize: 14)
            testo2.backgroundColor = ColoreBackTesto
            testo2.frame = CGRect(x: 195, y: Vista.frame.maxY - 75, width: 100, height: 30)
            testo2.layer.zPosition = 5
            
            addChoice2()
        }
    }
    
    func addChoice1(){
        choice1.layer.zPosition = 6
        choice1.frame = CGRect(x: 300, y: Vista.frame.maxY - 95, width: 30, height: 20)
        choice1.setBackgroundImage(arrow, for: .normal)
        choice1.tag = 0
        choice1.addTarget(self, action: #selector(nextLabel1), for: .touchUpInside)
    }
    
    func addChoice2(){
        choice2.layer.zPosition = 6
        choice2.frame = CGRect(x: 300, y: Vista.frame.maxY - 70, width: 30, height: 20)
        choice2.setBackgroundImage(arrow, for: .normal)
        choice2.tag = 0
        choice2.addTarget(self, action: #selector(nextLabel2), for: .touchUpInside)
    }
    
    @objc func nextLabel1(){
        testo.removeFromSuperview()
        testo1.removeFromSuperview()
        testo2.removeFromSuperview()
        choice1.removeFromSuperview()
        choice2.removeFromSuperview()
        
        goodText.text = goodTesto[0]
        goodText.isEditable = false
        goodText.frame = CGRect(x: 195, y: Vista.frame.maxY - 125, width: 300, height: 100)
        goodText.backgroundColor = ColoreBackTesto
        goodText.layer.zPosition = 5
        
        flag = 0
        
        addGoodButton()
    }
    
    func addGoodButton(){
        goodButton.layer.zPosition = 9
        goodButton.frame = CGRect (x:525 , y:Vista.frame.maxY-60 ,width:60 ,height:40 )
        goodButton.setBackgroundImage(arrow, for: .normal)
        goodButton.tag = 0
        goodButton.addTarget(self, action: #selector(nextGoodLabel) ,for: .touchUpInside)
    }
    
    @objc func nextGoodLabel(){
        goodText.text = goodTesto[flag+1]
        flag += 1
        if (flag + 1 == riempGood) {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1){
                UIView.animate(withDuration: 3.0, animations: {() -> Void in self.texture.alpha = 0
                })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.texture.alpha = 1
                })
            }
            goodButton.removeFromSuperview()
        }
    }
    
    
    
    @objc func nextLabel2(){
        testo.removeFromSuperview()
        testo1.removeFromSuperview()
        testo2.removeFromSuperview()
        choice1.removeFromSuperview()
        choice2.removeFromSuperview()
        
        badText.text = badTesto[0]
        badText.isEditable = false
        badText.frame = CGRect(x: 195, y: Vista.frame.maxY - 125, width: 300, height: 100)
        badText.backgroundColor = ColoreBackTesto
        badText.layer.zPosition = 5
        
        flag = 0
        
        addBadButton()
    }
    
    func addBadButton(){
        badButton.layer.zPosition = 9
        badButton.frame = CGRect (x:525 , y:Vista.frame.maxY-60 ,width:60 ,height:40 )
        badButton.setBackgroundImage(arrow, for: .normal)
        badButton.tag = 0
        badButton.addTarget(self, action: #selector(nextBadLabel) ,for: .touchUpInside)
    }
    
    @objc func nextBadLabel(){
        badText.text = badTesto[flag+1]
        flag += 1
        if (flag + 1 == riempBad) {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1){
                UIView.animate(withDuration: 3.0, animations: {() -> Void in self.texture.alpha = 0
                })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.texture.alpha = 1
                })
            }
            badButton.removeFromSuperview()
        }
    }
}

PlaygroundPage.current.liveView = Chapter1Controller()
