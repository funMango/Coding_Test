from collections import deque
import heapq

def solution(land, height):
    N = len(land)
    answer = 0
    visited = [[False for _ in range(N)] for _ in range(N)]
    cost = [[float('inf') for _ in range(N)] for _ in range(N)]    
        
    heap = []
    heapq.heappush(heap, (0,0,0))
    move = [(1,0), (-1,0), (0,1), (0,-1)]
    
    while heap:
        c, y, x = heapq.heappop(heap)
        
        if not visited[y][x]:
            visited[y][x] = True
            answer += c
            cost[y][x] = c
            
            # print(y, x)
            # for s in cost:
            #     print(s)
            
            for m in move:
                dy = y + m[0]
                dx = x + m[1]

                if not in_range(dy, dx, N):
                    continue

                diff = get_diff(y, x, dy, dx, height, land)  
                heapq.heappush(heap, (diff, dy, dx))                             
                                
    return answer

def in_range(dy, dx, N):
    return 0 <= dy < N and 0 <= dx < N

def get_diff(y, x, dy, dx, height, land):
    diff = abs(land[y][x] - land[dy][dx])
    
    if height >= diff:
        return 0
    return diff
        