#Number of unique paths to bottom right of an mxn grid
class Solution:
    def uniquePaths(self, m: int, n: int) -> int:
        
        #Initialize 2D dp array
        dp = [[1 for i in range(n)] for j in range(m)]
        
        
        for i in range(1,m):
            for j in range(1,n):
                
                # As we can only move down or right,
                # Number of paths to a cell is sum from
                # upper cell and left cell
                dp[i][j] = dp[i-1][j]+dp[i][j-1]
        
        #Number of paths to last cell
        return dp[-1][-1]
