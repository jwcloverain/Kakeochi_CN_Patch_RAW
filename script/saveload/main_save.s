




@@@!Script\Dialog\main.s
@@@!Misc\Misc.s
@@@!Common.s
@@@!Layout_Save.s



@@Top
@@!Top
@@!Main
	\sub,@@!InterfaceCreate
@@!Select
	\stop,@@!OnStopEvent
	\jmp,ResultBtnStr[0]


@@!Cancel
	\sub,@@!InterfaceFree,,1
	\thrd,0

@@!Reset
	\sub,@@!Misc_GetFormCloseCaption,,"要返回标题吗？","保存游戏后返回标题吗？"
	\sub,@@!DialogShowAnswer,,ResultStr[0]
	\if,ResultInt[0]==0\then
		\jmp,@@!Select
	\end
	\sub,@@!Misc_FormCloseSave	
	\scp,eff	\c
	\sub,@@!InterfaceFree
	\jmp,@@!Top,"Script\Sequence\OnReset.s"

@@!Quit
	\sub,@@!Misc_GetFormCloseCaption,,"结束游戏吗？","保存游戏后结束游戏吗？"
	\sub,@@!DialogShowAnswer,,ResultStr[0]
	\if,ResultInt[0]==0\then
		\jmp,@@!Select
	\end
	\sub,@@!Misc_FormCloseSave	
	\scp,eff	\c
	\sub,@@!InterfaceFree
	\jmp,@@!Top,"Script\Sequence\OnQuit.s"


@@!Wheel
	\jmp,@@!PageInc

@@!PageInc
	\var,int,a
	\cal,a=#SavePageIndex+ResultBtnInt[0]
	\if,a<0\then
		\cal,a=PageCount-1
	\end
	\if,a>PageCount-1\then
		\cal,a=0
	\end
	\cal,ResultBtnInt[0]=a
	\del,a
@@!Page
	\cal,#SavePageIndex=ResultBtnInt[0]
	\scp,eff	\c
	\sub,@@!PageSetup
	\scp,eff	\fdi,0,100
	\zero
	\clk,100
	\jmp,@@!Select


@@!Jump_Save
	\scp,eff	\c
	\sub,@@!InterfaceFree
	\go,@@!top,"Script\SaveLoad\Main_Save.s"

@@!Jump_Load
	\scp,eff	\c
	\sub,@@!InterfaceFree
	\go,@@!top,"Script\SaveLoad\Main_Load.s"

@@!Jump_Config
	\scp,eff	\c
	\sub,@@!InterfaceFree
	\go,@@!top,"Script\Config\Main.s"



@@!Delete
	\sub,@@!Common_Delete,,ResultBtnStr[1]
	\if,ResultInt[0]==0\then
		\jmp,@@!Select
	\end
	
	\sub,@@!PageSetup
	\jmp,@@!Select
	

@@!Data
	\sub,@@!Common_Save,,ResultBtnStr[1]
	\if,ResultInt[0]==0\then
		\jmp,@@!Select
	\end
	
	\cal,#LoadPageIndex=#SavePageIndex
	\sub,@@!PageSetup
	\clk,250
	\jmp,@@!Cancel
	


@@!QuickSave
	\sub,@@!DialogShowAnswer,,"要快速存档吗？"
	\if,ResultInt[0]==0\then
		\jmp,@@!Select
	\end
	\clk,250
	\sub,@@!Common_QuickSave,,1
	\jmp,@@!Cancel



@@!PageSetup
	\var,int,i
	
	\for,i=0,i<10,i++
		\scp,PageButton[i]
			\ck,#SavePageIndex==i	
			\exv,0,_new==i			
	\end
	
	\var,list,sl
	\var,int,a
	\var,str,s
	\if,#SavePageIndex<10\then
		
		\cal,a=#SavePageIndex*DispCount
		\sub,@@!Misc_MakeFormatList,,sl,"SaveData%d.svd",DispCount,a
		\for,i=0,i<DispCount,i++
			\fmt,"no.%d",a+i+1	\cal,s=ResultStr[0]
			\scp,sl		\?s,i
			\sub,@@!Common_SetupButton,,ResultStr[0],i,s
		\end
	\else
		
	\end
	\del,sl
\ret


