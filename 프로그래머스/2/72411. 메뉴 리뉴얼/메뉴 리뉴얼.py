from itertools import combinations
import math

def solution(orders, course):
    answer = []
    
    for i in range(len(orders)):
        orders[i] = "".join(sorted(list(orders[i])))
    
    for c in course:
        order_dic = {}
        for order in orders:
            combi = combinations(order, c)
            for str in combi:
                menus = "".join(str)
                if menus in order_dic:
                    order_dic[menus] += 1
                else:
                    order_dic[menus] = 1
        
        if order_dic:            
            m = max([v for k,v in order_dic.items()])
            if m >= 2:
                courses = [k for k,v in order_dic.items() if v == m]
                answer += courses
        
    return sorted(answer)