#import "../templates/dm.typ": dm, resultat

#dm(
  titre: "Logique. Triangles magiques",
  problems_name: "Problème",
  numbers: true,
  auteurs: "BONNET Zéphyr, FERRAOUN Rayane, MELLIER Raphaël, MITROI Andrei",
  classe: $1^"ère"1$,
  numero: 1,
)[

#let traite-cellule(cell) = {
  if cell.starts-with("$") {
    eval(cell)
  } else {
    cell
  }
}

#let affiche-csv(fichier) = {
  let data = csv(fichier)

  table(
    columns: data.first().len(),

    ..data.map(row =>
      row.map(cell => traite-cellule(cell))
    ).flatten(),
  )
}

#import "@preview/fletcher:0.5.8": diagram, node, edge

#let triangle-magique(n1, n2, n3, n4, n5, n6, n7, n8, n9) = align(center)[
  #diagram(
    spacing: 0.75em,
    node-inset: 6pt,
    node-stroke: 1.2pt + black,
    node-fill: white,
    {
      edge((0, 0), (-3, 3), "-")
      edge((-3, 3), (3, 3), "-")
      edge((3, 3), (0, 0), "-")

      node((0, 0), n1)
      node((-1, 1), n2)
      node((-2, 2), n3)
      node((-3, 3), n4)
      node((-1, 3), n5)
      node((1, 3), n6)
      node((3, 3), n7)
      node((2, 2), n8)
      node((1, 1), n9)
    }
  )
]

= Logique de Łukasiewicz

=== Propriétés de $and$ et $or$.

Soient $cal(P), cal(Q), cal(R)$ des assertions.

====
Montrons que $(cal(P) and cal(Q)) <==> (cal(Q) and cal(P))$ à l'aide de leurs tables de vérité #footnote[Toutes les tables de vérité de ce devoir ont été générés automatiquement par un module python réalisé par nos soins : #link("https://github.com/andreim42/truth-table-builder/")] :

#align(center)[
  #affiche-csv("tables/1a.csv")
]

Les deux colonnes $(cal(P) and cal(Q))$ et $(cal(Q) and cal(P))$ sont identiques donc les deux assertions sont équivalentes.

====
Montrons que les assertions $((cal(P) and cal(Q)) and cal(R)) <==> (cal(P) and (cal(Q) and cal(R)))$ à l'aide de leurs tables de vérité :

#align(center)[
  #affiche-csv("tables/1b.csv")
]

Les deux colonnes $((cal(P) and cal(Q)) and cal(R))$ et $(cal(P) and (cal(Q) and cal(R)))$ sont identiques donc les deux assertions sont équivalentes.

====
Montrons les deux lois de De Morgan.

Montrons que $not(cal(P) or cal(Q)) <==> (not cal(P) and not cal(Q))$ et $not(cal(P) and cal(Q)) <==> (not cal(P) or not cal(Q))$ à l'aide de leurs tables de vérité :

#align(center)[
  #grid(
    columns: 2, gutter: 2em
  )[
    #affiche-csv("tables/1c1.csv")
  ][
    #affiche-csv("tables/1c2.csv")
  ]
]

Les deux colonnes $not(cal(P) or cal(Q))$ et $not cal(P) and not cal(Q)$ de la première table sont identiques donc les deux assertions sont équivalentes.
De plus, les deux colonnes $not(cal(P) and cal(Q))$ et $not cal(P) or not cal(Q)$ de la seconde table sont identiques donc les deux assertions sont équivalentes.

Ainsi, les lois de De Morgan restent vérifiées dans $cal(L)_3$.

====
Montrons la commutativité et l'associativité du "ou" dans $cal(L)_3$.

- Montrons que $(cal(P) or cal(Q)) <==> (cal(Q) or cal(P))$ :

$
(cal(P) or cal(Q)) &<==> not(not cal(P) and not cal(Q)) #h(2em) &#text[d'après la *c)*] \
&<==> not(not cal(Q) and not cal(P)) &#text[d'après la *a)*] \
&<==> (cal(Q) or cal(P))
$

Donc les assertions $cal(P) or cal(Q)$ et $cal(Q) or cal(P)$ sont bien équivalentes.

- Montrons que $((cal(P) or cal(Q)) or cal(R)) <==> (cal(P) or (cal(Q) or cal(R)))$ :

$
((cal(P) or cal(Q)) or cal(R)) &<==> not(not(cal(P) or cal(Q)) and not cal(R)) #h(2em) &#text[d'après la *c)*] \
&<==> not((not cal(P) and not cal(Q)) and not cal(R)) \
&<==> not(not cal(P) and (not cal(Q) and not cal(R))) &#text[d'après la *a)*] \
&<==> not(not cal(P) and not(cal(Q) or cal(R))) \
&<==> cal(P) or (cal(Q) or cal(R)) \
$

