local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local Proom = display.newImageRect("image/Proom.png",1280,720)
   Proom.x,Proom.y=display.contentWidth*0.5, display.contentHeight*0.5
   sceneGroup:insert(Proom)

   local soundEffect1 = audio.loadSound( "sound/view7_1.mp3" )
   audio.play( soundEffect1 )

   local soundEffect2 = audio.loadSound("sound/view7_2.mp3")

   local soundEffect3 = audio.loadSound("sound/view7_3.mp3")

   local a = display.newImageRect("image/양신일2.png",1280,720) 
   a.x, a.y = display.contentWidth*0.5, display.contentHeight*0.5
   sceneGroup:insert(a)
   a.fill.effect = "filter.brightness"
   a.fill.effect.intensity = 0
   a.alpha=0
            
   local b = display.newImageRect("image/A.png",500,600) 
   b.x, b.y = display.contentWidth*0.8, display.contentHeight*0.55
   sceneGroup:insert(b)
   b.fill.effect = "filter.brightness"
   b.fill.effect.intensity = 0
   b.alpha=0

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

   local bChatting = display.newImageRect("image/양도일Text.png",1280,720) 
   bChatting.x, bChatting.y = display.contentWidth*0.5, display.contentHeight*0.5
   bChatting.alpha=0
   sceneGroup:insert(bChatting)

   local aChatting = display.newImageRect("image/양신일Text.png",1280,720) 
   aChatting.x, aChatting.y = display.contentWidth*0.5, display.contentHeight*0.5
   aChatting.alpha=0
   sceneGroup:insert(aChatting)

   local scrChatting = display.newImageRect("image/Chatting.png",1280,720) 
   scrChatting.x, scrChatting.y = display.contentWidth*0.5, display.contentHeight*0.5
   scrChatting.alpha=0
   sceneGroup:insert(scrChatting)


   local talk = { }
   local talkGroup = display.newGroup()
   local showTalk

   talk[1]="야 이 개X끼야!!! 내가 이 계약을 어떻게 여기까지 끌고왔는데 감히 마지막에 니가 망쳐??\n이 X신새끼가!!! 내가 여기 들인 돈이 얼만데!!!! 감히 니가!!!"
   talk[2]="미안해... 미안해... 하지만 문제점이 보이는데... 지나칠 수가 없었어...\n그래도 그것만 보완하면 계속 진행한다고 했어... 미안해... 때리지마..."
   talk[3]="지금 그게 문제야?? 거기서 그딴식으로 하면 대놓고 나 엿먹으라는거 아니야??...\n너 이새끼 저번부터 내가 진행하는 건마다 지적하는거 수상했어. 이제 알겠네."
   talk[4]="아스퍼거 어쩌구 등X인척 하더니만 나이먹고 너도 돈 욕심이라는게 생기나보지? \n니 지분도 내가 가져갔다고 이제와서 지X하는거냐? 설마 나 제끼고 회사 먹고싶어?!"
   talk[5]="그런거 아니야... 그런식으로 말하지마..."
   talk[6]="닥쳐!! X신새끼 주제에 감히 니가 날 가르치려들어? 감히 내자리를 탐내? "
   talk[7]="회장님, 장애아동 후원행사 가실 시간입니다. 준비는 다 되셨습니까?"
   talk[8]="… 지금 나간다. 아, 그리고 내 동생 오랜만에 회사에 온거 알지? \n원래 행사에 같이 가려했는데 혼자 있고 싶다 하더라고. \n괜히 돌아다니가 사고날까 걱정되니까 회장실 밖으로 못나가게 해줘."
   talk[9]="네, 알겠습니다. 차 대기시키겠습니다."
   talk[10]="들었냐? 너 잘걸렸다 딱기다려. \n오늘 행사갔다와서 너 정신교육 제대로 시켜줄테니까."
   talk[11]="나도... 참을만큼 참았어... 더 이상 이렇게 살고싶지 않아... \n나도 사람답게 살고싶어.. 내 고통 그대로 느끼게 해줄게.. 양신일.."

   local click=0

   local function catch(event)
       click=click+1

       if click==1 then   
          a.alpha=1
          aChatting.alpha=1
          showTalk = display.newText(talk[1], display.contentWidth*0.5, display.contentHeight*0.8, "fonts/nanumgothic")
          showTalk:setFillColor(0)
          showTalk.size = 20
          sceneGroup:insert(showTalk)
        end

        if click==2 then
           audio.play( soundEffect2 )
           aChatting.alpha=0
           b.alpha=1
           bChatting.alpha=0
           showTalk.alpha=0
           a.fill.effect.intensity = -0.2
        end

        if click==3 then
           aChatting.alpha=0
           b.alpha=1
           bChatting.alpha=1
           showTalk.alpha=1
           a.fill.effect.intensity = -0.2
           showTalk.text=talk[2]
        end

        if click==4 or click==5 then
           a.fill.effect.intensity = 0
           b.fill.effect.intensity = -0.2
           aChatting.alpha=1
           bChatting.alpha=0
           showTalk.text=talk[3]
        end

        if click==5 then
           a.fill.effect.intensity = 0
           b.fill.effect.intensity = -0.2
           aChatting.alpha=1
           bChatting.alpha=0
           showTalk.text=talk[4]
        end

        if click==6 then          
            a.fill.effect.intensity =-0.2
            b.fill.effect.intensity =0
            aChatting.alpha=0
            bChatting.alpha=1
            showTalk.text = talk[5]
        end

        if click==7 then
           audio.play( soundEffect1 )
           a.fill.effect.intensity = 0
           b.fill.effect.intensity = -0.2
           aChatting.alpha=1
           bChatting.alpha=0
           showTalk.text = talk[6]
        end

      local second = 20
        if click==8 then
           audio.pause( soundEffect1 )
            local function timeAttack( event )
                second = second -1
                if second == 19 then 
                    audio.play( soundEffect3 )
                    aChatting.alpha=0
                    bChatting.alpha=0
                    scrChatting.alpha=0
                    a.fill.effect.intensity = -0.2
                    b.fill.effect.intensity = -0.2
                    showTalk.text=""
        end

         if second==18 then
                    aChatting.alpha=0
                    bChatting.alpha=0
                    scrChatting.alpha=1
                    a.fill.effect.intensity = -0.2
                    b.fill.effect.intensity = -0.2
                    showTalk.text=talk[7]
                end
            end
            timer.performWithDelay( 1000, timeAttack, 0 ) 
        end

        if click==9 then
           a.fill.effect.intensity = 0
           b.fill.effect.intensity = -0.2
           aChatting.alpha=1
           bChatting.alpha=0
           scrChatting.alpha=0
           showTalk.text=talk[8]
        end

        if click==10 then
           a.fill.effect.intensity = -0.2
           b.fill.effect.intensity = -0.2
           aChatting.alpha=0
           bChatting.alpha=0
           scrChatting.alpha=1
           showTalk.text = talk[9]
        end

        if click==11 then
           a.fill.effect.intensity = 0
           b.fill.effect.intensity = -0.2
           aChatting.alpha=1
           bChatting.alpha=0
           scrChatting.alpha=0
           showTalk.text=talk[10]
        end

        if click==12 then
            a.fill.effect.intensity =0
            b.fill.effect.intensity =-0.2
            aChatting.alpha=0
            a.alpha=0
            bChatting.alpha=1
            a.fill.effect.intensity = -0.2
           showTalk.text=talk[11]
        end



        if click==13 then
           composer.setVariable("complete", true)
            local options={
                effect="fade",
                time=500
            }
            composer.gotoScene("view8",options)
        end
   



    end


    local function next(event)
          composer.setVariable("complete", true)
         local options={
          effect="fade",
          time=500
           }
         composer.gotoScene("view8",options)
      end
       skip:addEventListener("tap",next)


    Proom:addEventListener("tap",catch)



end
