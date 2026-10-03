#import "../templates/dm.typ": dm, olympiades, code, affiche-csv

#dm(
  titre: "Nombres heureux",
  problems_name: "Problème",
  numbers: true,
  auteurs: "BONNET Zéphyr, FERRAOUN Rayane, MELLIER Raphaël, MITROI Andrei",
  classe: $1^"ère"1$,
  numero: 6,
)[

#let etapes-algo(columns: auto, align-style: center, ..cells) = {
  align(center)[
    #table(
      columns: columns,
      align: align-style,
      stroke: 0.5pt + luma(150),
      fill: (col, row) => if row == 0 { rgb("#eef6ff") } else { none },
      ..cells
    )
  ]
}

= #olympiades

== Description de l'algorithme

===
Déterminons l'image de $12 space 345$.

#etapes-algo(
  columns: (auto, 1.5cm, 1.5cm, auto),
  
  [*Étape*], [*$d$*], [*$r$*], [*$p$*],
  
  [Initialisation], [$12345$], [-], [$0$],
  [Itération n°1], [$1234$], [$5$], [$0 + 5^2 = 25$],
  [Itération n°2], [$123$], [$4$], [$25 + 4^2 = 41$],
  [Itération n°3], [$12$], [$3$], [$41 + 3^2 = 50$],
  [Itération n°4], [$1$], [$2$], [$50 + 2^2 = 54$],
  [Itération n°5], [$0$], [$1$], [$54 + 1^2 = 55$],
)

La boucle #smallcaps[tant que] s'arrête car $d = 0$. L'algorithme renvoie alors $p = 55$.
On en déduit que $12345 arrow 55$.

En exécutant le code python, on a bien `karma(157) = 75`, `karma(75) = 74` et `karma(74) = 65`. Donc on a bien $157 arrow 75$, $75 arrow 74$ et $74 arrow 65$.

===
L'algorithme calcule la somme des carrés des chiffres qui compose le nombre qui lui est donné.

===
====
Même sans calculer les images de $157, 175, 517, 715$ et $751$ nous pouvons dire que ce sont les mêmes.

== Trajectoires des nombres inférieurs à $100$.

===
Voici un algorithme (pas optimisé) donnant les nombres heureux strictement inférieurs à $100$ :

#align(center)[
  #code("1E1-DM6/jugement.py")
]

#v(2em)

On obtient ainsi le tableau suivant :

#align(center)[
  #affiche-csv("1E1-DM6/tableau_heureux.csv")
]

On observe bien qu'il n'existe aucun nombre inférieur à $100$ qui ne soit ni malheureux ni heureux.

===
D'après la *1.B.1)*, on voit qu'il y a $19$ nombres heureux.

Ainsi, $P("\"Obtenir un nombre heureux\"") = 19/100$.

== Trajectoires des nombres à $n$ chiffres.

=== Nombres à $3$ chiffres.

=== Nombres à $n$ chiffres.

=== Probabilité.

#v(5%)

#align(center)[*Merci pour la lecture de ce devoir !*]

#align(center)[_Andrei_ : on veut $+$ de DM d'algorithmique Madame svp #emoji.hands.folded #emoji.hands.folded]

#align(center)[#align(bottom)[
L'ensemble de nos devoirs maison, fichiers PDF et codes sont disponibles sur : \ #link("https://github.com/andreim42/DMs-Maths-LLG")
]]

]
