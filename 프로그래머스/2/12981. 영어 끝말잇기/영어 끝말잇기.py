from collections import Counter

def solution(n, words):
    answer = []
    stack = []
    words_set = set()
    
    # 앞글자와 단어가 다른 경우
    for i in range(len(words)):
        if not stack:
            stack.append(words[i])            
        else:
            if stack[-1][-1] == words[i][0]:
                stack.pop()
                stack.append(words[i])
            elif stack[-1][-1] != words[i][0] or len(words[i]) <= 1:
                print(i)
                return [i%n+1, i//n+1]
        
        # 중복확인
        if words[i] not in words_set:
            words_set.add(words[i])
        else:
            return [i%n+1, i//n+1]

    return [0,0]