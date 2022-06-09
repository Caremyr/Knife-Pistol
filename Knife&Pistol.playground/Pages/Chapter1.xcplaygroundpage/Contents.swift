import SwiftUI
import PlaygroundSupport
import UIKit
import Foundation
import Darwin

let dimSimulazione = CGRect(x: 0, y: 0, width: 640, height: 360)
let dimDialogueBox = CGRect(x: 15, y: 160, width: 640, height: 220)
let WilliamImg = UIImage(named: "WilliamIdle.png")!
let GeorgeImg = UIImage(named: "George.png")!
let ChestImg = UIImage(named: "ChestAlpha.png")!
let arrow = UIImage(named: "Button1.png")!
let nero = UIImage(named: "Black.jpg")
let ColoreBackTesto = UIColor(white: 0, alpha: 0)
let EldritchImg = UIImage(named: "EldritchCreature.png")!
let deadWilliam = UIImage(named: "DeadWilliam.png")!
let deadFather = UIImage(named: "DeadFather.png")!
//Importing monster sprite

var flag = 0

let speakerName1 = ["George","","","William","George","William","","George","William","William","George","","George","George",""]
let dialogueBoxArray1 = ["DialogueBox2.png","DialogueBox.png","DialogueBox.png","DialogueBox2.png","DialogueBox2.png","DialogueBox2.png","DialogueBox.png","DialogueBox2.png","DialogueBox2.png","DialogueBox2.png","DialogueBox2.png","DialogueBox.png","DialogueBox2.png","DialogueBox2.png","DialogueBox.png"]
let narrazione = [
    "Would you look at that, if it isn't William! What are you doing in my humble shop on this fine morning?",
    "If it wasn’t for his hood, which covered his whole young face, the aversion in William expression would be clear as a sunny summer day, showing how much he despised the man who just spoke to him. ",
    "George was an underground dealer, who bought stolen good for a few coins and resold them with an unreasonable price. William would prefer to not meddle with the likes of him, but no one else is willing to buy the results of his poor pickpocket, so he has… well, to make do.",
    "Yo George, you can stop the chitchat, I am only here to sell something.",
    "Fine then, show me what you got this time.",
    "There you go.",
    "William quickly showed the luxurious chest, as it was a truly remarkable and valuable prize, but George didn’t seem impressed, not even for a bit. The petty thief was sure it was just an act to put his dirty hands on the treasure for half of its value.",
    "Well, it looks like junk to me, worth no more than a few pennies.",
    "Come on, man, it must be worth something more! Damn, I got through so much shit to get this thing. You think it’s easy to break in the London Crossroad Museum? I don’t even know how I managed to return unscathed after taking this valuable! ",
    "Man, it was so close! I had to stab a fat and stupid guard to get here safely!",
    "I don’t care what you had to do to get whatever junk you get here. If I say that’s worth just few pennies, then that’s his price. Take or leave.",
    "The young boy felt his blood boiling in his veins for the anger, but George, that old fox, smirked as he gave William a deal that he could not refuse.",
    "Well, luckily for you, I’m a true gentleman. How about we make an innocent bet? ",
    "You can sell this thing to me like it is, locked, and I’ll grace you with one or two shellings, or you can break it open and, if it’s actually something interesting, I’ll give you the double of its value, otherwise you get nothing. Seems fair, doesn’t it? I’ll even get the tools you need!",
    "[What will William do?]"
]

let speakerName2 = ["William", "", "", "George", "", "", ""]
let dialogueBoxArray2 = ["DialogueBox2.png","DialogueBox.png","DialogueBox.png","DialogueBox2.png","DialogueBox.png","DialogueBox.png","DialogueBox.png"]
let goodTesto = [
    "Ok, let's open it, if if we find anything valuable, you'll have to give me more than double.",
    "After George broke the chest open, a little piece of glass came out, it was very heavy compared to its size.",
    "It was not made of mere glass, but it looked like a strange ore that William had never seen; in William's hands it was strangely warm and it glowed.",
    "I told you it was just garbage, take this junk and go away.",
    "When William was about to leave, the slab began to heat up more and more in his hands until William's hand burned.",
    "Aching from the burn, William dropped the slab which broke on impact, the broken slab released a strong light that flooded the shop and blinded the two men.",
    "When the light faded, George vanished and William was left alone, the shop was destroyed, only William and the artifact remained in the scene and from the shards of the artifact something appeared."
]

