stack = function(){
s=c()
s_size=0

full = function(){
  if (s_size>20)
  {
    return (TRUE)
  }
  else
  {
    return (FALSE)
  }
}

empty = function(){
  if (s_size==0)
  {
    return (TRUE)
  }
  else
  {
    return (FALSE)
  }
}

push = function(data){
  if(!full())
  {
    s <<- c(s,data)
    s_size <<- s_size+1   
  }
  
}
pop = function(){ 
  if(!empty())
  {
    # last<-tail(s, n=1)
    # print(last)
    last<- s[[length(s)]]
    s<<-s[0:(length(s)-1)]
    
    
    # s <<-s[1]
    s_size <<- s_size - 1   
    if(empty())
    {
      s<<-c()
    }
  }
  return (last)
}
size= function(){
  return(s_size)
}

return(list(full=full,empty=empty,push=push, pop=pop,size=size))
}


s=stack()
s$push(2)
s$push(3)
s$push(4)
s$size()
s$pop()
s$pop()
s$size()
