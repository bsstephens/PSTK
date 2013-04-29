wmax=ceil(max(Cw)+.1*ceil(max(Cw)))
winc=wmax/5
pmax=ceil(max(cat(1,ms,y))+.1*ceil(max(cat(1,ms,y))))
pinc=pmax/5
tmax=max(ts)

ax=axes('position',[0.1 0.1 0.8 0.8]) ;
    p=plot(ts',ms','ko','MarkerFaceColor','k')  ;
    set(ax,'color','white','YLimMode','manual','YLim',[0 pmax],'YTick',[0:pinc:pmax],'XLimMode','manual','XLim',[0 tmax],'XTick',[0:5:tmax],'FontName','Courier New');
    set(get(ax,'YLabel'),'String','Mass accumulated in Sampler (ng)','FontName','Courier New','FontSize',12 );

ax1=axes('position',[0.1 0.1 0.8 0.8]); 
     p1=plot(t,y(:,1),'k-');
     set(ax1,'color','none','YLimMode','manual','YLim',[0 pmax],'YTick',[0:pinc:pmax],'XLimMode','manual','XLim',[0 tmax],'XTick',[0:5:tmax],'FontName','Courier New')  ;
    
ax2=axes('position',[0.1 0.1 0.8 0.8]) ;
    p2=plot(tw,Cw,'b--');
    set(ax2,'YAxisLocation','Right','color','none','YLimMode','manual','YLim',[0 wmax],'YTick',[0:winc:wmax],'XLimMode','manual','XLim',[0 tmax],'XTick',[0:5:tmax],'FontName','Courier New' );
    set(get(ax2,'YLabel'),'String','Water Concentration via SPE (ng/L)','FontName','Courier New','FontSize',12 );
    set(get(ax2,'XLabel'),'String','Days','FontName','Courier New','FontSize',12 );
    
 %legend(gr,'Water Conc (LHS)','Passive Sampler (LHS)','Optimised Model (RHS)',0);
 
 
  