Donc les assertions $((cal(P) or cal(Q)) or cal(R))$ et $(cal(P) or (cal(Q) or cal(R)))$ sont bien équivalentes.

=== Propriétés de l'implication.

Soient $cal(P), cal(Q), cal(R)$ des assertions.

====
Montrons que $not cal(P) or cal(Q)$ n'est pas équivalente à $cal(P) => cal(Q)$ grâce à leurs tables de vérités.

#align(center)[
  #affiche-csv("tables/2a.csv")
]

Les colonnes $not cal(P) or cal(Q)$ et $cal(P) ==> cal(Q)$ ne sont pas identiques donc les deux assertions ne sont sont plus équivalentes dans $cal(L)_3$.

====
Montrons que $cal(P) ==> cal(Q)$ est équivalente à $not cal(Q) => not cal(P)$ grâce à leurs tables de vérités.

#align(center)[
  #affiche-csv("tables/2b.csv")
]

Les colonnes $cal(P) ==> cal(Q)$ et $not cal(Q) ==> not cal(P)$ sont identiques donc les deux assertions sont bien équivalentes. La méthode de démonstration par contraposition est donc utilisable dans $cal(L)_3$

==== 
Montrons que nous n'avons pas $((cal(P) ==> cal(Q)) and (cal(Q) ==> cal(R))) ==> (cal(P) ==> cal(R))$ à l'aide de sa table de vérité :

#align(center)[
  #affiche-csv("tables/2c.csv")
]

On remarque qu'il existe un cas où l'assertion $((cal(P) ==> cal(Q)) and (cal(Q) ==> cal(R))) ==> (cal(P) ==> cal(R))$ prend la valeur de vérité I, l'assertion n'est donc pas une tautologie.

===

====
#align(center)[
  #affiche-csv("tables/3a.csv")
]

On voit que $cal(P) or not cal(P)$ n'est pas toujours vraie grâce à la table de vérité ci-dessus.

L'énoncé $cal(P) or not cal(P)$ n'est donc pas une tautologie dans $cal(L)_3$.

Il n'est donc pas possible de raisonner par l'absurde dans $cal(L)_3$.
En effet, si on suppose que $not cal(P)$, et que l'on obtient une contradiction on ne peut pas en conclure que $cal(P)$ est vraie car elle peut également être indéterminée.

====
Le raisonnement par déduction dans $cal(L)_2$ repose sur le principe d'inférence (_modus ponens_) :

$(cal(P) and (cal(P) ==> cal(Q))) ==> cal(Q)$.
Vérifions si ce dernier est vérifié dans $cal(L)_3$.

#align(center)[
  #affiche-csv("tables/3b.csv")
]

On remarque que la colonne correspondant au principe d'inférence comporte un cas où il prend la valeur de vérité I, donc celui-ci n'est plus vérifié dans $cal(L)_3$.

====
Déterminons si l'énoncé $((cal(P) ==> cal(Q)) and (not cal(P) ==> cal(Q))) ==> cal(Q)$ est une tautologie dans $cal(L)_3$, à l'aide d'une table de vérité :

#align(center)[
  #affiche-csv("tables/3c.csv")
]

On remarque dans la table de vérité que la colonne correspondant à $((cal(P) ==> cal(Q)) and (not cal(P) ==> cal(Q))) ==> cal(Q)$ ne comporte pas que du V.
Par conséquent, $((cal(P) ==> cal(Q)) and (not cal(P) ==> cal(Q))) ==> cal(Q)$ n'est pas une tautologie dans $cal(L)_3$.

= Triangles magiques 


== Questions préliminaires 

===
La plus petite valeur pour leur somme est $6$ : 

On cherche un minorant de $S = a+b+c$ où $a,b,c$ sont trois entiers naturels distincts appartenant à ${1, dots ,9}$

On suppose par l'absurde qu'il existe trois entiers naturels distincts $a$, $b$, $c$ tels que
$S=a+b+c <= 5$

Comme $a,b,c$ sont trois entiers naturels *distincts*, les seules trois valeurs possibles sont $1,2,3$. On a donc nécessairement : 
$S=a+b+c>=1+2+3=6$
ce qui contredit $S<=5$

Ainsi $S>5$ Donc $6$ est minorant de l'ensemble des valeurs possibles de $S$

#underline[*Synthèse :*]


On vérifie maintenant que ce minorant est effectivement atteint. En prenant : 
$a=1,$   $b=2$,  $c=3$

On obtient : 
$S=1+2+3=6$

Donc 6 est le minimum de l'ensemble des valeurs possibles de $S$

===
La plus grande valeur pour leur somme est $24$ : 

