import csv
from jugement import est_heureux

def generer_csv():
    entetes = [""] + [str(i) for i in range(10)]
    lignes = [entetes]
    
    for i in range(10):
        ligne_actuelle = [str(i)]
        
        for j in range(10):
            nombre = 10 * i + j
            
            if nombre == 0:
                ligne_actuelle.append("X")
            elif est_heureux(nombre):
                ligne_actuelle.append("$#text(weight: \"bold\")[H]$")
            else:
                ligne_actuelle.append("m")
                
        lignes.append(ligne_actuelle)
        
    with open("1E1-DM6/tableau_heureux.csv", "w", newline="", encoding="utf-8") as fichier:
        writer = csv.writer(fichier)
        writer.writerows(lignes)

if __name__ == "__main__":
    generer_csv()