#include <iostream>
using namespace std;

// Node structure for dynamic memory allocation
struct Node {
    int data;
    Node* next;
};

// Queue Implementation (FIFO - First In First Out)
class Queue {
private:
    Node *front, *rear;
public:
    Queue() { front = rear = nullptr; }

    void enqueue(int value) {
        Node* temp = new Node();
        temp->data = value;
        temp->next = nullptr;
        if (rear == nullptr) {
            front = rear = temp;
            return;
        }
        rear->next = temp;
        rear = temp;
    }

    void dequeue() {
        if (front == nullptr) {
            cout << "Queue Underflow" << endl;
            return;
        }
        Node* temp = front;
        front = front->next;
        if (front == nullptr) rear = nullptr;
        delete temp;
    }

    void display() {
        Node* temp = front;
        while (temp != nullptr) {
            cout << temp->data << " -> ";
            temp = temp->next;
        }
        cout << "NULL" << endl;
    }
};

int main() {
    Queue q;
    cout << "Initializing Portfolio Queue Project..." << endl;
    q.enqueue(10);
    q.enqueue(20);
    q.enqueue(30);
    cout << "Queue elements: ";
    q.display();

    cout << "Removing element..." << endl;
    q.dequeue();
    cout << "Updated Queue: ";
    q.display();

    return 0;
}
