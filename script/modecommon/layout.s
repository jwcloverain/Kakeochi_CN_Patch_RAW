






@@!Layout_Common_Create
  
  \gvar,img,BackImage
  \gvar,btn,PageButton[4]
  
  \scp,BackImage
    \l,"back.b"
    \p,0,0,0
    \e
  \scp,PageButton[0]
    \l,"Button_extra.b"
    \li,0,"extra_btn01_n.png"
    \li,1,"extra_btn01_o.png"
    \ls,0,"..\..\Misc\Sys_OnMouse.wav"
    \ls,1,"..\..\Misc\Sys_OnClick.wav"
    \p,307,674,1000
    \us,"@@!CGPage"
    \ui,0
    \sp,1,1
    \vtn,3
    \tab,0
    \e
  \scp,PageButton[1]
    \l,"Button_extra.b"
    \li,0,"extra_btn02_n.png"
    \li,1,"extra_btn02_o.png"
    \ls,0,"..\..\Misc\Sys_OnMouse.wav"
    \ls,1,"..\..\Misc\Sys_OnClick.wav"
    \p,630,674,1000
    \us,"@@!ScenePage"
    \ui,1
    \sp,1,1
    \vtn,3
    \tab,1
    \e
  \scp,PageButton[2]
    \l,"Button_extra.b"
    \li,0,"extra_btn03_n.png"
    \li,1,"extra_btn03_o.png"
    \ls,0,"..\..\Misc\Sys_OnMouse.wav"
    \ls,1,"..\..\Misc\Sys_OnClick.wav"
    \p,951,674,1000
    \us,"@@!ChapterPage"
    \ui,2
    \sp,1,1
    \vtn,3
    \tab,2
    \e
  \scp,PageButton[3]
    \l,"Button_return.b"
    \li,0,"024_title_n.png"
    \li,1,"024_title_o.png"
    \ls,0,"..\..\Misc\Sys_OnMouse.wav"
    \ls,1,"..\..\Misc\Sys_OnClick.wav"
    \p,1196,674,1000
    \us,"@@!Cancel"
    \ui,3
    \sp,1,1
    \vtn,3
    \tab,3
    \e
\ret

@@!Layout_Common_Free
  
  \del,BackImage
  \del,PageButton
\ret
