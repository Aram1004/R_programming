#stack = function(){
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
    s <<- s[[length(s)]]
    
    s <<- tail(s,1)
    
    last<-s[-1]
    s <<-s[1]
    s_size <<- s_size - 1   
   if(empty())
    {
     s<<-c()
    }
  }
  
}
size= function(){
  return(s_size)
}

#return(list(full=full,empty=empty,push=push, pop=pop,size=size))
#}

#s=stack()
push(2)
push(3)
push(5)
print(size())
pop()
print(size())
s$size()
print(s)
s$pop()
s$size()


