






@@!Layout_Create
  
  \gvar,img,BackImage
  \gvar,btn,Button
  \gvar,img,FrameImage
  \gvar,btn,ScrollButton[2]
  \gvar,btn,TempDotButton
  \gvar,img,TempLineImage
  
  \scp,BackImage
    \l,"Back.b"
    \p,0,0,0
    \e
  \scp,Button[0]
    \l,"Button_Close.b"
    \li,0,"Close01.png"
    \li,1,"Close02.png"
    \p,980,540,200
    \us,"@@!Cancel"
    \e
  \scp,FrameImage
    \l,"Frame.b"
    \p,0,577,10
    \e
  \scp,ScrollButton[0]
    \l,"Button_SideScroll.b"
    \li,0,"prev01.png"
    \li,1,"Prev02.png"
    \p,50,370,200
    \us,"@@!ButtonScroll"
    \ui,-1
    \e
  \scp,ScrollButton[1]
    \l,"Button_SideScroll.b"
    \li,0,"next01.png"
    \li,1,"next02.png"
    \p,970,380,200
    \us,"@@!ButtonScroll"
    \ui,1
    \e
  \scp,TempDotButton
    \l,"Button_Dot_keep.b"
    \p,150,450,100
  \scp,TempLineImage
    \l,"Line1000.b"
    \p,150,450,90
\ret

@@!Layout_Free
  
  \del,BackImage
  \del,Button
  \del,FrameImage
  \del,ScrollButton
  \del,TempDotButton
  \del,TempLineImage
\ret
