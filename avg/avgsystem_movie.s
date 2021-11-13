






@@@!Script\Dialog\main.s
@@@!AvgSystem_Custom.s


@@!Avg_MovieCreate

\ret

@@!Avg_MovieFree

\ret















@@!Avg_MovieExcute
	
	\if,Avg_SceneSkipFlag>0\then
		\ret
	\end
	
	
	\draw
	
	\var,int,r
	\var,int,x,y,w,h,v,fw
	\var,str,f
	\gvar,int,Avg_MovieClickLock,Avg_MovieForceWait,Avg_MovieFadeTime
	\gvar,str,Avg_MovieFadeFile
	
	
	\rep,ParamStr[0],"/","\"
	\rep,ParamStr[0],".ogv",""
	\sub,@@!Avg_MovieOnLoadFile,,ResultStr[0]+".ogv"
	\cal,f=ResultStr[0]
	
	
	\cal,x=ParamInt[1],y=ParamInt[2]
	
	\cal,w=ParamInt[3],h=ParamInt[4]
	
	\if,ParamStr[5]==""\then
		\cal,v=256
	\else
		\cal,v=ParamInt[5]*256/100
	\end
	
	\if,ParamStr[6]==""\then
		\cal,Avg_MovieClickLock=0
	\else
		\cal,Avg_MovieClickLock=ParamInt[6]
	\end
	
	\if,ParamStr[7]==""\then
		\cal,Avg_MovieForceWait=2000
	\else
		\cal,Avg_MovieForceWait=ParamInt[7]
	\end
	
	\if,ParamStr[8]==""\then
		\cal,Avg_MovieFadeTime=0
	\else
		\cal,Avg_MovieFadeTime=ParamInt[8]
	\end
	
	\rep,ParamStr[9],"/","\"
	\cal,Avg_MovieFadeFile=ResultStr[0]
	\if,Avg_MovieFadeFile!=""\then
		\fexs,Avg_MovieFadeFile
		\if,ResultInt[0]==0\then
			\derr,"ムービー：フェードファイルが見つかりません:"+Avg_MovieFadeFile
		\end
	\end
	
	
	\scp,flog	\?g,f
	\if,ResultInt[0]>0\then
		\cal,Avg_MovieClickLock=0
	\end
	\scp,flog	\s,f,100
	
	
	\scp,sys	\?skp
	\if,ResultInt[0]==1\then
		\if,(Avg_MovieClickLock==0)&&(Avg_MovieForceWait==0)\then
			\scp,eff	\i
			\del,Avg_MovieClickLock,Avg_MovieForceWait,Avg_MovieFadeTime,Avg_MovieFadeFile
			\ret
		\end
	\end
	
	
	\sub,@@!Avg_OnMovieBegin
	
	
	\scp,eff	\c
	\sub,@@!Avg_MovieExcutePlay,,f,x,y,w,h,v
	
	
	\sub,@@!Avg_OnMovieEnd
	
	\del,Avg_MovieClickLock,Avg_MovieForceWait,Avg_MovieFadeTime,Avg_MovieFadeFile
\ret


@@!Avg_MovieExcutePlay
	
	\gvar,theora,Avg_TheoraMovie
	\var,int,fpri
	\scp,Avg_TheoraMovie
		\i
		\l,ParamStr[0],1
		\vtn,4				
		\v,ParamInt[5]		
		\pp,ParamInt[1],ParamInt[2],500		
		\tf,0
	\if,(ParamInt[3]>0)&&(ParamInt[4]>0)\then
		\ss,ParamInt[3],ParamInt[4]
		\tf,2
	\end
		\e					
		\p					
	\zero
	
	
	\if,Avg_MovieFadeTime>0\then
		\scp,eff	\?c
		\cal,fpri=ResultInt[1]
		\wait,500					
		\scp,eff	\fdi,0,Avg_MovieFadeTime,Avg_MovieFadeFile,fpri
		\zero
		\wait,Avg_MovieForceWait	
	\else
		\scp,eff	\i
		\wait,Avg_MovieForceWait	
	\end

	\stop,@@!Avg_MovieOnStopEvent
	
	\del,Avg_TheoraMovie
\ret


@@!Avg_MovieOnStopEvent
	
	\scp,inp	\sc
	\if,ResultInt[0]==1\then
		\if,Avg_MovieClickLock==0\then
			\play	\ret
		\end
	\end
	
	\scp,Avg_TheoraMovie	\?p
	\if,ResultInt[0]==0\then
		\play	\ret
	\end
\ret


@@!Avg_MovieOnLoadFile
	\fexs,ParamStr[0]
	\if,ResultInt[0]==0\then
		
		\sub,@@!Avg_Error,,"ムービー：ファイルが見つかりません："+ParamStr[0]
	\end
	\cal,ResultStr[0]=ParamStr[0]
\ret

