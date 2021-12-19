library(gplots)
library(RColorBrewer)
library(fields)
library(scales)


hist2dlogloglog <- function(datax, datay,nbins=100,col=rf(32),log="",...){
  par(mar=c(6,6,6,7))
  
  # parse where logarithmic axes are desired (x,y, and z as color-code)
  if(grepl("x",log,fixed = T)){
    logx = T
  }else{
    logx = F
  }
  if(grepl("y",log,fixed=T)){
    logy=T
  }else{
    logy = F
  }
  if(grepl("z",log,fixed = T)){
    logz = T
  }else{
    logz = F
  }
  
  rf <- colorRampPalette(rev(brewer.pal(11,'Spectral')))
  
  #log X and Y data if desired
  
  if(logx){
    datax = log(datax)
  }
  
  if(logy){
    datay = log(datay)
  }
  
  h <- hist2d(datax, datay,nbins=nbins,show=F)
  
  #if logging Z axis (color-coded) is desired, log the calculcated counts for each histogram bin
 
  if(logz){
    h$counts = log(h$counts+1)
  }
  
  # remove empty fields (we had to set h$counts +1 for logarithm earlier)
  h$counts[h$counts == 0] <- NA
  
  # plot hist2d
  image(x=h$x, y= h$y, z=h$counts,col=col,axes=F,...)
  
  # calculcate axes ticks, check if log is desired or not.
  if(logx){
    xticks = log(log_breaks(base=10)(exp(h$x)))
    xlabels = log_breaks(base=10)(exp(h$x))  
  }else{
    xticks = pretty(h$x)
    xlabels = pretty(h$x)
  }
  
  if(logy){
    yticks = log(log_breaks(base=10)(exp(h$y)))
    ylabels = log_breaks(base=10)(exp(h$y))
  }else{
    yticks = pretty(h$y)
    ylabels = pretty(h$y)
  }
  
  
  # allow overplotting so that all labels get placed.
  # this doesn't always work.
  par(xpd=T)
  axis(1,at=xticks,labels=xlabels)
  axis(2,at=yticks,labels=ylabels)
  par(xpd=F)
  
  
  #plot grid
  abline(v=xticks,col="grey",lty=3)
  abline(h=yticks,col="grey",lty=3)

  if(logz){
  image.plot(h$counts,legend.only = T,col = col, legend.line=2.9,axis.args = list(at=log(log_breaks(n=5,base=10)(exp(h$counts))), labels=log_breaks(n=5,base=10)(exp(h$counts))))
  }else{
    image.plot(h$counts,legend.only = T,col = col, legend.line=2.9)
    
  }
}

