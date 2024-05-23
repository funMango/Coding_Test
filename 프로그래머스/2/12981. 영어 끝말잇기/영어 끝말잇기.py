def solution(n, words):
    prev = words[0][0]
    used = set()
    
    for i, word in enumerate(words):
        if prev[-1] != word[0] or word in used:
            return [i%n+1, i//n+1]
        else:
            prev = word
            used.add(word)
    
    return [0,0]