from jugement import est_heureux

def bonheur_probabiliste(n):
    nbs_heureux = 0
    for nb in range(1, n + 1):
        if est_heureux(nb):
            nbs_heureux += 1
    return nbs_heureux / n

if __name__ == "__main__":
    print(bonheur_probabiliste(10000))