On cherche un majorant de $S = a+b+c$ où $a,b,c$ sont trois entiers naturels distincts appartenant à ${1, dots ,9}$

On suppose par l'absurde qu'il existe trois entiers naturels distincts $a$, $b$, $c$ tels que
$S=a+b+c >= 25$

Comme $a,b,c$ sont trois entiers naturels *distincts*, les seules trois valeurs les plus grandes sont $7,8,9$. On a donc nécessairement : 
$S=a+b+c<=7+8+9=24$

Ce qui contredit $S>=25$

Donc $S < 25$
Ainsi $24$ est majorant de l'ensemble des valeurs possibles de $S$ 

#underline[*Synthèse :*]

On vérifie maintenant que ce majorant est effectivement atteint. En prenant : 

$a=7, b=8, c=9$

On obtient : 
$S=7+8+9=24$

Donc $24$ est le maximum de l'ensemble des valeurs possibles de $S$

== Les triangles magiques

===
Voici le triangle complété afin qu'il soit $20$-magique :

#triangle-magique(
  $2$, $9$, $4$,
  $5$, $6$, $1$,
  $8$, $3$, $7$
)

===
On considère un triangle $S$-magique dont les nombres numérotés dans le sens trigonométrique sont : $n_1, n_2, n_3, n_4, n_5, n_6, n_7, n_8, n_9$. Soit $T$ la somme des nombres placés sur ses trois sommets.

====
Montrons que $45 + T = 3S$ :

Nous avons $S = n_1 + n_2 + n_3 + n_4 = n_4 + n_5 + n_6 + n_7 = n_7 + n_8 + n_9 + n_1$.

Ainsi, $3S = n_1 + n_2 + n_3 + n_4 + n_5 + n_6 + n_7 + n_8 + n_9 + (n_1 + n_4 + n_7)$

Or, nous savons qu'on place tous les entiers entre $1$ et $9$ sur le triangle magique, donc $n_1 + n_2 + n_3 + n_4 + n_5 + n_6 + n_7 + n_8 + n_9 = (9(9 + 1))/2 = 45$. De plus, $n_1 + n_4 + n_7 = T$ par définition.

Donc, $3S = 45 + T$.

====
Montrons que $17 <= S <= 23$ :

D'après la *a)*, nous avons que $45 + T = 3S$. D'où $S = (45 + T)/3$.
Par définition, $T = n_1 + n_4 + n_7$. Les entiers placés sur le triangle sont tous distincts et compris entre $1$ et $9$ donc il en est de même pour $n_1, n_4$ et $n_7$.

Donc, d'après la *Partie A*, la somme de trois entiers tous distincts et compris entre $1$ et $9$ est comprise entre $6$ et $24$.

Donc $6 <= n_1 + n_4 + n_7 <= 24$, d'où $6 <= T <= 24$.
Donc $51 <= 45 + T <= 69$. Donc $51/3 = 17 <= (45 + T)/3 <= 23 = 69/3$.

Ainsi, $17 <= S <= 23$.

====
Voici la liste des couples $(S, T)$ possibles : $(17, 6), (18, 9), (19, 12), (20, 15), (21, 18), (22, 21), (23, 24)$.

===
Voici un triangle $17$-magique :

#triangle-magique(
  $1$, $9$, $4$,
  $3$, $7$, $5$,
  $2$, $6$, $8$
)

===
Montrons par l'absurde qu'il n'existe pas de triangle $18$-magique :

Supposons qu'il existe un triangle $18$-magique.
Soit $a, b, c$ les sommets du triangle.

Supposons par l'absurde que $9$ n'appartient à aucun des sommets du triangle. Alors il existe (quitte à renommer les sommets) un côté avec pour nombres $a, 9, x, b$ (pas forcément dans cet ordre là).
Donc $S = a + 9 + x + b$. Or, $S = 18$.

Donc $a + x + b = 9$.
Or, d'après la *2.c)*, $T = 9$. Donc $a + b + c = 9$.

Donc $a + x + b = a + b + c$. Donc $x = c$. Or, tous les nombres placés sur le triangle sont distincts. Contradiction !

Donc $9$ appartient à un des sommets du triangle. Quitte à renommer les sommets supposons que $a = 9$.

On a $T = a + b + c = 9$. Donc $9 + b + c = 9$. Donc $b + c = 0$.

Or tous les nombres placés sur le triangle sont strictement positifs. Contradiction !

Donc, il n'existe pas de triangle $18$-magique.


===

====
Montrons que s'il existe un triangle $19$-magique, alors $7$ est nécessairement situé sur un sommet du triangle.

Supposons qu'il existe un triangle $19$-magique.
Soit $a, b, c$ les sommets du triangle.

