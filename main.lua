local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
   local sceneGroup = self.view
	
   local S1=display.newRect(display.contentWidth*0.5, display.contentHeight*0.27,465,35)
   S1:setFillColor(0)
   sceneGroup:insert(S1)

   local S2=display.newRect(display.contentWidth*0.5, display.contentHeight*0.40,465,35)
   S2:setFillColor(0)
   sceneGroup:insert(S2)

   local Iroom = display.newImageRect("image/Iroom.png",1280,720)
   Iroom.x,Iroom.y=display.contentWidth*0.5, display.contentHeight*0.5
   sceneGroup:insert(Iroom)

   local detective = display.newImageRect("image/detective.png",1280,720) 
   detective.x, detective.y = display.contentWidth*0.5, display.contentHeight*0.5
   sceneGroup:insert(detective)
   detective.fill.effect = "filter.brightness"
   detective.fill.effect.intensity = 0

   local sA = display.newImageRect("image/양도일.png",1280,700) 
   sA.x, sA.y = display.contentWidth*0.5, display.contentHeight*0.5
   sceneGroup:insert(sA)
   sA.fill.effect = "filter.brightness"
   sA.fill.effect.intensity = -0.2

   local menu = display.newImageRect("image/menu.png",1280,720)
   menu.x,menu.y=display.contentWidth*0.5, display.contentHeight*0.5
   sceneGroup:insert(menu)

   local skip = display.newImageRect("image/skip.png",81,40)
   skip.x,skip.y=display.contentWidth*0.795, display.contentHeight*0.67
   sceneGroup:insert(skip)

   local log = display.newImageRect("image/log.png",81,41)
   log.x,log.y=display.contentWidth*0.865, display.contentHeight*0.675
   sceneGroup:insert(log)

   local home = display.newImageRect("image/homebutton.png",1280,720)
   home.x,home.y=display.contentWidth*0.5, display.contentHeight*0.5
   sceneGroup:insert(home)

   local detectiveChatting = display.newImageRect("image/detectiveText.png",1280,720) 
   detectiveChatting.x, detectiveChatting.y = display.contentWidth*0.5, display.contentHeight*0.5
   detectiveChatting.alpha=0
   sceneGroup:insert(detectiveChatting)

   local suspectChatting = display.newImageRect("image/양도일Text.png",1280,720) 
   suspectChatting.x, suspectChatting.y = display.contentWidth*0.5, display.contentHeight*0.5
   suspectChatting.alpha=0
   sceneGroup:insert(suspectChatting)

   local first = display.newImageRect("image/firstselect.png",1280,720)
   first.x,first.y=display.contentWidth*0.5,display.contentHeight*0.5
   first.alpha =0
   sceneGroup:insert(first)    

   local second = display.newImageRect("image/secondselect.png",1280,720)
   second.x,second.y=display.contentWidth*0.5,display.contentHeight*0.5
   second.alpha =0
   sceneGroup:insert(second)

   local talk = { }
   local talkGroup = display.newGroup()
   local showTalk

   talk[1]=" "
   talk[2]="이름 양도일. 50세 남성. 피해자 양신일의 쌍둥이 동생.\n어릴적에 아스퍼거증후군 진단을 받으셨다죠? 타인과 잘 어울리지 못할 뿐\n평범한 의사소통은 가능하다 들었습니다만."
   talk[3]=" ................."
   talk[4]="피해자의 사망 추정시간동안 본인은 무엇을 하고 있었는지 알리바이를 말씀해주시죠."
   talk[5]="........"
   talk[6]="양도일씨? 계속 아무것도 말씀 안하실겁니까?"
   talk[7]="아는건 다 말했어... 나는 안죽였다니까... 더 이상 할말없어 저리가..."
   talk[8]="'예상대로 대화를 거부하는 모습이다. 상태도 많이 불안정해 보이는데...\n하나 남은 가족이 죽어서일까 아니면 본인이 진짜 범인이기 때문일까.'"
   talk[9]="'역시...'"

   local click=1

   local showTalk = display.newText(talk[1], display.contentWidth*0.5, display.contentHeight*0.8, "fonts/nanumgothic")
   showTalk:setFillColor(0)
   showTalk.size = 20
   sceneGroup:insert(showTalk)

   local selection1="양도일은 범인이기에 부족한 사람같다.\n"
   local selection2="면담만으로 판단하기는 어렵다."

   local showSelection1
   local showSelection2
   local showResult

   local result1="그래. 이런 사람을 용의자로 두고 면담하는건 시간낭비같다.... \n그래도 대충 넘기는건 안될 말이지. 과거만 빠르게 살펴보기로 할까."
   local result2="과거를 살펴보면 뭐라도 알아낼 수 있을 것 같다."


   local function catch(event)
        click=click+1

        if click==1 then 
            detectiveChatting.alpha=0
            suspectChatting.alpha=0            
            showTalk.alpha=0
        end

        if click==2 or click==4 or click==6 or click==8 then         
            detective.fill.effect.intensity =0
            sA.fill.effect.intensity =-0.2
            suspectChatting.alpha=0
            detectiveChatting.alpha=1
        else 
            sA.fill.effect.intensity =0
            detective.fill.effect.intensity =-0.2
            detectiveChatting.alpha=0
            suspectChatting.alpha=1

        end
            showTalk.text = talk[click]
        
        if click == 9 then
            suspectChatting.alpha=0
            detectiveChatting.alpha=0

            showSelection1 = display.newText(selection1, display.contentWidth*0.5, display.contentHeight*0.29, "fonts/nanumgothic" )
            showSelection1:setFillColor(0)
            showSelection1.size = 18
            sceneGroup:insert(showSelection1)
            first.alpha=1

            showSelection2 = display.newText(selection2, display.contentWidth*0.5, display.contentHeight*0.40, "fonts/nanumgothic")
            showSelection2:setFillColor(0)
            showSelection2.size = 18
            sceneGroup:insert(showSelection2)
            second.alpha =1
            
        end

        if click>=9 then
        	sA.fill.effect.intensity =0
            detective.fill.effect.intensity =0
            suspectChatting.alpha=0
            detectiveChatting.alpha=1
        end
    end

    Iroom:addEventListener("tap",catch) 


    local function select1(event)
        if click>=9 then
        display.remove(showSelection1)
        display.remove(showSelection2)
        detectiveChatting.alpha=1

        first.alpha=0
        second.alpha=0

        showResult = display.newText(result1, display.contentWidth*0.5, display.contentHeight*0.8, "fonts/nanumgothic")
        showResult:setFillColor(0)
        showResult.size = 20
        sceneGroup:insert(showResult)
        end
    end

    S1:addEventListener("tap",select1) 

    local function select2(event)
    	if click>=9 then

        first.alpha =0
        second.alpha =0
        display.remove(showSelection1)
        display.remove(showSelection2)
        detectiveChatting.alpha=1
        first.alpha=0
        second.alpha=0

        showResult = display.newText(result2, display.contentWidth*0.5, display.contentHeight*0.8, "fonts/nanumgothic")
        showResult:setFillColor(0)
        showResult.size = 20
        sceneGroup:insert(showResult)
        end

    end

    S2:addEventListener("tap",select2) 

    local function next(event)
    	if click>=11 then
       composer.setVariable("complete", true)
        local options={
          effect="fade",
          time=400
        }
        composer.gotoScene("view7",options)
        end
    end

    local function next2(event)
          composer.setVariable("complete", true)
         local options={
          effect="fade",
          time=500
           }
         composer.gotoScene("view7",options)
      end
       skip:addEventListener("tap",next2)



    Iroom:addEventListener("tap",next) 
 

end
