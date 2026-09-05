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

= Triangles magiques

== Questions préliminaires

===

== Les triangles magiques

]