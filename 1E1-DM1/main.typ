#import "../templates/dm.typ": dm, affiche-csv, traite-cellule, triangle-magique

#dm(
  titre: "Logique. Triangles magiques",
  problems_name: "Problème",
  numbers: true,
  auteurs: "BONNET Zéphyr, FERRAOUN Rayane, MELLIER Raphaël, MITROI Andrei",
  classe: $1^"ère"1$,
  numero: 1,
)[


= Logique de Łukasiewicz

===
Soient $cal(P), cal(Q), cal(R)$ des assertions.

====
Montrons que $(cal(P) and cal(Q)) <==> (cal(Q) and cal(P))$ à l'aide de leurs tables de vérité #footnote[Toutes les tables de vérité de ce devoir ont été générés automatiquement par un module python réalisé par nos soins : #link("https://github.com/andreim42/truth-table-builder/")] :

#align(center)[
  #affiche-csv("1E1-DM1/tables/1a.csv")
]

Les deux colonnes $(cal(P) and cal(Q))$ et $(cal(Q) and cal(P))$ sont identiques donc les deux assertions sont équivalentes.

====
Montrons que les assertions $((cal(P) and cal(Q)) and cal(R)) <==> (cal(P) and (cal(Q) and cal(R)))$ à l'aide de leurs tables de vérité :

#align(center)[
  #affiche-csv("1E1-DM1/tables/1b.csv")
]

Les deux colonnes $((cal(P) and cal(Q)) and cal(R))$ et $(cal(P) and (cal(Q) and cal(R)))$ sont identiques donc les deux assertions sont équivalentes.

====
Montrons les deux lois de De Morgan.

Montrons que $not(cal(P) or cal(Q)) <==> (not cal(P) and not cal(Q))$ et $not(cal(P) and cal(Q)) <==> (not cal(P) or not cal(Q))$ à l'aide de leurs tables de vérité :

#align(center)[
  #grid(
    columns: 2, gutter: 2em
  )[
    #affiche-csv("1E1-DM1/tables/1c1.csv")
  ][
    #affiche-csv("1E1-DM1/tables/1c2.csv")
  ]
]

Les deux colonnes $not(cal(P) or cal(Q))$ et $not cal(P) and not cal(Q)$ de la première table sont identiques donc les deux assertions sont équivalentes.
De plus, les deux colonnes $not(cal(P) and cal(Q))$ et $not cal(P) or not cal(Q)$ de la seconde table sont identiques donc les deux assertions sont équivalentes.

Ainsi, les lois de De Morgan restent vérifiées dans $cal(L)_3$.

====
Montrons la commutativité et l'associativité du "et" dans $cal(L)_3$.

- Montrons que $(cal(P) and cal(Q)) <==> (cal(Q) and cal(P))$ :

$
(cal(P) and cal(Q)) &<==> not(not cal(P) or not cal(Q)) #h(2em) &#text[d'après la *c)*] \
&<==> not(not cal(Q) or not cal(P)) &#text[d'après la *a)*] \
&<==> (cal(Q) and cal(P))
$

Donc les assertions $cal(P) and cal(Q)$ et $cal(Q) and cal(P)$ sont bien équivalentes.

\
/*Pour que le deuxieme point soit à la page suivante.*/
\
\
\
\

- Montrons que $((cal(P) and cal(Q)) and cal(R)) <==> (cal(P) and (cal(Q) and cal(R)))$ :

$
((cal(P) and cal(Q)) and cal(R)) &<==> not(not(cal(P) and cal(Q)) or not cal(R)) #h(2em) &#text[d'après la *c)*] \
&<==> not((not cal(P) or not cal(Q)) or not cal(R)) \
&<==> not(not cal(P) or (not cal(Q) or not cal(R))) &#text[d'après la *a)*] \
&<==> not(not cal(P) or (cal(Q) and cal(R))) \
&<==> cal(P) and (cal(Q) and cal(R)) \
$

Donc les assertions $((cal(P) and cal(Q)) and cal(R))$ et $(cal(P) and (cal(Q) and cal(R)))$ sont bien équivalentes.

