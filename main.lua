local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
    local sceneGroup = self.view
	
    local S1=display.newRect(display.contentWidth*0.5, display.contentHeight*0.275,465,35)
    S1:setFillColor(0)
    sceneGroup:insert(S1)
 
    local S2=display.newRect(display.contentWidth*0.5, display.contentHeight*0.40,465,35)
    S2:setFillColor(0)
    sceneGroup:insert(S2)

    local Iroom = display.newImageRect("image/Iroom.png",1280,720)
    Iroom.x,Iroom.y=display.contentWidth*0.5, display.contentHeight*0.5
    sceneGroup:insert(Iroom)

    local vic = display.newImageRect("image/양신일.jpg", 1000, 600) 
    vic.x,vic.y = display.contentWidth*0.5, display.contentHeight*0.475
    vic.alpha=0
    sceneGroup:insert(vic)

    local detective = display.newImageRect("image/detective.png",1280,720) 
    detective.x, detective.y = display.contentWidth*0.5, display.contentHeight*0.5
    sceneGroup:insert(detective)
    detective.fill.effect = "filter.brightness"
    detective.fill.effect.intensity = 0

    local wife = display.newImageRect("image/진선미2.png",1280,720) 
    wife.x, wife.y = display.contentWidth*0.5, display.contentHeight*0.5
    sceneGroup:insert(wife)
    wife.fill.effect = "filter.brightness"
    wife.fill.effect.intensity = 0
    wife.alpha=0

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
    detectiveChatting.alpha=1
    sceneGroup:insert(detectiveChatting)

    local wifeChatting = display.newImageRect("image/진선미Text.png",1280,720) 
    wifeChatting.x, wifeChatting.y = display.contentWidth*0.5, display.contentHeight*0.5
    wifeChatting.alpha=0
    sceneGroup:insert(wifeChatting)

    local hacChatting = display.newImageRect("image/hacText.png",1280,720) 
    hacChatting.x, hacChatting.y = display.contentWidth*0.5, display.contentHeight*0.5
    hacChatting.alpha=0
    sceneGroup:insert(hacChatting)

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

    talk[1]="진선미씨. 더 이상 물러설 곳은 없습니다. 이제 그만 자백하시죠. 당신이 이번 사건의 진범이라고."
    talk[2]=".. 무슨말을 하는건지 모르겠습니다. 웃음밖에 안나오네요. \n진범을 잡겠다고 자신하더니 고른 사람이 나인가요?"
    talk[3]="어쩌구 저쩌구 그간의 알리바이 읊으며 너가 진범이라는 대사"
    talk[4]="내가 몇번을 말했나요, 나는 범인이 아니에요! \n당신이라면 정말 범인을 잡을 수 있을 것 같아 내가 어디에서도 \n말하지않은 과거사까지 밝혔는데.. 됐습니다. 이젠 다 필요없어요..."
    talk[5]="아아 탐정아 들려? 나 아직 안늦은거 맞지? \n어제 너가 해달라고 부탁한거 있잖아, 지금 해결했어! \n바로 보내줄테니까 확인해봐!"
    talk[6]="'... 사체의 신원이 양도일이라고?'"
    talk[7]="'....'"
    talk[8]="'...! 성급했다. 확실하지도 않은 증거로 진범을 너무 빨리 특정해버렸어. \n아직 시간이 남아있다. 차근차근 생각해서 범인을 다시 지목하자.'"
    talk[9]="농담이었습니다. 많이 억울해보이시네요. 덕분에 당신은 진범이 아니라는 확신을 얻었습니다."
    talk[10]=".. 장난하세요? "
    talk[11]="죄송합니다. 이번엔 진짜로 밝히겠습니다. 방금까지 속으로 웃고계셨을텐데, 그만 자백하시죠. "

    local click=1

    local showTalk = display.newText(talk[1], display.contentWidth*0.5, display.contentHeight*0.8, "fonts/nanumgothic")
    showTalk:setFillColor(0)
    showTalk.size = 20
    sceneGroup:insert(showTalk)

    local selection1="양도일"
    local selection2="양재진"

    local showSelection1
    local showSelection2

    local showResult

    local result1="'잠깐, 양재진이 확실한가? 분명 부검서에는 피해자의 신원이 \n양도일이라고 적혀있다. 그렇다면 진짜 범인은...'"
    local result2="...양도일씨."

    local function catch(event)
        click=click+1

        if click==1 then 
            detective.fill.effect.intensity =0
            detectiveChatting.alpha=1
            showTalk.text = talk[1]  
        end

        if click==2 then 
            detective.fill.effect.intensity =-0.2
            detectiveChatting.alpha=0
            wife.alpha=1
            wife.fill.effect.intensity=0
            wifeChatting.alpha=1
            showTalk.text = talk[2]   
        end

        if click==3 then 
            detective.fill.effect.intensity =0
            detectiveChatting.alpha=1
            wife.alpha=1
            wife.fill.effect.intensity=-0.2
            wifeChatting.alpha=0
            showTalk.text = talk[3]     
        end

        if click==4 then 
            wifeChatting.alpha=1
            detective.fill.effect.intensity = -0.2
            detectiveChatting.alpha=0
            wife.alpha=1
            wife.fill.effect.intensity=0
            showTalk.text = talk[4] 
        end

        if click==5 then 
        	--audio.play( soundEffect1 )
        	hacChatting.alpha=1
        	transition.to( vic, { time=1000, alpha=1 } )        
            detective.alpha =0
            wife.alpha=0
            wifeChatting.alpha=0
            detectiveChatting.alpha=0
            showTalk.text = talk[5]
        end
           
        if click==6 then
        	vic.alpha=0
        	detective.alpha =1   
            detective.fill.effect.intensity =0
            detectiveChatting.alpha=1
            wife.alpha=1
            wife.fill.effect.intensity=-0.2
            wifeChatting.alpha=0
            hacChatting.alpha=0
            showTalk.text = talk[6]  
        end
 
        if click==7 then 
        	vic.alpha=0      
        	detective.alpha =1  
            detective.fill.effect.intensity =0
            detectiveChatting.alpha=1
            wife.alpha=1
            wife.fill.effect.intensity=-0.2
            wifeChatting.alpha=0
            hacChatting.alpha=0
            showTalk.text = talk[7] 
        end

        if click==8 then   
        	vic.alpha=0
        	detective.alpha =1
            detective.fill.effect.intensity =0
            detectiveChatting.alpha=1
            wife.alpha=1
            wife.fill.effect.intensity=-0.2
            wifeChatting.alpha=0
            hacChatting.alpha=0
            showTalk.text = talk[8] 
        end

        if click==9 then 
        	vic.alpha=0   
        	detective.alpha =1     
            detective.fill.effect.intensity =0
            detectiveChatting.alpha=1
            wife.alpha=1
            wife.fill.effect.intensity=-0.2
            wifeChatting.alpha=0
            hacChatting.alpha=0
            showTalk.text = talk[9] 
        end

        if click==10 then 
        	vic.alpha=0     
        	detective.alpha =1   
            detective.fill.effect.intensity =-0.2
            detectiveChatting.alpha=0
            wife.alpha=1
            wife.fill.effect.intensity=0
            wifeChatting.alpha=1
            hacChatting.alpha=0
            showTalk.text = talk[10] 
        end

        if click==11 then 
        	vic.alpha=0   
        	detective.alpha =1     
            detective.fill.effect.intensity =0
            detectiveChatting.alpha=1
            wife.alpha=1
            wife.fill.effect.intensity=-0.2
            wifeChatting.alpha=0
            hacChatting.alpha=0
            showTalk.text = talk[11] 
        end

        if click == 12 then
        	vic.alpha=0
        	detective.alpha =1
        	hacChatting.alpha=0
            wifeChatting.alpha=0
            detectiveChatting.alpha=0

            showSelection1 = display.newText(selection1, display.contentWidth*0.5, display.contentHeight*0.275, "fonts/nanumgothic" )
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

        if click>=12 then
        	detective.alpha =1
        	vic.alpha=0
        	hacChatting.alpha=0
            wife.fill.effect.intensity =0
            detective.fill.effect.intensity =0
            wifeChatting.alpha=0
            detectiveChatting.alpha=1
        end
    end

    Iroom:addEventListener("tap",catch) 

    local function select1(event)
        display.remove(showSelection1)
        display.remove(showSelection2)
        detectiveChatting.alpha=0
        wifeChatting.alpha=0
        hacChatting.alpha=0
        vic.alpha=0
        showTalk.alpha=0

        first.alpha=0
        second.alpha=0

       composer.setVariable("complete", true)
        local options={
          effect="fade",
          time=400
        }
        composer.gotoScene("view18_5",options)
    end

    S1:addEventListener("tap",select1) 

    local function select2(event)
        if click>=13 then
        display.remove(showSelection2)
        showSelection1.alpha=0
        detectiveChatting.alpha=1
        wifeChatting.alpha=0
        hacChatting.alpha=0
        vic.alpha=0
        showTalk.alpha=0

        first.alpha=0
        second.alpha=0

        showResult1 = display.newText(result1, display.contentWidth*0.5, display.contentHeight*0.8, "fonts/nanumgothic")
        showResult1:setFillColor(0)
        showResult1.size = 20
        sceneGroup:insert(showResult1)
        end

      local function select3(event)       
        if click>=14 then
        detectiveChatting.alpha=1
        showTalk.alpha=0
        showResult1.alpha=0

        first.alpha=0
        second.alpha=0

        showResult = display.newText(result2, display.contentWidth*0.5, display.contentHeight*0.8, "fonts/nanumgothic")
        showResult:setFillColor(0)
        showResult.size = 20
        sceneGroup:insert(showResult)
        end    

        if click>=15 then
        showSelection1.alpha=1
        first.alpha=1
        end

        if click>=16 then
        detectiveChatting.alpha=0
        showTalk.alpha=0
       composer.setVariable("complete", true)
        local options={
          effect="fade",
          time=400
        }
        composer.gotoScene("view18_5",options)
        end
        
       end

      Iroom:addEventListener("tap",select3)
    end

    local function next(event)
          composer.setVariable("complete", true)
         local options={
          effect="fade",
          time=500
           }
         composer.gotoScene("view18_5",options)
      end
       skip:addEventListener("tap",next)
    
    S2:addEventListener("tap",select2) 


end
