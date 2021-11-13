




@@@!ImoScripter_Base.s
@@@!misc\misc.s


@@!Imo_NameText_Create
	
	\gvar,table,Imo_NameTextParam[Imo_NameTextCount]
	\gvar,table,Imo_NameTextAbsParam[Imo_NameTextCount]
	\gvar,table,Imo_NameTextDefault
	\gvar,msg,Imo_NameText[Imo_NameTextCount]
	
	\gvar,table,Imo_NameTextTemplate
	\scp,Imo_NameTextTemplate	\l,"ImoScripter_Template_NameText.txt"	\sort
	\gvar,table,Imo_NameTextColorList
	\scp,Imo_NameTextColorList	\l,"ImoScripter_NameColorList.txt"	\sort
	
	\gvar,table,Imo_NameTextJump
	\scp,Imo_NameTextJump
		\v,"show"		,"@@!Imo_NameText_10Base"
		\v,"autoshow"	,""
		\v,"colormode"	,""
		\v,"output"		,""
		\v,"format"		,""
		\v,"trans"		,"@@!Imo_NameText_30Trans"
		\v,"x"			,"@@!Imo_NameText_20Position"
		\v,"y"			,"@@!Imo_NameText_20Position"
		\v,"z"			,"@@!Imo_NameText_20Position"
		\v,"pri"		,"@@!Imo_NameText_20Position"
		\v,"alignx"		,"@@!Imo_NameText_10Base"
		\v,"aligny"		,"@@!Imo_NameText_10Base"
		\v,"motion"		,"@@!Imo_NameText_12Motion"
		\v,"file"		,"@@!Imo_NameText_00File,@@!Imo_NameText_10Base,@@!Imo_NameText_11TextArea,@@!Imo_NameText_12Motion"
		\v,"rep0"		,"@@!Imo_NameText_00File"
		\v,"rep1"		,"@@!Imo_NameText_00File"
		\v,"rep2"		,"@@!Imo_NameText_00File"
		\v,"rep3"		,"@@!Imo_NameText_00File"
		\v,"textareaw"	,"@@!Imo_NameText_11TextArea"
		\v,"textareah"	,"@@!Imo_NameText_11TextArea"
		\v,"fontsizew"	,""
		\v,"fontsizeh"	,""
		\v,"fontcolor"	,""
		\v,"fontno"		,""
		\v,"text"		,""
	
	\sub,@@!Imo_NameText_DefaultParam
	\var,int,i,n
	\for,i=0,i<Imo_NameTextCount,i++
		
		\scp,Imo_NameText[i]
			\dc,0
			\vtn,_stSE
			\in,$8	
			\out,$8
			\o,"[f,0][s,24,24][c,$FFFFFFFF][pi,0,0][rs,10,10][rpi,0,0][rp,0,-8]"
			\cc
			\ap,1	
			\as,1	
			\kwe,0	
			\ns,0,0	
		
		\scp,Imo_NameTextParam[i]	\asn,Imo_NameTextDefault
		
		\scp,Imo_NameTextNames		\?n,i
		\scp,Imo_NameTextAbsParam[i]
			\v,"*objectname",ResultStr[0]
			\v,"*objectindex",i
	\end
	
	\sub,@@!Imo_NameText_Refresh
\ret


@@!Imo_NameText_Free
	\del,Imo_NameTextParam
	\del,Imo_NameTextAbsParam
	\del,Imo_NameTextDefault
	\del,Imo_NameTextTemplate
	\del,Imo_NameText
	\del,Imo_NameTextJump
	\del,Imo_NameTextColorList
\ret


@@!Imo_NameText_DefaultParam
	\scp,Imo_NameTextDefault
		\i
		\v,"file","none"
		\v,"rep0","pass"
		\v,"rep1","pass"
		\v,"rep2","pass"
		\v,"rep3","pass"
		\v,"textareaw","400"
		\v,"textareah","50"
		\v,"show","false"
		\v,"autoshow","true"
		\v,"output","text"
		\v,"format","%s"
		\v,"colormode","manual"
		\v,"x","0"
		\v,"y","0"
		\v,"z","0"
		\v,"pri","1100"
		\v,"alignx","left"
		\v,"aligny","top"
		\v,"motion","0"
		\v,"fontsizew","24"
		\v,"fontsizeh","24"
		\v,"fontcolor","$FFFFFF"
		\v,"fontno","0"
		
		
		
		\v,"text","none"
	\sub,@@!Imo_LoadDefaultFile,,Imo_ImageDefault,"Default_NameText.txt"
