/*
  Print elements of a linked list on console
  head pointer input could be NULL as well for empty list
  Node is defined as

  struct Node
  {
     int data;
     struct Node *next;
  }
*/

#include <stdio.h>
#include <iostream>
void Print(Node *head)
{
  // This is a "method-only" submission.
  // You only need to complete this method.
    Node* tmp = head;
    if(tmp != NULL) {
        cout << tmp->data << endl;
        while(tmp->next != NULL) {
            tmp = tmp->next;
            cout << tmp->data << endl;
        }
    }
}