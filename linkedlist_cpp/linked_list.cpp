#include <iostream>
using namespace std;

struct Node {
  int data;
  struct Node *next;
};
struct Node* top = NULL;

void push(int val) {
  struct Node* newnode = (struct Node*) malloc (sizeof(struct Node));
  newnode->data = val;
  newnode->next = top;
  top = newnode;
}

void pop() {
  if(top == NULL) {
    cout << "The Stack is empty" << endl;
    return;
  }
  cout << "The top of the stack was: " << top->data << endl;
  top = top->next;
}

void peek() {
  if(top == NULL) {
    cout << "The Stack is empty" << endl;
    return;
  }
  cout << "The top of the stack is: " << top->data << endl;
}

int main() {
  int choice;
  do {
    cout << "\nWhat do you want to do in the Stack using LinkedList?" << endl;
    cout << "1. Push" << endl;
    cout << "2. Pop" << endl;
    cout << "3. Peek" << endl;
    cout << "4. Exit" << endl;
    cout << "\nEnter your choice (1 - 4): ";
    cin >> choice;
    switch(choice) {
      case 1: {
        int data;
        cout << "Enter the number to be pushed inside the stack: ";
        cin >> data;
        push(data);
        break;
      }
      case 2: {
        pop();
        break;
      }
      case 3: {
        peek();
        break;
      }
      case 4: {
        break;
      }
      default: {
        cout << "Invalid Choice" << endl;
      }
    }
  } while(choice != 4);
  return 0;
}