#include <stdio.h>
#include <stdlib.h>

struct Node
{
    int coeff;
    int pow;
    struct Node *next;
};

void new_node(int c, int p, struct Node **temp)
{
    struct Node *r, *z;
    z = *temp;
    if (z == NULL)
    {
        r = (struct Node *)malloc(sizeof(struct Node));
        r->coeff = c;
        r->pow = p;
        *temp = r;
        r->next = (struct Node *)malloc(sizeof(struct Node));
        r = r->next;
        r->next = NULL;
    }
    else
    {
        r->coeff = c;
        r->pow = p;
        r->next = (struct Node *)malloc(sizeof(struct Node));
        r = r->next;
        r->next = NULL;
    }
}

void polyAdd(struct Node *poly1, struct Node *poly2, struct Node *poly)
{
    while (poly1->next && poly2->next)
    {
        if (poly1->pow > poly2->pow)
        {
            poly->pow = poly1->pow;
            poly->coeff = poly1->coeff;
            poly1 = poly1->next;
        }
        else if (poly2->pow > poly1->pow)
        {
            poly->pow = poly2->pow;
            poly->coeff = poly2->coeff;
            poly2 = poly2->next;
        }
        else
        {
            poly->pow = poly1->pow;
            poly->coeff = poly1->coeff + poly2->coeff;
            poly1 = poly1->next;
            poly2 = poly2->next;
        }

        poly->next = (struct Node *)malloc(sizeof(struct Node));
        poly = poly->next;
        poly->next = NULL;
    }
    while (poly1->next || poly2->next)
    {
        if (poly1->next)
        {
            poly->pow = poly1->pow;
            poly->coeff = poly1->coeff;
            poly1 = poly1->next;
        }
        if (poly2->next)
        {
            poly->pow = poly2->pow;
            poly->coeff = poly2->coeff;
            poly2 = poly2->next;
        }
        poly->next = (struct Node *)malloc(sizeof(struct Node));
        poly = poly->next;
        poly->next = NULL;
    }
}

void polySub(struct Node *poly1, struct Node *poly2, struct Node *poly)
{
    while (poly1->next && poly2->next)
    {
        if (poly1->pow > poly2->pow)
        {
            poly->pow = poly1->pow;
            poly->coeff = poly1->coeff;
            poly1 = poly1->next;
        }
        else if (poly2->pow > poly1->pow)
        {
            poly->pow = poly2->pow;
            poly->coeff = -poly2->coeff;
            poly2 = poly2->next;
        }
        else
        {
            poly->pow = poly1->pow;
            poly->coeff = poly1->coeff - poly2->coeff;
            poly1 = poly1->next;
            poly2 = poly2->next;
        }

        poly->next = (struct Node *)malloc(sizeof(struct Node));
        poly = poly->next;
        poly->next = NULL;
    }
    while (poly1->next || poly2->next)
    {
        if (poly1->next)
        {
            poly->pow = poly1->pow;
            poly->coeff = poly1->coeff;
            poly1 = poly1->next;
        }
        if (poly2->next)
        {
            poly->pow = poly2->pow;
            poly->coeff = -poly2->coeff;
            poly2 = poly2->next;
        }
        poly->next = (struct Node *)malloc(sizeof(struct Node));
        poly = poly->next;
        poly->next = NULL;
    }
}

void show(struct Node *node)
{
    while (node->next != NULL)
    {
        printf("%dx^%d", node->coeff, node->pow);
        node = node->next;
        if (node->coeff >= 0)
        {
            if (node->next != NULL)
                printf("+");
        }
    }
}

int main()
{
    struct Node *poly1 = NULL, *poly2 = NULL, *respoly1 = NULL, *respoly2 = NULL;

    // Create first list of 5x^2 + 4x^1 + 2x^0
    new_node(5, 2, &poly1);
    new_node(4, 1, &poly1);
    new_node(2, 0, &poly1);

    // Create second list of -5x^1 - 5x^0
    new_node(-5, 1, &poly2);
    new_node(-5, 0, &poly2);

    printf("1st Polynomial: ");
    show(poly1);

    printf("\n2nd Polynomial: ");
    show(poly2);

    respoly1 = (struct Node *)malloc(sizeof(struct Node));
    respoly2 = (struct Node *)malloc(sizeof(struct Node));

    // Function add two polynomial numbers
    polyAdd(poly1, poly2, respoly1);

    // Display resultant List
    printf("\nAddition result: ");
    show(respoly1);

    //Function subtract two polynomials
    polySub(poly1, poly2, respoly2);

    // Display resultant List
    printf("\nSubtraction result: ");
    show(respoly2);
    return 0;
}