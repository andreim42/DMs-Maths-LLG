from karma import karma

def est_heureux(nb):
    deja_vus = set()
    while (nb not in deja_vus):
        deja_vus.add(nb)
        nb = karma(nb)
    return nb == 1

def jugement_dernier():
    for nb in range(100):
        if (est_heureux(nb)):
            print(nb)

if __name__ == "__main__":
    jugement_dernier()