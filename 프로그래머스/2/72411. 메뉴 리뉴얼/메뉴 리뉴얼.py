from itertools import combinations
from collections import Counter

import math

def solution(orders, course):
    answer = []
    
    for c in course:
        combi = []
        for order in orders:
            combi += combinations(sorted(order), c)
        most_ordered = Counter(combi).most_common()        
        max_count = most_ordered[0][1] if most_ordered else 0
        answer += ["".join(k) for k,v in most_ordered if v > 1 and v == max_count]
    return sorted(answer)