//Link to the Question-->https://leetcode.com/problems/employee-importance/
/*
// Definition for Employee.
class Employee {
public:
    int id;
    int importance;
    vector<int> subordinates;
};
*/
//Now to find the total importance of an employee, it will be the importance of that employee, plus the total 
// importance of each of that employee's subordinates. This is a straightforward depth-first search.
class Solution {
public:
    int ans=0;
    int getImportance(vector<Employee*> employees, int id) {
        for(auto i : employees){
           if(i->id==id){
              ans=ans+(i->importance);
               for(auto j : i->subordinates){
                   getImportance(employees, j);
               }
           }
        }
        return ans;
    }
};