def partent_corrige(x):
    n = 0
    if x >= 0:
        while n + 1 <= x:
            n += 1
    else:
        while n > x:
            n -= 1
    return n

if __name__ == "__main__":
    assert(partent_corrige(2.5) == 2)
    assert(partent_corrige(-3) == -3)
    assert(partent_corrige(-3.14) == -4)