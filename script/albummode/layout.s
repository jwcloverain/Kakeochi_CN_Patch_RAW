






@@!Layout_Create
  
  \gvar,img,MaskImage
  \gvar,bar,ScrollBar
  \gvar,img,TempFrameImage
  \gvar,btn,TempThumButton
  \gvar,btn,UpDownButton[2]
  














  \scp,TempFrameImage
    \l,"..\ModeCommon\000_base.png"
    \p,0,0,10
  \scp,TempThumButton
    \l,"ThumButton.b"
    \p,224,155,50
    
















\ret

@@!Layout_Free
  
  \del,MaskImage
  \del,ScrollBar
  \del,TempFrameImage
  \del,TempThumButton
  \del,UpDownButton
\ret
