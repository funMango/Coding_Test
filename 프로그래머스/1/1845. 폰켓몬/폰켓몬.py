def solution(nums):
    arr = set([n for n in nums])    
    return min(len(arr), len(nums) / 2)