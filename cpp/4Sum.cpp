#include <bits/stdc++.h>
using namespace std;

vector<vector<int>> fourSum(vector<int>& nums, int target) {
	vector<vector<int>> res;
	int n = nums.size();
	if (n < 4)
		return res;
	sort(nums.begin(), nums.end());
	for (int i = 0; i < n; ++i) {
		for (int j = i + 1; j < n; ++j) {
			int left = j + 1;
			int right = n - 1;

			int toGet = target - nums[i] - nums[j];

			while (left < right) {
				int sum = nums[left] + nums[right];
				if (sum > toGet)
					right--;
				else if (sum < toGet)
					left++;
				else {
					vector<int> temp(4, 0);
					temp[0] = nums[i];
					temp[1] = nums[j];
					temp[2] = nums[left];
					temp[3] = nums[right];
					res.emplace_back(temp);

					while (left < right && nums[left] == temp[2])
						left++;
					while (right > left && nums[right] == temp[3])
						right--;
				}
			}
			while (j < n - 1 && nums[j] == nums[j + 1])
				j++;
		}
		while (i < n - 1 && nums[i] == nums[i + 1])
			i++;
	}
	return res;

}

int main()
{
	ios_base::sync_with_stdio(false);
	cin.tie(NULL);

	int n; cin >> n;
	std::vector<int> arr(n);

	for (int i = 0; i < n; ++i)
		cin >> arr[i];

	int target;
	cin >> target;

	vector<vector<int>> res = fourSum(arr, target);

	for (int i = 0; i < res.size(); ++i) {
		for (int j = 0; res[i].size(); ++i) {
			cout << res[i][j] << " ";
		}
		cout << '\n';
	}

	return 0;
}
