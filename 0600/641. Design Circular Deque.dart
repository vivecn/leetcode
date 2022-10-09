class MyCircularDeque {
  final int capacity;
  final List<int> queue;
  int front = 0;
  int rear = 0;

  MyCircularDeque(int k)
      : capacity = k + 1,
        queue = List.filled(k + 1, 0);

  bool insertFront(int value) {
    if (isFull()) return false;

    front = (front - 1 + capacity) % capacity;
    queue[front] = value;
    return true;
  }

  bool insertLast(int value) {
    if (isFull()) return false;

    queue[rear] = value;
    rear = (rear + 1) % capacity;
    return true;
  }

  bool deleteFront() {
    if (isEmpty()) return false;

    front = (front + 1) % capacity;
    return true;
  }

  bool deleteLast() {
    if (isEmpty()) return false;

    rear = (rear - 1 + capacity) % capacity;
    return true;
  }

  int getFront() {
    if (isEmpty()) return -1;
    return queue[front];
  }

  int getRear() {
    if (isEmpty()) return -1;
    return queue[(rear - 1 + capacity) % capacity];
  }

  bool isEmpty() {
    return front == rear ? true : false;
  }

  bool isFull() {
    return front == (rear + 1 + capacity) % capacity ? true : false;
  }
}

/**
 * Your MyCircularDeque object will be instantiated and called as such:
 * MyCircularDeque obj = MyCircularDeque(k);
 * bool param1 = obj.insertFront(value);
 * bool param2 = obj.insertLast(value);
 * bool param3 = obj.deleteFront();
 * bool param4 = obj.deleteLast();
 * int param5 = obj.getFront();
 * int param6 = obj.getRear();
 * bool param7 = obj.isEmpty();
 * bool param8 = obj.isFull();
 */