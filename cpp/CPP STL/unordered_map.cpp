// stores in key-value pair
// all kyes are not unique
// not stored in sorted order

#include <iostream>
#include <unordered_map>

using namespace std;

int main(){
    // declaration
    unordered_map<int,string> um;

    // assigning values
    // m[key]=value
    um[1]="Adarsh";
    um[2]="Navneet";
    um[30]="Sinha";

    // inserting elements using insert function
    um.insert({5,"geeky01adarsh"});

    // printing the map
    for(auto i:um){
        cout<<"key = "<<i.first<<" and its value = "<<i.second<<endl;
    }
    cout<<endl;

    // to check if an element is present or not(time-- O(1))
    cout<<"Is 13 present in map? "<<um.count(13)<<endl;

    // to return iterator where any element is present(time-- O(1))
    um.find(1);
    
    // deleting any key-value pair
    // takes key name as argument
    um.erase(2);
    // checking the map
    for(auto i:um){
        cout<<"key = "<<i.first<<" and its value = "<<i.second<<endl;
    }
    cout<<endl;


    return 0;
}