let speakerName3 = ["William","George","","","","","","Abomination","","","","","","","","","","","William","","",""]
let dialogueBoxArray3 = ["DialogueBox2.png","DialogueBox2.png","DialogueBox.png","DialogueBox.png","DialogueBox.png","DialogueBox.png","DialogueBox.png","DialogueBox2.png","DialogueBox.png","DialogueBox.png","DialogueBox.png","DialogueBox.png","DialogueBox.png","DialogueBox.png","DialogueBox.png","DialogueBox.png","DialogueBox.png","DialogueBox.png","DialogueBox2.png","DialogueBox.png","DialogueBox.png","DialogueBox.png"]
let badTesto = [
    "George, are you mad ? I don’t wanna break it, take it as it is and give me my money, if you break it you will devalue it",
    "Give me this junk and take your few money and go away , I’ll break it by myself",
    "While William was walking through the door he saw George breaking the chest out of the corner of his eye.",
    "George found only a strange piece of glass inside the box, it was very heavy compared to its size , It was not made of mere glass, but it looked like a strange ore that George had never seen.",
    "In George’s hands it was strangely warm and it glowed, the slab began to heat up more and more in his hands until George’s hand burned.",
    "Aching from the burn, George dropped the slab which broke on impact, the broken slab released a strong light that flooded the shop and blinded the merchant.",
    "William was now out of the shop, as soon as he saw the strong light, he turned around and went back in the store. The shop was destroyed, a weird fog pervaded the locatio and George vanished. From the shards of the artifact something appeared",
    "Who aroused the wrath of the ancients?... it was not you, because if your hands had touched the artifact, now your hands would bear the mark.",
    "The Eldritch creature jumped on the thief, who rushedly tried to run for his life, but the horrendous monster was way faster than him and it quickly reached his frightened prey.",
    "William instinctively drew his trusted knife and stabbed the beast as a desperate measure to save himself.",
    "And yet, even if the Eldritch creature felt the unexpected blow, it managed to shoot something towards William’s chest, making him fall on the ground with a distinct sound. ",
    "The pain instantly grasped his whole body and his breath couldn’t help but become shorter and shorter. Even if this mysterious object just hit him, William was still not able to understand what the hell did that damned being blast.",
    "While the injured boy wriggled for the unbearable pain, the creature let out a cry quavered with rage and shock, before crumbling on himself.",
    "After that, the dark fog enveloping the shop and the monster's silhoutte faded away, slowly and steadily showing the man in the museum, the same one William stabbed before all this surreal experience.",
    "Only when the black veil completely vanished, the thief had the chance to see with horror the true behind all this absurd vision: he never left the museum, he never met George, he never managed to escape with the spoils of his thievery. This was just a pre-mortem hallucination.",
    "He was shot by the same guard he attacked as a last anguished act, before William’s hopeless run. ",
    "Even if William’s vision was extremely blurry, due to the agony felt in his last moment, he manages to get a glimpse on the guard’s face, who just let that ending blow, and what he realized made his almost dead body shiver in shock and despair.",
    "It was in that moment that William knew… he fucked up.",
    "F-FATHER… OH, GOD, NO, PLEASE…",
    "Yes, the lawman who layed on the floor lifeless with a dagger stuck in his chest, the guard William killed in his last moments, was his father, the same father he respected so much, even when the young boy was forced to leave home due to his mother madness.",
    "Just like William, his dad couldn’t recognize his son in the dark, during that improvised theft, and shot briskly against the same boy he searched aimlessly after his run-away from home.. ",
    "William tried to reach the dead body of father, to say sorry for the very last time, to say that he still cared for him. But it was too late: while he crawled to his father silhouette, he passed a way with a faint rattle."
]

