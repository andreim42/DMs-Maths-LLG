def karma(n):
    d,p = n,0
    #print(f"d: {d}, r: -, p: {p}")
    while d!=0:
        r=d%10
        d=d//10
        p=p+r**2
        #print(f"d: {d}, r: {r}, p: {p}")
    return p

if __name__ == "__main__":
    print(karma(12345))