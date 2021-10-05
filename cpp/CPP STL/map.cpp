// stores in key-value pair
// all kyes are unique
// stored in sorted order

#include <iostream>
#include <map>

using namespace std;

int main(){
    // declaration
    map<int,string> mp;

    // assigning values
    // m[key]=value
    mp[1]="Adarsh";
    mp[2]="Navneet";
    mp[30]="Sinha";

    // inserting elements using insert function
    mp.insert({5,"geeky01adarsh"});

    // printing the map
    for(auto i:mp){
        cout<<"key = "<<i.first<<" and its value = "<<i.second<<endl;
    }
    cout<<endl;

    // to check if an element is present or not(time-- O(log n))
    cout<<"Is 13 present in map? "<<mp.count(13)<<endl;

    // to return iterator where any element is present(time-- O(log n))
    mp.find(1);
    
    // deleting any key-value pair
    // takes key name as argument
    mp.erase(2);
    // checking the map
    for(auto i:mp){
        cout<<"key = "<<i.first<<" and its value = "<<i.second<<endl;
    }
    cout<<endl;


    return 0;
}