===
Soient $cal(P), cal(Q), cal(R)$ des assertions.

====
Montrons que $not cal(P) or cal(Q)$ est équivalente à $cal(P) => cal(Q)$ grâce à leurs tables de vérités.

#align(center)[
  #affiche-csv("1E1-DM1/tables/2a.csv")
]

Les colonnes $not cal(P) or cal(Q)$ et $cal(P) => cal(Q)$ ne sont pas identiques donc les deux assertions ne sont sont pas équivalentes.

====
Montrons que $cal(P) ==> cal(Q)$ est équivalente à $not cal(Q) => not cal(P)$ grâce à leurs tables de vérités.

#align(center)[
  #affiche-csv("1E1-DM1/tables/2b.csv")
]

Les colonnes $cal(P) ==> cal(Q)$ et $not cal(Q) ==> not cal(P)$ sont identiques donc les deux assertions sont bien équivalentes. La méthode de démonstration par contraposition est donc utilisable dans $cal(L)_3$

==== 
/*Rédiger la transitivité de =>
#align(center)[
  #affiche-csv("tables/2c.csv")
]*/

===
Soient $cal(P), cal(Q)$ des assertions.

====
Cherchons si $cal(p) or not cal(P)$ est une tautologie dans $cal(L)_3$ avec le tableau de vérité.
/*
#align(center)[
  #affiche-csv("tables/3a.csv")
]
*/
\
La colonne $cal(P) or not cal(P)$ ne contient pas que des "V", donc ce n'est pas une tautologie dans $cal(L)_3$.

= Triangles magiques 


== Questions préliminaires 
=== La plus petite valeur pour leur somme est 6 : 

On cherche un minorant de $S = a+b+c$ où $a,b,c$ sont trois entiers naturels distincts appartenant à {1,...,9}

On suppose par l'absurde qu'il existe trois entiers naturels distincts $a$, $b$, $c$ tels que
$S=a+b+c <= 5$

Comme $a,b,c$ sont trois entiers naturels #strong[distincts], les seules trois valeurs possibles sont $1,2,3$. On a donc nécessairement : 
$S=a+b+c>=1+2+3=6$
ce qui contredit $S<=5$

Ainsi $S>5$

Donc 6 est minorant de l'ensemble des valeurs possibles de $S$

#strong[Synthèse :]


On vérifie maintenant que ce minorant est effectivement atteint. En prenant : 

$a=1,$   $b=2$,  $c=3$

On obtient : 
$S=1+2+3=6$

On a donc $min(S)=6$

 === La plus grande valeur pour leur somme est 24 : 

On cherche un minorant de $S = a+b+c$ où $a,b,c$ sont trois entiers naturels distincts appartenant à {1,...,9}

On suppose par l'absurde qu'il existe trois entiers naturels distincts $a$, $b$, $c$ tels que
$S=a+b+c >= 25$

Comme $a,b,c$ sont trois entiers naturels #strong[distincts], les seules trois valeurs les plus grandes sont $7,8, 9$. On a donc nécessairement : 
$S=a+b+c<=7+8+9=24$

Ce qui contredit $S>=25$

Donc S < 25
Ainsi 24 est majorant de l'ensemble des valeurs possibles de $S$ 

#strong[Synthèse :]

On vérifie maintenant que ce majorant est effectivement atteint. En prenant : 

$a=7,$   $b=8$,  $c=9$

On obtient : 
$S=7+8+9=24$

On a donc $max(S)=24$

== Les triangles magiques

===
Voici le triangle complété afin qu'il soit $20$-magique :

#triangle-magique(
  $2$, $9$, $4$,
  $5$, $6$, $1$,
  $8$, $3$, $7$
)

===
On considère un triangle $S$-magique. Soit $T$ la somme des nombres placés sur ses trois sommets.

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
Montrons qu'il n'existe pas de triangle $18$-magique :



===

====

====
Voici un triangle $19$-magique :

#triangle-magique(
  $7$, $8$, $1$,
  $3$, $9$, $5$,
  $2$, $6$, $4$
)

]
