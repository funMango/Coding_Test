def solution(n, wires):
    graph = {i : [] for i in range(1, n + 1)}
    min_count = float('inf')
    
    for a,b in wires:
        graph[a].append(b)
        graph[b].append(a)
    
    for a,b in wires:
        
        graph[a].remove(b)
        graph[b].remove(a)
        
        cnt_a = dfs(a, b, graph)
        cnt_b = n - cnt_a
        
        min_count = min(min_count, abs(cnt_a - cnt_b))
        
        graph[a].append(b)
        graph[b].append(a)                    
    
    return min_count

def dfs(node, parent, graph):
    cnt = 1
    
    for child in graph[node]:
        if child != parent:
            cnt += dfs(child, node, graph)
    
    return cnt