#import "../templates/dm.typ": dm, resultat

#dm(
  titre: "Équations fonctionnelles. Nombres échangeables",
  problems_name: "Exercice",
  numbers: true,
  auteurs: "BONNET Zéphyr, FERRAOUN Rayane, MELLIER Raphaël, MITROI Andrei",
  classe: $1^"ère"1$,
  numero: 2,
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

= Équations fonctionnelles

==
On cherche À déterminer toutes les fonctions $g : NN -> NN$ telles que : \
$forall m, n in NN, g(m+n) = g(M) times g(n)$.

===
$italic("Analyse")$ : on suppose qu'il existe une telle fonction $g$. 
====
Soit $m,n in NN$.

En choisissant $m=0$, on a $g(n) = g(0) times g(n)$
donc $g(0) = 1 or g(n)=1$.

En choisissant $m=n$, on a $g(2n) = 2g(n)$, donc si $n = 0, g(0)=0$.

Donc $g(0) = 0 or g(0) = 1$ 

====

====

=== 
$italic("Synthese:")$ \



==
On cherche à déterminer toutes les fonctions $f : NN -> NN$ telles que :\
  $circle.filled.small f(1) = 1$\
  $circle.filled.small forall m, n in NN, f(m+n)=f(m) times f(n) + f(n) + f(m)$.
===
$italic("Analyse")$: On suppose qu'une telle fonction $f$ existe.

====

====

====

====

====

===
$italic("Synthese:")$ \

= Nombres échangeables 
Pour tous réels $a$ et $b$ on considère la fonction $f$ définie par:

$ forall x in [-b, +infinity[, f_(a,b)(x)=a-sqrt(x+b) $

On dira que deux réels $x$ et $y$ sont interchangeables si :

$ exists a, b in RR, f_(a,b)(x) and f_(a,b)(y)=x $

===

]    node-inset: 6pt,
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

= Équations fonctionnelles

==
On cherche À déterminer toutes les fonctions $g : NN -> NN$ telles que : \
$forall m, n in NN, g(m+n) = g(M) times g(n)$.

===
$italic("Analyse")$ : on suppose qu'il existe une telle fonction $g$. 
====

====

====

=== 
$italic("Synthese:")$ \



==
On cherche à déterminer toutes les fonctions $f : NN -> NN$ telles que :\
  $circle.filled.small f(1) = 1$\
  $circle.filled.small forall m, n in NN, f(m+n)=f(m) times f(n) + f(n) + f(m)$.
===
$italic("Analyse")$: On suppose qu'une telle fonction $f$ existe.

====

====

====

====

====

===
$italic("Synthese:")$ \

]
