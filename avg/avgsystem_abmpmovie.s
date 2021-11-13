






@@@!Script\Dialog\main.s
@@@!AvgSystem_Custom.s


@@!Avg_ABMPMovieCreate

\ret

@@!Avg_ABMPMovieFree

\ret












@@!Avg_ABMPMovieExcute
	
	\if,Avg_SceneSkipFlag>0\then
		\ret
	\end
	
	
	\draw
	
	\var,int,r
	\var,int,x,y,v,fw
	\var,str,f
	\gvar,int,Avg_ABMPMovieClickLock,Avg_ABMPMovieForceWait,Avg_ABMPMovieFadeTime,Avg_ABMPMovieWaitTime,Avg_ABMPMovieSoundCh
	\gvar,str,Avg_ABMPMovieFadeFile,Avg_ABMPMovieSound
	
	
	\rep,ParamStr[0],"/","\"
	\rep,ResultStr[0],".b",""
	\sub,@@!Avg_ABMPMovieOnLoadFile,,ResultStr[0]+".b"
	\cal,f=ResultStr[0]
	
	\if,ParamStr[1]!=""\then
		
		
			
			
			
		
			\rep,ParamStr[1],"/","\"
			\rep,ResultStr[0],".ogg",""
			\sub,@@!Avg_ABMPMovieOnLoadFile,,ResultStr[0]+".ogg"
			\cal,Avg_ABMPMovieSound=ResultStr[0]
			\cal,Avg_ABMPMovieSoundCh=12
		
	\end
	
	
	\cal,x=ParamInt[2],y=ParamInt[3]
	
	\if,ParamStr[4]==""\then
		\cal,v=256
	\else
		\cal,v=ParamInt[4]*256/100
	\end
	
	
	\cal,Avg_ABMPMovieWaitTime=ParamInt[5]
	
	
	\if,ParamStr[6]==""\then
		\cal,Avg_ABMPMovieClickLock=0
	\else
		\cal,Avg_ABMPMovieClickLock=ParamInt[6]
	\end
	
	\if,ParamStr[7]==""\then
		\cal,Avg_ABMPMovieForceWait=2000
	\else
		\cal,Avg_ABMPMovieForceWait=ParamInt[7]
	\end
	
	\if,ParamStr[8]==""\then
		\cal,Avg_ABMPMovieFadeTime=0
	\else
		\cal,Avg_ABMPMovieFadeTime=ParamInt[8]
	\end
	
	\rep,ParamStr[9],"/","\"
	\cal,Avg_ABMPMovieFadeFile=ResultStr[0]
	\if,Avg_ABMPMovieFadeFile!=""\then
		\fexs,Avg_ABMPMovieFadeFile
		\if,ResultInt[0]==0\then
			\derr,"ムービー：ファイルが見つかりません:"+Avg_ABMPMovieFadeFile
		\end
	\end
	
	
	\scp,flog	\?g,f
	\if,ResultInt[0]>0\then
		\cal,Avg_ABMPMovieClickLock=0
	\end
	\scp,flog	\s,f,100
	
	
	\scp,sys	\?skp
	\if,ResultInt[0]==1\then
		\if,(Avg_ABMPMovieClickLock==0)&&(Avg_ABMPMovieForceWait==0)\then
			\scp,eff	\i
			\del,Avg_ABMPMovieClickLock,Avg_ABMPMovieForceWait,Avg_ABMPMovieFadeTime,Avg_ABMPMovieFadeFile,Avg_ABMPMovieWaitTime,Avg_ABMPMovieSound,Avg_ABMPMovieSoundCh
			\ret
		\end
	\end
	
	
	\sub,@@!Avg_OnMovieBegin
	
	
	\scp,eff	\c
	\sub,@@!Avg_ABMPMovieExcutePlay,,f,x,y,v
	
	
	\sub,@@!Avg_OnMovieEnd
	
	\del,Avg_ABMPMovieClickLock,Avg_ABMPMovieForceWait,Avg_ABMPMovieFadeTime,Avg_ABMPMovieFadeFile,Avg_ABMPMovieWaitTime,Avg_ABMPMovieSound,Avg_ABMPMovieSoundCh
\ret


