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

= Logique de Łukasiewicz

===
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
Montrons la commutativité et l'associativité du "et" dans $cal(L)_3$.

- Montrons que $(cal(P) and cal(Q)) <==> (cal(Q) and cal(P))$ :

$
(cal(P) and cal(Q)) &<==> not(not cal(P) or not cal(Q)) #h(2em) &#text[d'après la *c)*] \
&<==> not(not cal(Q) or not cal(P)) &#text[d'après la *a)*] \
&<==> (cal(Q) and cal(P))
$

Donc les assertions $cal(P) and cal(Q)$ et $cal(Q) and cal(P)$ sont bien équivalentes.

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
Montrons que $not(cal(P)) or cal(Q)$ est équivalente à $cal(P) => cal(Q)$ grace à leurs tables de vérités.

/*Générer et mettre ici le tableau de vérité 2a
Python:

from engine.constructor import construct_table
from logics import Logic3

variables = ["P", "Q"]

assertions = [
    (lambda P:(~P), "not(P)"),
    (lambda P, Q:(~P) | Q , "not(P) or Q"),
    (lambda P, Q:P >> Q, "P => Q"),
]

construct_table(Logic2, variables, assertions, "2a.csv")

*/

Les colonnes $not(cal(P)) or cal(Q)$ et $cal(P) => cal(Q)$ sont identiques donc les deux assetions sont bien équivalentes.

====
Montrons que $cal(P) ==> cal(Q)$ est équivalente à $not(cal(Q)) => not(cal(P))$ grace à leurs tables de vérités.

/*Générer et mettre ici le tableau de vérité 2b
Python:

from engine.constructor import construct_table
from logics import Logic3

variables = ["P", "Q"]

assertions = [
    (lambda P:(~P), "not(P)"),
    (lambda Q:(~Q), "not(Q)"),
    (lambda P, Q:P >> Q, "P => Q"),
    (lambda P, Q:~Q >> ~P, "not(Q) => not(P)"),

]

construct_table(Logic2, variables, assertions, "2b.csv")
*/

Les colonnes $cal(P) ==> cal(Q)$ et $not(cal(Q)) ==> not(cal(P))$ sont identiques donc les deux assetions sont bien équivalentes.

====

= Triangles magiques

== Questions préliminaires

===

== Les triangles magiques

]
