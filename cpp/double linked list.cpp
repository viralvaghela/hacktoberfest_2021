#include <iostream>
#include <stdlib.h>
using namespace std;
typedef int infotype;
typedef struct TElmtList *address;
typedef struct TElmtList{
    infotype info;
    address next;
    address prev;
}ElmtList;

typedef struct List{
    address first;
    address last;
};
void CreateEmpty(List *L){
    (*L).first=NULL;
    (*L).last=NULL;
}
bool isEmpty(List L){
    return ((L).first==NULL && (L).last==NULL);
}
address Allocation(infotype x){
    address NewElmt;
    NewElmt = (ElmtList*) malloc (sizeof(ElmtList));
    NewElmt->info=x;
    NewElmt->next=NULL;
    NewElmt->prev=NULL;
    return NewElmt;
}
void Deallocation(address hapus){
    free(hapus);
}
void InsertFirst(List *L, infotype x){
    address NewElmt;
    NewElmt = Allocation(x);
    if (NewElmt != NULL){
		if (isEmpty(*L)){
			(*L).last=NewElmt;
		}else {
			NewElmt->next=(*L).first;
			(*L).first->prev=NewElmt;
		}
	}
	(*L).first=NewElmt;
}
void InsertAfter(List *L,address *PredElmt, infotype x){
    address NewElmt;
    NewElmt = Allocation(x);
    if(NewElmt!=NULL){
        NewElmt->next=(*PredElmt)->next;
        NewElmt->prev=(*PredElmt);
        (*PredElmt)->next->prev=NewElmt;
        (*PredElmt)->next=NewElmt;
    }else{
        InsertFirst(L,x);
    }
}
void InsertLast(List *L, infotype x){
    address NewElmt;
    NewElmt=Allocation(x);
    if(isEmpty((*L))){
        NewElmt->prev=(*L).last;
        (*L).last->next=NewElmt;
    }
    else{
        (*L).first = NewElmt;
	}
    (*L).last = NewElmt;
}
void DeleteFirst(List *L, infotype *hapus){
    if(!isEmpty(*L)){
        address temp;
        temp = (*L).first;
        *hapus=temp->info;
        (*L).first=(*L).first->next;
        temp->next=NULL;
        Deallocation(temp);
    }
}
void DeleteAfter(address pred, infotype *hapus){
    if(pred->next!=NULL){
        address temp;
        temp=pred->next;
        *hapus=temp->info;
        pred->next=temp->next;
        temp->next=NULL;
        Deallocation(temp);
    }
}
void DeleteLast(List *L, infotype *hapus){
    if(!isEmpty(*L)){
        address temp, predTemp;
        predTemp = NULL;
        temp = (*L).first;
        while(temp->next!=NULL){
            predTemp=temp;
            temp=temp->next;
        }
        if(temp==(*L).first){
            DeleteFirst(&(*L), &(*hapus));
        }else{
            DeleteAfter(predTemp, &(*hapus));
        }
    }
}
void printInfo (List L){
	/*	I.S. List mungkin kosong
		F.S. Jika list tidak kosong,
		Semua info yg disimpan pada elemen list diprint dengan format [elemen-1, elemen-2, elemen-3, ...]
		Jika list kosong, hanya menuliskan "[]"
	*/
	cout<<"[";
	if(!isEmpty(L)){
		address P = L.first;
		while(P->next!=NULL){
			cout<<P->info<<", ";
			P = P->next;
		}
		cout<<P->info;
	}
	cout<<"]"<<endl;
}
int main(){
	List L;
	CreateEmpty(&L);

	int n,x;
	cin>>n;
	for (int i =0;i<n;i++){
		cin>>x;
		InsertLast(&(L),x);
	}
	printInfo(L);
}
