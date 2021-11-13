




@@@!Script\Dialog\main.s
@@@!Misc\Misc.s


@@Top
@@!Top
@@!Main
	\sub,@@!CreateInterface
	\sub,@@!SceneSkip
	\sub,@@!FreeInterface
\thrd,0


@@!SceneSkip
	\sub,@@!SceneSkipCheck
	\if,ResultInt[0]==0\then
		\sub,@@!DialogShowMessage,,"当前事件无法快进。"
		\ret
	\end
	\sub,@@!DialogShowAnswer,,"快进当前事件吗？"
	\if,ResultInt[0]==0\then
		\ret
	\end
	
	
	\tsub,@@!avg_SceneSkipOn
\ret


@@!SceneSkipCheck
	\var,int,a
	\srct,1	
		\scp,sys	\?lkc	\cal,a=ResultInt[0] & 2
	\srct,0
	\cal,ResultInt[0] = a==0
\ret


@@!CreateInterface
	
	\scp,skey
		\i
		\a,$10001,"click"
		\a,$0000D,"click"
		\a,$00011,"KeyClick"
		\a,$00025,"SelectTabPrev"		
		\a,$00026,"SelectTab100Prev"	
		\a,$00027,"SelectTabNext"		
		\a,$00028,"SelectTab100Next"	
	
	\gvar,img,GameImage
	\scp,GameImage
		\i
		\l,"$$$GameThreadImageZ,65535.bmp"	
		\p,0,0,-10
		\fo,0,"blur,4,4"
		\e
	\scp,eff	\i
\ret

@@!FreeInterface
	\del,GameImage
\ret
