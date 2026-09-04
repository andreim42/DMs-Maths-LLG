#import "../templates/dm.typ": dm

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

==
Soient $cal(P), cal(Q), cal(R)$ des assertions.

===
Nous montrons que $(cal(P) and cal(Q)) <==> (cal(Q) and cal(P))$ en comparant leurs tables de vérité.

#align(center)[
  #affiche-csv("tables/1a.csv")
]

Nous avons bien $(cal(P) and cal(Q)) <==> (cal(Q) and cal(P))$, en effet : les deux dernières colonnes ont les mêmes valeurs de verité.

===

Nous montrons que $((cal(P) and cal(Q)) and cal(R)) <=> (cal(P) and (cal(Q) and cal(R)))$ en comparant leurs tables de vérité.

#align(center)[
  #affiche-csv("tables/1b.csv")
]

Nous avons bien $((cal(P) and cal(Q)) and cal(R)) <=> (cal(P) and (cal(Q) and cal(R)))$, en effet : les deux dernières colonnes ont les mêmes valeurs de verité.

===
Nous montrons séparément les deux lois de De Morgan.

- Démontrons que

]