
def solution(n, wires):
    
    result = float('inf')
    
    for i in range(len(wires)):        
        visited = [False] * (n + 1)
        temp = wires[:]
        temp.pop(i)
        dic = relation(temp, n)
        res = []
        
        for node in range(1, n + 1):
            if not visited[node]:
                visited[node] = True                
                count = dfs(node, dic, 1, visited)
                res.append(count)
            
        result = min(result, abs(res[0] - res[1]))
        
    return result

def relation(wires, n):
    dic = {i + 1: [] for i in range(n)}
    for wire in wires:
        a,b = wire
        dic[a].append(b)
        dic[b].append(a)
    
    return dic

def dfs(node, wires, count, visited):
    if node in wires:        
        for new_node in wires[node]:
            if not visited[new_node]:
                visited[new_node] = True
                count = max(count, dfs(new_node, wires, count + 1, visited))
    return count
    