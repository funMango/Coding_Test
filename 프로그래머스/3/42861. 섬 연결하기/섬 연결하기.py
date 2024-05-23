def solution(n, costs):    
    costs.sort(key=lambda x: x[2])
    parent = [i for i in range(n)]
    rank = [0] * n
    min_cost = 0
    edges = 0
    
    for cost in costs:
        if edges == n - 1:
            return min_cost
                        
        a,b = cost[0], cost[1]
        
        aroot = find(parent, a)
        broot = find(parent, b)
        
        if aroot != broot:
            union(parent, rank, aroot, broot)
            min_cost += cost[2]
            edges += 1                                
            
    return min_cost    

def find(parent, i):
    if parent[i] == i:
        return i
    
    parent[i] = find(parent, parent[i])
    return parent[i]

def union(parent, rank, a, b):
    aroot = find(parent, a)
    broot = find(parent, b)
    
    if rank[aroot] > rank[broot]:
        parent[broot] = aroot
    elif rank[broot] > rank[aroot]:
        parent[aroot] = broot
    else:
        rank[aroot] += 1
        parent[broot] = aroot
            

