q = c()
q_size = 0
enqueue = function(data) {
q <<- c(q, data)  
#enqueue( )�� q�� �̹� ����Ǿ� �ִ� �����Ϳ� ���ڷ� ���� �����͸� �߰��Ͽ� 
#�ٽ� ���� q�� �Ҵ��Ѵ�
q_size <<- q_size + 1
}
dequeue = function() {
first <- q[1] # dequeue( )�� q�� ����� ������ �� ù ��° ��Ҹ� first�� �����ϰ�
q <<- q[-1]  #q���� �� �����͸� ������ �����͸� ������ ���� first�� ��ȯ�Ѵ�
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