\ret


@@!Imo_NameText_File
	\scp,Imo_Setting	\?v,"PathNameText"	
	\sub,@@!Imo_FileSerch,,1,ParamStr[0],ResultStr[0],".png",".bmp",".jpg",".b",".ogv"
\ret


@@!Imo_NameText_Excute
	
	\if,Avg_SceneSkipFlag>0\then
		\ret
	\end
	
	\var,list,sl
	\var,int,n,i,no
	\var,obj,p,a
	\var,str,op,s1,s2
	
	
	\sub,@@!Imo_TemplateExcute,,ParamStr[0],Imo_NameTextTemplate
	
	\scp,sl	\ad,_DivItem,ResultStr[0]
	
	\scp,sl	\?s,0	\stid,ResultStr[0],0
	\cal,no=ResultInt[0]
	\cal,p=Imo_NameTextParam[no],a=Imo_NameTextAbsParam[no]
	
	\scp,sl	\?c
	\cal,n=ResultInt[0]
	\for,i=1,i<n,i++
		\scp,sl	\?s,i
		\div,_DivParam,ResultStr[0]
		\cal,op=ResultStr[0],s1=ResultStr[1]
		\scp,p	\v,op,s1
		
		\if,op=="clear"\then
			\scp,p	\comb,Imo_NameTextDefault
		\end
	\end
	
	
	
	\cal,Imo_SentenceFlag=1
\ret


@@!Imo_NameText_Refresh
	\var,int,i
	\for,i=0,i<Imo_NameTextCount,i++
		\sub,@@!Imo_NameText_Refresh_Before,,i
		\scp,Imo_NameTextParam[i]	\?c
		\if,ResultInt[0]>0\then
			\sub,@@!Imo_NameText_Refresh_Main,,i
		\end
		\sub,@@!Imo_NameText_Refresh_After,,i
	\end
\ret

@@!Imo_NameText_ParamClear
	\var,int,i
	\for,i=0,i<Imo_NameTextCount,i++
		\scp,Imo_NameTextParam[i]	\i
	\end
\ret

@@!Imo_NameText_Refresh_Before
	\var,str,s1
	\var,int,c,n
	\var,obj,a,p,o
	\cal,n=ParamInt[0]
	\cal,o=Imo_NameText[n],p=Imo_NameTextParam[n],a=Imo_NameTextAbsParam[n]
	
	
	\scp,p	\?v,"file"
	\if,ResultStr[0]!=""\then
		\scp,a	\v,"motion","0"
				\v,"rep0","pass"
				\v,"rep1","pass"
				\v,"rep2","pass"
				\v,"rep3","pass"
	\end
	
	
	\scp,a	\comb,p
	
	
	\scp,o	\cc
	
	
	\scp,a	\?v,"autoshow"
	\if,ResultStr[0]=="true"\then
		\if,Imo_FormatText!=""\then
			\scp,p	\?v,"show"
			\if,ResultStr[0]!="false"\then
				\scp,a	\?v,"show"
				\if,ResultStr[0]=="false"\then
					\scp,p	\v,"show","true"
					\scp,a	\v,"show","true"
					
				\end
			\end
		\end
	\end
	
	
	\scp,a	\?v,"show"
	\if,ResultStr[0]=="true"\then
		\var,str,tt
		\scp,p
			\?v,"text"	\cal,tt=ResultStr[0]
		\var,str,output,fmt
		\scp,a
			\?v,"output"	\cal,output=ResultStr[0]
			\?v,"format"	\cal,fmt=ResultStr[0]
			
		\if,tt==""\then
			
			\cal,tt=ResultStr[0]
			\if,Imo_FormatText[0]==""\then
				\cal,tt="none_empty"
			\else
				\sub,@@!Imo_FormatGetDispName,,1	
				\cal,tt=ResultStr[0]
				\if,tt==""\then
					\cal,tt="none_noname"
				\end
			\end
		\else
			\sub,@@!Misc_NameDivide,,tt,1	
			\cal,tt=ResultStr[1]
		\end
		
		
		\if,tt=="none"\then
			\cal,tt=""
		\end
		
		\scp,p	\v,"text",""
		\scp,a	\v,"text",""
		\if,tt!=""\then
			\if,output=="text"\then
				\if,tt=="none_noname" || tt=="none_empty"\then
					\cal,tt=""
				\end
			\end
			\if,fmt=="none"\then
				\cal,tt=""
			\else
				\if,tt!=""\then
					\fmt,fmt,tt	\cal,tt=ResultStr[0]
				\end
			\end
			\case,output
				\of,"text"		\scp,p	\v,"text",tt	\scp,a,\v,"text",tt
				\of,"motion"	\scp,p	\v,"motion",tt	\scp,a,\v,"motion",tt
				\of,"file"		\scp,p	\v,"file",tt	\scp,a	\v,"file",tt
				\of,"rep0"		\scp,p	\v,"rep0",tt	\scp,a	\v,"rep0",tt
				\of,"rep1"		\scp,p	\v,"rep1",tt	\scp,a	\v,"rep1",tt
				\of,"rep2"		\scp,p	\v,"rep2",tt	\scp,a	\v,"rep2",tt
				\of,"rep3"		\scp,p	\v,"rep3",tt	\scp,a	\v,"rep3",tt
			\end
		\end
	\end
