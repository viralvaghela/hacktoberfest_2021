<<<<<<<< Program Of Cut The Sticks >>>>>>>

vector<int> cutSticks(vector<int> lengths) {
  sort(lengths.begin() , lengths.end());
  int shortest = INT_MIN;
  vector<int> ans;
  for(int i=0;i<lengths.size();i++){
    if(lengths[i] > shortest){
    	ans.push_back(lengths.size() -i);
    	shortest = lengths[i];  
    }
  }
  return ans;
}
