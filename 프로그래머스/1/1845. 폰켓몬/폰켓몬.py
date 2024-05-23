def solution(nums):
    arr = set([n for n in nums])
    m = len(nums) / 2
    return len(arr) if len(arr) < m else m   