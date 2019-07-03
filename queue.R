q = c()
q_size = 0
enqueue = function(data) {
q <<- c(q, data)  
#enqueue( )는 q에 이미 저장되어 있는 데이터에 인자로 받은 데이터를 추가하여 
#다시 변수 q에 할당한다
q_size <<- q_size + 1
}
dequeue = function() {
first <- q[1] # dequeue( )는 q에 저장된 데이터 중 첫 번째 요소를 first에 저장하고
q <<- q[-1]  #q에는 이 데이터를 제외한 데이터를 저장한 다음 first를 반환한다
q_size <<- q_size - 1
return(first)
}
size = function() {
return(q_size)
}

enqueue(1)
enqueue(2)
enqueue(3)
print(size())
print(dequeue())
print(size())

