






@@!Layout_AlbumView_Create
  
  \gvar,img,View_backImage
  \gvar,btn,View_CancelButton
  \gvar,msg,View_PageIndexText
  
  \scp,View_backImage
    \l,"viewback.jpg"
    \p,0,0,-100
    \in,$10000
    \out,$10000
    \e



















\ret

@@!Layout_AlbumView_Free
  
  \del,View_backImage
  \del,View_CancelButton
  \del,View_PageIndexText
\ret