@@!OnStopEvent
	
	\scp,inp	\gbc
	\if,ResultObj[0]!=null \then
		\cal,ResultBtnStr[0]=ResultStr[0],ResultBtnStr[1]=ResultStr[1],ResultBtnInt[0]=ResultInt[0]
		\play	\ret
	\end
	
	\scp,inp	\gsc
	\if,ResultObj[0]!=null \then
		\cal,ResultBtnStr[0]=ResultStr[0],ResultBtnStr[1]=ResultStr[1],ResultBtnInt[0]=ResultInt[0]
		\play	\ret
	\end
	
	\scp,inp	\k2,$10002,$1001B,$10008
	\if,ResultInt[0]!=0\then
		\cal,ResultBtnStr[0]="@@!Cancel"
		\play	\ret
	\end
	
	
	\scp,inp	\k2,$000F0,$000F1
	\cal,ResultInt[0]=ResultInt[0] & $FF
	\case,ResultInt[0] 
		\of,$0F1
			\cal,ResultBtnStr[0]="@@!wheel",ResultBtnInt[0]=-1
			\play	\ret
		\of,$0F0
			\cal,ResultBtnStr[0]="@@!wheel",ResultBtnInt[0]=1
			\play	\ret
	\end
	
	\scp,inp	\k2,$00021,$00022
	\cal,ResultInt[0]=ResultInt[0] & $FF
	\case,ResultInt[0]
		\of,$021		
			\cal,ResultBtnStr[0]="@@!wheel",ResultBtnInt[0]=1
			\play	\ret
		\of,$022,		
			\cal,ResultBtnStr[0]="@@!wheel",ResultBtnInt[0]=-1
			\play	\ret
	\end
\ret


@@!InterfaceCreate
	\svar,int,#SavePageIndex
	\svar,int,#LoadPageIndex
	
	\scp,skey
		\i
		\a,$10001,"click"
		\a,$0000D,"click"
		\a,$00025,"SelectTabPrev"		
		\a,$00026,"SelectTab100Prev"	
		\a,$00027,"SelectTabNext"		
		\a,$00028,"SelectTab100Next"	
		\a,$0200D,"screen"				
	\scp,sys	\lk,$FFFF-_lkScreen
	\scp,inp	\swe,0
	
	\gvar,img,GameImage
	\scp,GameImage
		\i
		\l,"$$$GameThreadImageZ,65535.bmp"	
		\p,0,0,-10
		\fo,0,"blur,4,4"
		\e
	
	\gvar,int,_new,_lock
	\gvar,str,_fmt
	\gvar,int,DispCount,PageCount
	\cal,DispCount=10
	\cal,PageCount=10
	\cal,_fmt="SaveData%d.svd"	
	\cal,_lock=0				
	
	\sub,@@!Common_NewFilename
	
	\bmat,#NewSaveFilename,"[0-9]+"
	\stid,ResultStr[0],-1
	\cal,_new=ResultInt[0]
	\if,_new>-1\then
		\cal,_new=_new/DispCount
	\end
	
	\scp,eff	\c
	\sub,@@!Layout_Create
	\sub,@@!PageSetup
	\sub,@@!JumpButtonSetup
	\sub,@@!SystemButtonSetup
	
	\scp,eff	\fdi,0,250,"misc\Fade_in.b",999
	\zero
	\if,#SysEffectSpeed==0\then
		\skip,250
	\else
		\clk,250
	\end
\ret

@@!InterfaceFree
	\if,ParamInt[0]==1\then
		\scp,eff	\c
		\sub,@@!Layout_Free
		\scp,eff	\fdi,0,200,"misc\Fade_out.b"
		\zero
		\if,#SysEffectSpeed==0\then
			\skip,200
		\else
			\clk,200
		\end
	\else
		\sub,@@!Layout_Free
	\end
	\del,_fmt,_new,_lock
	\del,DispCount,PageCount
	\del,GameImage
	\scp,skey	\i
\ret


@@!JumpButtonSetup
	\var,int,lk
	\srct,1
		\scp,sys	\?lk
		\cal,lk=resultint[0]
	\srct,0
	
	
	\if,(lk & _lkSave) > 0\then
		\scp,JumpButtonSave	\lk,1
	\else
		\scp,JumpButtonSave	\lk,0
	\end
	
	\if,(lk & _lkLoad) > 0\then
		\scp,JumpButtonLoad	\lk,1
	\else
		\scp,JumpButtonLoad	\lk,0
	\end
	
	\if,(lk & _lkConfig) > 0\then
		\scp,JumpButtonConfig	\lk,1
	\else
		\scp,JumpButtonConfig	\lk,0
	\end
	
	
	\scp,JumpButtonSave
		\lk,0
		\ck,1
\ret

@@!SystemButtonSetup
	\var,int,a
	\srct,1
		\vexs,SystemButtonResetLock
		\cal,a=resultint[0]
	\srct,0
	\if,a>0\then
		\scp,SystemButton[1]	\lk,1
		\scp,SystemButton[2]	\lk,1
	\end
\ret
