
cl = {1,1,1,1,1,1,0}
mover = {0,0,0,900,80}
nextaudio = 1
cost1 = 0
cost2 = 0
time1 = 0
time2 = 0

function balancing_updating()
	
end

function selectlist(screen,race,mn,mx)

end

function move_x_up()
		Volume_Delete("position")
	mover[1] = mover[1]+mover[5]
		Volume_AddSphere("position",{mover[1],mover[2],mover[3],},1)
		Camera_FocusVolumeWithBuffer ("position", 10, 100000, 0)
		Camera_FocusSobGroupWithBuffer ("camera", mover[4], 100000, 0)	
		Subtitle_Message("[X "..mover[1].."] [Z "..mover[2].."] [Y "..mover[3].."] [Zoom "..mover[4].."] [Tune "..mover[5].."]", 10)		
end

function move_x_down()
		Volume_Delete("position")		
		mover[1] = mover[1]-mover[5]
		Volume_AddSphere("position",{mover[1],mover[2],mover[3],},1)
		Camera_FocusVolumeWithBuffer ("position", 10, 100000, 0)
		Camera_FocusSobGroupWithBuffer ("camera", mover[4], 100000, 0)	
		Subtitle_Message("[X "..mover[1].."] [Z "..mover[2].."] [Y "..mover[3].."] [Zoom "..mover[4].."] [Tune "..mover[5].."]", 10)
end

function move_z_up()
		Volume_Delete("position")
	mover[2] = mover[2]-mover[5]
		Volume_AddSphere("position",{mover[1],mover[2],mover[3],},1)
		Camera_FocusVolumeWithBuffer ("position", 10, 100000, 0)
		Camera_FocusSobGroupWithBuffer ("camera", mover[4], 100000, 0)	
		Subtitle_Message("[X "..mover[1].."] [Z "..mover[2].."] [Y "..mover[3].."] [Zoom "..mover[4].."] [Tune "..mover[5].."]", 10)
end

function move_z_down()
		Volume_Delete("position")
		mover[2] = mover[2]+mover[5]
		Volume_AddSphere("position",{mover[1],mover[2],mover[3],},1)
		Camera_FocusVolumeWithBuffer ("position", 10, 100000, 0)
		Camera_FocusSobGroupWithBuffer ("camera", mover[4], 100000, 0)	
		Subtitle_Message("[X "..mover[1].."] [Z "..mover[2].."] [Y "..mover[3].."] [Zoom "..mover[4].."] [Tune "..mover[5].."]", 10)
end

function move_y_up()		
		Volume_Delete("position")
		mover[3] = mover[3]-mover[5]
		Volume_AddSphere("position",{mover[1],mover[2],mover[3],},1)
		Camera_FocusVolumeWithBuffer ("position", 10, 100000, 0)
		Camera_FocusSobGroupWithBuffer ("camera", mover[4], 100000, 0)			
		Subtitle_Message("[X "..mover[1].."] [Z "..mover[2].."] [Y "..mover[3].."] [Zoom "..mover[4].."] [Tune "..mover[5].."]", 10)
end

function move_y_down()
		Volume_Delete("position")
	mover[3] = mover[3]+mover[5]
		Volume_AddSphere("position",{mover[1],mover[2],mover[3],},1)
		Camera_FocusVolumeWithBuffer ("position", 10, 100000, 0)
		Camera_FocusSobGroupWithBuffer ("camera", mover[4], 100000, 0)	
		Subtitle_Message("[X "..mover[1].."] [Z "..mover[2].."] [Y "..mover[3].."] [Zoom "..mover[4].."] [Tune "..mover[5].."]", 10)
end

function zoom_up()			
		mover[4] = mover[4]+mover[5]
		Camera_FocusVolumeWithBuffer ("position", 10, 100000, 0)
		Camera_FocusSobGroupWithBuffer ("camera", mover[4], 100000, 0)			
		Subtitle_Message("[X "..mover[1].."] [Z "..mover[2].."] [Y "..mover[3].."] [Zoom "..mover[4].."] [Tune "..mover[5].."]", 10)
end

function zoom_down()		
	if mover[4]-mover[5] <= 200 then
				mover[4] = 200
		else
		mover[4] = mover[4]-mover[5]		
		end			
		Camera_FocusVolumeWithBuffer ("position", 10, 100000, 0)
		Camera_FocusSobGroupWithBuffer ("camera", mover[4], 100000, 0)			
		Subtitle_Message("[X "..mover[1].."] [Z "..mover[2].."] [Y "..mover[3].."] [Zoom "..mover[4].."] [Tune "..mover[5].."]", 10)
end

function tuning()				
	if mover[5] >= 320 then
				mover[5] = 5
		end
		mover[5] = mover[5]*2		
		Subtitle_Message("[X "..mover[1].."] [Z "..mover[2].."] [Y "..mover[3].."] [Zoom "..mover[4].."] [Tune "..mover[5].."]", 10)
end

function reset()		
		mover[1] = 0
		mover[2] = 0
		mover[3] = 0
		mover[4] = 900
		mover[5] = 80
		Camera_FocusVolumeWithBuffer ("position", 10, 100000, 0)
		Camera_FocusSobGroupWithBuffer ("camera", mover[4], 100000, 0)
		Subtitle_Message("[X "..mover[1].."] [Z "..mover[2].."] [Y "..mover[3].."] [Zoom "..mover[4].."] [Tune "..mover[5].."]", 10)
end

function cinema()		
		UI_BindKeyEvent(ESCKEY, "cinema_stop")
		Event_Start("startcinematic")
		Rule_AddInterval("cinema_execute",1)
end

function cinema_execute()
		Volume_Delete("cinema")
		Volume_AddSphere("cinema",{random(-2500,2500),random(-500,500),random(-5000,5000),},1)
		Camera_FocusVolumeKeepingEyePosition("cinema")
		SobGroup_Create("cinema")
		SobGroup_SobGroupAdd("cinema", "squadplayer")
		SobGroup_SobGroupAdd("cinema", "squadenemy")
		SobGroup_SplitGroupFromGroup("cinema", "cinema", SobGroup_Count("cinema"), "Special_Splitter")
		r = random(0,SobGroup_Count("cinema")-1)		
		Camera_FocusSobGroupWithBuffer ("cinema"..r, random(500,750), 0, random(4,6))		
		Rule_Remove("cinema_execute")
		local r = random(4,6)
		Rule_AddInterval("fadedown",r-0.975)	
		Rule_AddInterval("cinema_execute",r)		
end

function cinema_stop()
		UI_UnBindKeyEvent(ESCKEY)
		Event_Start("stopcinematic")
		Rule_Remove("cinema_execute")				
end

