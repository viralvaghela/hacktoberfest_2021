//Author: Atanu Ghosh [https://github.com/zabuja]
// This is a C++ Program to use Linked List and subtract two large Numbers
// This C++ program takes the values of two large numbers as input and displays the computed value node by node in the resultant linked list.

#include <iostream>
#include <conio.h>

using namespace std;

int c = 0, c1 = 0;

struct node1

{

    node1 *link;

    int data1;

} *head = NULL, *m = NULL, *np1 = NULL, *n = NULL;

struct node

{

    node *next;

    int data;

} *start = NULL, *p = NULL, *np = NULL, *q = NULL;

void store(int x)

{

    np1 = new node1;

    np1->data1 = x;

    np1->link = NULL;

    if (c == 0)

    {

        head = np1;

        m = head;

        m->link = NULL;

        c++;
    }

    else

    {

        m = head;

        while (m->link != NULL)

        {

            m = m->link;
        }

        m->link = np1;

        np1->link = NULL;
    }
}

void keep(int x)

{

    np = new node;

    np->data = x;

    np->next = NULL;

    if (c1 == 0)

    {

        start = np;

        p = start;

        p->next = NULL;

        c1++;
    }

    else

    {

        p = start;

        while (p->next != NULL)

        {

            p = p->next;
        }

        p->next = np;

        np->next = NULL;
    }
}

void sub()

{

    int x;

    p = start;

    m = head;

    while (p != NULL)

    {

        if (p->data >= m->data1)

        {

            p->data = p->data - m->data1;

            p = p->next;

            m = m->link;

            continue;
        }

        else if (p->data < m->data1)

        {

            q = p;

            n = m;

            x = 0;

            do

            {

                if (q->data <= n->data1 && x == 0)

                {

                    q->data = q->data + 10;

                    q = q->next;

                    n = n->link;

                    x++;
                }

                else if (q->data <= n->data1 && x != 0)

                {

                    q->data = q->data + 9;

                    q = q->next;

                    n = n->link;

                    x++;
                }

                if (q->data > n->data1)

                {

                    q->data = q->data - 1;
                }

            }

            while (q->data < n->data1);
        }
    }
}

void traverse()

{

    node *q = start;

    int c = 0, i = 0;

    while (q != NULL)

    {

        q = q->next;

        c++;
    }

    q = start;

    while (i != c)

    {

        x[c - i - 1] = q->data;

        i++;

        q = q->next;
    }

    cout << "Result of subtraction for two numbers:\t";

    for (i = 0; i < c; i++)

    {

        cout << x[i] << "\t";
    }
}

void swap(int *a, int *b)

{

    int temp;

    temp = *a;

    *a = *b;

    *b = temp;
}

int main()

{

    int n, x, mod, mod1;

    int n1 = 0, n2 = 0;

    cout << "Enter the two numbers" << endl;

    cin >> n;

    cin >> x;

    if (x > n)

    {

        swap(&x, &n);
    }

    while (n > 0)

    {

        mod = n % 10;

        n = n / 10;

        keep(mod);

        n1++;
    }

    while (x > 0)

    {

        mod1 = x % 10;

        x = x / 10;

        store(mod1);

        n2++;
    }

    n1 = n1 - n2;

    while (n1 > 0)

    {

        store(0);

        n1--;
    }

    sub();

    traverse();

    getch();
}