@@!Avg_ABMPMovieExcutePlay
	
	\gvar,img,AVG_ABMPMovie
	\var,int,fpri,wt
	\scp,AVG_ABMPMovie
		\i
		\l,ParamStr[0]
		\vtn,4				
		\v,ParamInt[3]		
		\p,ParamInt[1],ParamInt[2],500		
		\tf,0
		\d
	
	\if,(Avg_ABMPMovieWaitTime==-1)\then
		\scp,AVG_ABMPMovie
			\sc,Avg_ABMPMovieSoundCh
			\ost,1,0,0
	\end
	
	\if,Avg_ABMPMovieSound==""\then
		\if,Avg_ABMPMovieWaitTime<1\then
			\scp,AVG_ABMPMovie	\?tt
			\cal,Avg_ABMPMovieWaitTime=ResultInt[0]
		\end
	\end
	
	\if,Avg_ABMPMovieSound!=""\then
		\scp,snd[Avg_ABMPMovieSoundCh]
			\i
			\l,Avg_ABMPMovieSound
			\vtn,4
			\v,ParamInt[3]
			\p
	\end
	
	
	\zero
	\if,Avg_ABMPMovieSound!=""\then
		\var,int,i
		\for,i=0,i<60,i++
			\scp,snd[Avg_ABMPMovieSoundCh]	\?nt
			\if,ResultInt[0]>1\then
				\brk
			\end
			\draw,1
		\end
	\end
	\scp,AVG_ABMPMovie	\e
	
	
	\if,Avg_ABMPMovieFadeTime>0\then
		\scp,eff	\?c
		\cal,fpri=ResultInt[1]
		\scp,eff	\fdi,0,Avg_ABMPMovieFadeTime,Avg_ABMPMovieFadeFile,fpri
		\zero
		\wait,Avg_ABMPMovieForceWait	
	\else
		\scp,eff	\i
		\wait,Avg_ABMPMovieForceWait	
	\end
	
	
	\if,Avg_ABMPMovieWaitTime>0\then
		\cal,Avg_ABMPMovieWaitTime=Avg_ABMPMovieWaitTime-Avg_ABMPMovieForceWait
		\if,Avg_ABMPMovieWaitTime<0\then
			\cal,Avg_ABMPMovieWaitTime=1
		\end
		\stop,@@!Avg_ABMPMovieOnStopWaitTimeEvent,Avg_ABMPMovieWaitTime,0
	\else
		\stop,@@!Avg_ABMPMovieOnStopEvent
	\end
	
	
	\if,ResultStopInt>0\then
		
	\end
	
	
	\del,AVG_ABMPMovie
	\if,Avg_ABMPMovieSound!=""\then		
		\scp,snd[Avg_ABMPMovieSoundCh]	\i
	\end
\ret


@@!Avg_ABMPMovieOnStopEvent
	
	\scp,inp	\sc
	\if,ResultInt[0]==1\then
		\if,Avg_ABMPMovieClickLock==0\then
			\play	\ret
		\end
	\end
	
	\scp,snd[Avg_ABMPMovieSoundCh]	\?p
	\if,ResultInt[0]==0\then
		\play	\ret
	\end
\ret

@@!Avg_ABMPMovieOnStopWaitTimeEvent
	
	\scp,inp	\sc
	\if,ResultInt[0]==1\then
		\if,Avg_ABMPMovieClickLock==0\then
			\play	\ret
		\end
	\end
\ret


@@!Avg_ABMPMovieSerchCh
	\var,str,n
	
	\rep,ParamStr[0],"@",""
	\cal,n=ResultStr[0]
	
	\scp,Imo_MusicNames	\?v,n
	\if,ResultStr[0]!=""\then
		\cal,ResultInt[0]=Imo_MusicCurrent[ResultInt[0]]
	\else
		\derr,"ムービー：オブジェクトが見つかりません："+n
	\end
\ret


@@!Avg_ABMPMovieOnLoadFile
	\var,str,f
	
	\cal,f=ParamStr[0]
	\fexs,f
	\if,ResultInt[0]==1\then
		\cal,ResultStr[0]=f
		\ret
	\end
	
	\cal,f="movie\"+ParamStr[0]
	\fexs,f
	\if,ResultInt[0]==1\then
		\cal,ResultStr[0]=f
		\ret
	\end
	
	
	\sub,@@!Avg_Error,,"ムービー：ファイルが見つかりません："+ParamStr[0]
\ret