\ret


@@!Imo_NameText_Refresh_Main
	\var,obj,a,p,o
	\var,int,a1,a2,n
	\var,str,s1,s2
	\cal,n=ParamInt[0]
	\cal,o=Imo_NameText[n],p=Imo_NameTextParam[n],a=Imo_NameTextAbsParam[n]
	
	
	\var,int,n,i
	\var,table,t
	\scp,p	\?c	\cal,n=ResultInt[0]
	\for,i=0,i<n,i++
		\scp,p	\?n,i								
		\scp,Imo_NameTextJump	\?v,ResultStr[0]	
		\div,",",ResultStr[0]						
		\scp,t
			\v,ResultStr[0],1					
			\v,ResultStr[1],1					
			\v,ResultStr[2],1					
			\v,ResultStr[3],1					
	\end
	\scp,t	\sort								
	\scp,t	\?c	\cal,n=ResultInt[0]
	\for,i=0,i<n,i++
		\scp,t	\?n,i
		\sub,ResultStr[0],,o,p,a	
	\end
\ret

@@!Imo_NameText_Refresh_After
	\if,AVG_InitFlag==0\then
		\ret
	\end
	
	\var,obj,o,p,a
	\var,int,a1,a2,n
	\cal,n=ParamInt[0]
	\cal,o=Imo_NameText[n],p=Imo_NameTextParam[n],a=Imo_NameTextAbsParam[n]
	
	\scp,a	\?v,"output"
	\if,ResultStr[0]!="text"\then
		\ret
	\end
	
	\var,str,tt
	\scp,a	\?v,"text"	\cal,tt=ResultStr[0]
	\if,tt==""\then
		\ret
	\end
	
	
	\var,str,st
	\scp,a	\?v,"fontno"	\stid,ResultStr[0],0	\cal,a1=ResultInt[0]
	\fmt,"[f,%d]",a1	\cal,st=st+ResultStr[0]
	\fmt,"[rf,%d]",a1	\cal,st=st+ResultStr[0]
	
	\scp,a	\?v,"fontsizew",24	\cal,a1=ResultInt[0]
	\scp,a	\?v,"fontsizeh",24	\cal,a2=ResultInt[0]
	\fmt,"[s,%d",a1,",%d]",a2	\cal,st=st+ResultStr[0]
	
	
	
	
	
	
	\scp,a	\?v,"colormode"
	\if,ResultStr[0]=="auto"\then
		\scp,Imo_NameTextColorList	\?v,s
		\if,ResultStr[0]==""\then
			\scp,Imo_NameTextColorList	\?v,"default"
		\end
		\stid,ResultStr[0],$FFFFFF	\cal,a1=ResultInt[0] | $FF000000
	\else
		\scp,a	\?v,"fontcolor",$FFFFFF	\cal,a1=ResultInt[0] | $FF000000
	\end
	\fmt,"[c,$%x]",a1	\cal,st=st+ResultStr[0]
	\fmt,"[rc,$%x]",a1	\cal,st=st+ResultStr[0]
	
	
	\scp,o	\cc	\o,st+tt	\mc
