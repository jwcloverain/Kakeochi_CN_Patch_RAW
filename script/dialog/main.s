
@@@!Layout_YesNo.s
@@@!Layout_Message.s





@@!DialogShowAnswer
	\sub,@@!DialogKeepMessageEnable,,ParamStr[0],1
	\stop,@@!Dialog_YesNoOnStop
	
	
	
	\case,ResultBtnStr[0]
		\of,"no"	\scp,DialogButton[1]	\ck,1
		\of,"yes"	\scp,DialogButton[0]	\ck,1
	\end
	\if,ResultBtnStr[0]=="no"\then
		\sub,@@!DialogPlayCancelSound
	\end
	\sub,@@!DialogKeepMessageDisable,,ParamStr[0],1
	
	\case,ResultBtnStr[0]
		\of,"","no"	\cal,ResultInt[0]=0
		\of,"yes"		\cal,ResultInt[0]=1
	\end
\ret



@@!DialogShowMessage
	\var,int,t
	\cal,t=ParamInt[1]
	\if,t<100\then
		\cal,t=3000
	\end
	\sub,@@!DialogKeepMessageEnable,,ParamStr[0],0
	\clk,t
	\sub,@@!DialogKeepMessageDisable,,ParamStr[0],0
	\del,t
\ret


@@!DialogKeepMessageEnable
	
	\gvar,int,_Dialog_InputMask
	\scp,sys	\?in
	\cal,_Dialog_InputMask=ResultInt[0]
	\scp,sys	\in,$10000
	
	\if,ParamInt[1]==0\then
		\sub,@@!Layout_Message_Create
	\else
		\sub,@@!Layout_YesNo_Create
	\end
	\sub,@@!Dialog_MakeText,,ParamStr[0]
	\sub,@@!DialogWindowShow
\ret

@@!DialogKeepMessageDisable
	
	\sub,@@!DialogWindowHide
	\if,ParamInt[1]==0\then
		\sub,@@!Layout_Message_Free
	\else
		\sub,@@!Layout_YesNo_Free
	\end
	
	\scp,sys	\in,_Dialog_InputMask
	\del,_Dialog_InputMask
	
	\cal,ResultInt[0]=1
	
	\draw
\ret

@@!Dialog_MakeText
	\fmt,"[pc,%s]",ParamStr[0]
	\scp,DialogMessage
		\kwl,0
		\cc
		\o,ResultStr[0]
		\mc
		\e
\ret

@@!DialogPlayCancelSound

\ret

@@!DialogWindowShow
	\scp,DialogBack,DialogMessage,DialogCursor,DialogButton[0],DialogButton[1]
		\in,$10000
	\zero
	\if,#SysEffectSpeed>0\then
		\clk,250
	\else
		\skip,250
	\end
\ret

@@!DialogWindowHide
	\scp,DialogBack		\d
	\scp,DialogMessage	\d
	\scp,DialogCursor	\d
	\scp,DialogButton[0],DialogButton[1]	\d

	\if,#SysEffectSpeed>0\then
		\clk,250
	\else
		\skip,250
	\end
\ret


@@!Dialog_YesNoOnStop
	
	\scp,inp	\gbc
	\if,ResultObj[0]!=null \then
		\cal,ResultBtnStr[0]=ResultStr[0],ResultBtnStr[1]="btn"
		\play	\ret
	\end
	
	\scp,inp	\k2,$10002,$1001B
	\case,ResultInt[0]
		\of,$10002		
			\cal,ResultBtnStr[0]="no",ResultBtnStr[1]="key"
			\play	\ret
		\of,$1001B		
			\cal,ResultBtnStr[0]="no",ResultBtnStr[1]="key"
			\play	\ret
		\of,
	\end

\ret