var counter = 0;

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
    let speakerName = UITextView()
    let testo1 = UITextView()
    let choice2 = UIButton()
    let testo2 = UITextView()
    let goodText = UITextView()
    let goodButton = UIButton()
    let badText = UITextView()
    let badButton = UIButton()
    let sfondoNero = UIImageView()
    let EldritchSprite = UIImageView()
    let fatherSprite = UIImageView()
        
    override func loadView() {
        super.loadView()
        self.view = Vista
        creaVista()
    }
    
    func creaVista(){
        Vista.frame = dimSimulazione
        
        Vista.addSubview(sfondo)
        Vista.addSubview(fatherSprite)
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
        Vista.addSubview(speakerName)
        Vista.addSubview(EldritchSprite)
        
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
        
        if(flag == 0){
            //Assigning the dialoguebox image and layer position
            testoBox.image = UIImage(named: "DialogueBox2.png")
            testoBox.layer.zPosition = 5
            
            //Assigning William's Sprite image, layer position, canvas position and dimension
            WilliamSprite.image = WilliamImg
            WilliamSprite.frame = CGRect(x: -80, y: Vista.frame.midY - 125, width: WilliamImg.size.width/3, height: WilliamImg.size.height/3)
            WilliamSprite.layer.zPosition = 3
            
            //Assigning the Eldritch Abomination's Sprite image, layer position, canvas position and dimension
            GeorgeSprite.image = GeorgeImg
            GeorgeSprite.frame = CGRect(x: 320, y: 65, width: GeorgeImg.size.width/3, height: GeorgeImg.size.height/3)
            GeorgeSprite.layer.zPosition = 3
            
            //Assigning the string of who is speaking to the appropriate variable, setting the background color to transparent, setting the layer position, the position in the canvas and the dimension
            speakerName.text = speakerName1[flag]
            speakerName.backgroundColor = ColoreBackTesto
            speakerName.layer.zPosition = 7
            speakerName.frame = CGRect(x: 185, y: 208, width:100 , height:30 )
            
            //Same as before but for the actual text being spoken/narrated
            testo.text = narrazione[flag]
            testo.backgroundColor = ColoreBackTesto
            testo.isEditable = false
            testo.frame = CGRect(x: 195, y: Vista.frame.maxY - 125, width: 300, height: 100)
            testo.layer.zPosition = 5
            
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
            //Creating the fade in effect for George's being sprite
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0){
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.GeorgeSprite.alpha = 0
                })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.GeorgeSprite.alpha = 1
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
            flag += 1
            
        }
        else{
            speakerName.text = speakerName1[flag]
            testo.text = narrazione[flag]
            testoBox.image = UIImage(named: dialogueBoxArray1[flag])
            flag += 1
        }
        

        if(flag == 6){
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
        if(flag == 8){
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

        if(flag  == riempimento){
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
        
        speakerName.text = speakerName2[0]
        testoBox.image = UIImage(named: dialogueBoxArray2[0])
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
        speakerName.text = speakerName2[flag+1]
        testoBox.image = UIImage(named: dialogueBoxArray2[flag+1])
        goodText.text = goodTesto[flag+1]
        flag += 1
        if (flag + 1 == riempGood) {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5){
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
        
        speakerName.text = speakerName3[0]
        testoBox.image = UIImage(named: dialogueBoxArray3[0])
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
        speakerName.text = speakerName3[flag+1]
        testoBox.image = UIImage(named: dialogueBoxArray3[flag+1])
        badText.text = badTesto[flag+1]
        flag += 1
        //When I reach this dialogue i fade away George's Sprite
        if(flag == 6){
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0){
                UIView.animate(withDuration: 3.0, animations: {() -> Void in self.GeorgeSprite.alpha = 1
                })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.GeorgeSprite.alpha = 0
                })
            }
        }
        //When I reach this dialogue I remove George's sprite and bring in the eldritch's being sprite
        if(flag == 7){
            GeorgeSprite.removeFromSuperview()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0){
                UIView.animate(withDuration: 3.0, animations: {() -> Void in self.sfondo.alpha = 1
                })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.sfondo.alpha = 0
                })
            }

            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5){
                self.sfondo.image = UIImage(named: "SmokeyShop.png")
                UIView.animate(withDuration: 3.0, animations: {() -> Void in self.sfondo.alpha = 0
                })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.sfondo.alpha = 1
                })
                self.EldritchSprite.image = EldritchImg
                self.EldritchSprite.frame = CGRect(x: 320, y: 65, width: EldritchImg.size.width/3, height: EldritchImg.size.height/3)
                self.EldritchSprite.layer.zPosition = 3
                //Creating the fade in effect for the Eldritch's being sprite
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0){
                    UIView.animate(withDuration: 2.0, animations: {() -> Void in self.EldritchSprite.alpha = 0
                    })
                    UIView.animate(withDuration: 2.0, animations: {() -> Void in self.EldritchSprite.alpha = 1
                    })
                }
            }
        }
        
        if(flag == 14){
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0){
                UIView.animate(withDuration: 3.0, animations: {() -> Void in self.sfondo.alpha = 1
                })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.sfondo.alpha = 0
                })
                UIView.animate(withDuration: 3.0, animations: {() -> Void in self.WilliamSprite.alpha = 1
                })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.WilliamSprite.alpha = 0
                })
                UIView.animate(withDuration: 3.0, animations: {() -> Void in self.EldritchSprite.alpha = 1
                })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.EldritchSprite.alpha = 0
                })
            }
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5){
                self.sfondo.image = UIImage(named: "Museum.png")
                self.EldritchSprite.removeFromSuperview()
                self.WilliamSprite.image = deadWilliam
                self.fatherSprite.image = deadFather
                self.fatherSprite.frame = CGRect(x: 320, y: 65, width: deadFather.size.width/3, height: deadFather.size.height/3)
                self.fatherSprite.layer.zPosition = 3
                UIView.animate(withDuration: 3.0, animations: {() -> Void in self.sfondo.alpha = 0
                })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.sfondo.alpha = 1
                })
                //Creating the fade in effect for the Eldritch's being sprite
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.WilliamSprite.alpha = 0
                    })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.WilliamSprite.alpha = 1
                    })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.fatherSprite.alpha = 0
                    })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.fatherSprite.alpha = 1
                    })
                
            }
        }
        if(flag == (riempBad)-1){
            badButton.removeFromSuperview()
        }
        
    }
}

PlaygroundPage.current.liveView = Chapter1Controller()
    