Supposons par l'absurde que $7$ n'appartient à aucun des sommets du triangle. Alors il existe (quitte à renommer les sommets) un côté avec pour nombres $a, 7, x, b$ (pas forcément dans cet ordre là).
Donc $S = a + 7 + x + b$. Or, $S = 19$.

Donc $a + x + b = 12$.
Or, d'après la *2.c)*, $T = 12$. Donc $a + b + c = 12$.

Donc $a + x + b = a + b + c$. Donc $x = c$. Or, tous les nombres placés sur le triangle sont distincts. Contradiction !

Donc dans un triangle $19$-magique, $7$ appartient nécessairement à un des sommets du triangle.

#pagebreak()

====
Voici un triangle $19$-magique :

#triangle-magique(
  $7$, $8$, $1$,
  $3$, $9$, $5$,
  $2$, $6$, $4$
)

===
Montrons que s'il existe un triangle $S$-magique alors il existe aussi un triangle $(40 - S)$-magique.

Supposons qu'il existe un triangle $S$-magique de la forme suivante :

#triangle-magique(
  $n_1$, $n_2$, $n_3$,
  $n_4$, $n_5$, $n_6$,
  $n_7$, $n_8$, $n_9$
)

On a donc $S = n_1 + n_2 + n_3 + n_4 = n_4 + n_5 + n_6 + n_7 = n_7 + n_8 + n_9 + n_1$

Montrons que le triangle suivant est $(40 - S)$-magique (et valide) :

#triangle-magique(
  $10 - n_1$, $10 - n_2$, $10 - n_3$,
  $10 - n_4$, $10 - n_5$, $10 - n_6$,
  $10 - n_7$, $10 - n_8$, $10 - n_9$
)

Tout d'abord calculons les sommes $S_1, S_2, S_3$ de chaque côté :

$S_1 = (10 - n_1) + (10 - n_2) + (10 - n_3) + (10 - n_4) = 40 - (n_1 + n_2 + n_3 + n_4) =^#text[déf] 40 - S$

$S_2 = (10 - n_4) + (10 - n_5) + (10 - n_6) + (10 - n_7) = 40 - (n_4 + n_5 + n_6 + n_7) =^#text[déf] 40 - S$

$S_3 = (10 - n_7) + (10 - n_8) + (10 - n_9) + (10 - n_1) = 40 - (n_7 + n_8 + n_9 + n_1) =^#text[déf] 40 - S$

Nous avons donc bien $S_1 = S_2 = S_3 = 40 - S$.

Donc le triangle est $(40 - S)$-magique.

Montrons maintenant que le triangle est valide :

Soit $i in ⟦1, 9⟧$.
Nous avons $1 <= n_i <= 9$

Donc $-1 >= -n_i >= -9$. Ainsi, $10 - 1 >= 10 - n_i >= 10 - 9$. Donc $1 <= 10 - n_i <= 9$.

Donc nous avons bien le fait que chaque nombre de notre nouveau triangle est bien compris entre $1$ et $9$.

De plus, chaque nombre est bien distinct, en effet :

Supposons qu'il existe deux indices $i$ et $j$ tels que $10 - n_i = 10 - n_j$. Alors $n_i = n_j$. Contradiction ! Tous les nombres de notre nouveau triangle sont bien distincts.

Nous avons donc réussi à construire un triangle $40 - S$-magique valide pour chaque triangle $S$-magique.
Il existe donc bien au moins un triangle $40 - S$-magique pour chaque triangle $S$-magique.

===
Récapitulons les résultats obtenus grâce à toutes les questions intermédiaires :

#table(
  columns: 3,
  rows: 7,
  stroke: 1pt,
  [$S$], [$T$], [triangle $S$-magique existant ?],
  [< 17], [], [Non ! cf *2.b)*],
  [17], [6], [Oui ! cf *3)*],
  [18], [9], [Non ! cf *4)*],
  [19], [12], [Oui ! cf *5.b)*],
  [20], [15], [Oui ! cf *1)*],
  [21], [18], [Oui ! Il existe un triangle $19$-magique et d'après la *6)* il existe aussi un triangle $21$-magique.],
  [22], [21], [Non ! Il n'existe pas de triangle $18$-magique et d'après la contraposée de la *6)* il n'existe pas de triangle $22$-magique.],
  [23], [24], [Oui ! Il existe un triangle $17$-magique et d'après la *6)* il existe aussi un triangle $23$-magique.],
  [> 23], [], [Non ! cf *2.b)*]
)

#align(center)[*Merci pour la lecture de ce devoir !*]

#align(center)[#align(bottom)[
L'ensemble de nos devoirs maison, fichiers pdf et codes seront disponibles sur : \ #link("https://github.com/andreim42/DMs-Maths-LLG")
]]

]