\ret


@@!Imo_NameText_10Base
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	\var,int,a1,a2
	\var,str,s1,s2
	
	
	\scp,a	\?v,"alignx"	\cal,s1=ResultStr[0]
	\scp,a	\?v,"aligny"	\cal,s2=ResultStr[0]
	\stid,s1,0	\cal,a1=ResultInt[0]
	\stid,s2,0	\cal,a2=ResultInt[0]
	\case,s1
		\of,"left"		\cal,a1=0
		\of,"center"	\cal,a1=50
		\of,"right"	\cal,a1=100
	\end
	\case,s2
		\of,"top"		\cal,a2=0
		\of,"center"	\cal,a2=50
		\of,"bottom"	\cal,a2=100
	\end
	\scp,o	\alg2,a1,a2
	
	
	\scp,a	\?v,"show"
	\if,ResultStr[0]=="true"\then
		\scp,o	\e
		\sub,@@!Imo_SkipImageObject,,o,"message",1
	\else
		\scp,o	\d
		\sub,@@!Imo_SkipImageObject,,o,"message",0
	\end
\ret

@@!Imo_NameText_11TextArea
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	\var,int,a1,a2
	
	
	\scp,a	\?v,"textareaw",0	\cal,a1=ResultInt[0]
	\scp,a	\?v,"textareah",0	\cal,a2=ResultInt[0]
	\scp,o	\ts,0,0,a1,a2
	
	\var,int,mx,my
	\scp,Imo_Project	\?v,"TextAreaMarginX",0	\cal,mx=ResultInt[0]
	\scp,Imo_Project	\?v,"TextAreaMarginY",0	\cal,my=ResultInt[0]
	\scp,o	\tmg,mx,my
\ret

@@!Imo_NameText_00File
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	
	\scp,p	\?v,"file"
	\if,ResultStr[0]!=""\then
		\sub,@@!Imo_NameText_File,,ResultStr[0]
		\scp,o	\l,ResultStr[0]
		
		
		\scp,o	\exr
	\end
	
	\scp,p	\?v,"rep0"
	\if,ResultStr[0]!="" && ResultStr[0]!="pass"\then
		\sub,@@!Imo_NameText_File,,ResultStr[0]
		\scp,o	\li,0,ResultStr[0]
	\end
	\scp,p	\?v,"rep1"
	\if,ResultStr[0]!="" && ResultStr[0]!="pass"\then
		\sub,@@!Imo_NameText_File,,ResultStr[0]
		\scp,o	\li,1,ResultStr[0]
	\end
	\scp,p	\?v,"rep2"
	\if,ResultStr[0]!="" && ResultStr[0]!="pass"\then
		\sub,@@!Imo_NameText_File,,ResultStr[0]
		\scp,o	\li,2,ResultStr[0]
	\end
	\scp,p	\?v,"rep3"
	\if,ResultStr[0]!="" && ResultStr[0]!="pass"\then
		\sub,@@!Imo_NameText_File,,ResultStr[0]
		\scp,o	\li,3,ResultStr[0]
	\end
	\sub,@@!Imo_Zero
\ret

@@!Imo_NameText_12Motion
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]

	\var,str,s1
	\var,int,a1	
	\scp,a	\?v,"motion",0	\cal,s1=ResultStr[0]
	\stid,s1,$FFFF
	\cal,a1=ResultInt[0]
	\if,a1==$FFFF\then
		\scp,o	\m,s1
	\else
		\scp,o	\m,a1
	\end
\ret

@@!Imo_NameText_20Position
	\var,obj,o,p,a
	\cal,o=ParamStr[0],p=ParamStr[1],a=ParamStr[2]
	
	\var,int,x,y,z,100,100,100,0,0,0,pri,0
	\scp,a	\?v,"x",0	\cal,x=ResultInt[0]
	\scp,a	\?v,"y",0	\cal,y=ResultInt[0]
	\scp,a	\?v,"z",0	\cal,z=ResultInt[0]
	\scp,a	\?v,"pri",0	\cal,pri=ResultInt[0]
	\scp,o	\p4,x,y,z,100,100,100,0,0,0,pri,0
	\sub,@@!Imo_Zero
\ret

