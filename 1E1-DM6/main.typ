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

En exécutant le code python, on a `karma(157) = 75`, `karma(75) = 74` et `karma(74) = 65`.
Donc, on a bien $157 -> 75$, $75 -> 74$ et $74 -> 65$.

===
L'algorithme calcule la somme des carrés des chiffres qui composent le nombre qui lui est donné.

=== 
====
Même sans calculer les images de $157, 175, 517, 715$ et $751$, nous remarquons qu'ils sont tous composés exactement des mêmes chiffres, donc leurs images sont les mêmes.

====
Soit $p in NN^*$. Soit $a = underbrace(11 dots 1, p "fois")$. Montrons que $a$ est un antécédent de $p$.

On a ainsi $a arrow underbrace(1^2 + 1^2 + dots + 1^2, p "fois") = p$.
Donc $p$ admet au moins un antécédent qui est $a$.

Montrons à présent qu'on peut construire une infinité d'antécédents de $p$. Soit $n in NN^*$.

Soit $a_n = a + underbrace(00 dots 0, n "fois")$. Ainsi, $a_n arrow p + underbrace(0^2 + 0^2 + dots + 0^2, n "fois") = p$.
On a ainsi construit un antécédent valide de $p$ pour tout $n in NN^*$. $NN^*$ n'est pas fini, donc $p$ admet une infinité d'antécédents.

====
Raisonnons par l'absurde pour montrer que $157$ ne peut pas avoir d'antécédent à $3$ chiffres.

Supposons qu'il existe un antécédent à trois chiffres, que l'on note $a, b, c in ⟦0, 9⟧$.

Ainsi, $a b c arrow 157$, on a donc : $a^2 + b^2 + c^2 = 157$.

Supposons spdg que $a >= b >= c$ (l'image de l'algorithme ne varie pas en fonction de l'ordre des chiffres).

Raisonnons par l'absurde pour montrer que $a <= 7$ est impossible.
Supposons que $a <= 7$. Alors $b, c <= 7$.
Ainsi, on a : $a^2 + b^2 + c^2 <= 7^2 + 7^2 + 7^2 = 147$. Contradiction ! $147 < 157$

On en déduit donc que $a >= 8$.
Testons tous les sous-cas possibles pour $b$ sachant que $b <= a$ et $c <= b$ (et $a >= 8$) :

#align(center)[
  #table(
    columns: (auto, auto, auto, auto, auto),
    align: center,
    [*$a$*], [*$b$*], [*$a^2+b^2$*], [*$c^2 = 157 - (a^2+b^2)$*], [*$c$*],
    [$9$], [$9$], [$162$], [$-5$], [Impossible ($c^2 >= 0$)],
    [$9$], [$8$], [$145$], [$12$], [Impossible ($3^2 < 12 < 4^2$)],
    [$9$], [$7$], [$130$], [$27$], [Impossible ($5^2 < 27 < 6^2$)],
    [$9$], [$b <= 6$], [$<= 117$], [$>= 40$], [Impossible ($c^2 <= b^2 <= 36$)],
    [$8$], [$8$], [$128$], [$29$], [Impossible ($5^2 < 29 < 6^2$)],
    [$8$], [$7$], [$113$], [$44$], [Impossible ($6^2 < 44 < 7^2$)],
    [$8$], [$b <= 6$], [$<= 100$], [$>= 57$], [Impossible ($c^2 <= b^2 <= 36$)]
  )
]

Contradiction ! Tous les sous-cas ne fonctionnent pas. Le nombre 157 ne possède donc aucun antécédent à trois chiffres.

Voici un nombre à $4$ chiffres qui est un antécédent de $157$ : $2588 arrow 2^2+5^2+8^2+8^2 = 157$

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

On observe bien qu'il n'existe aucun nombre inférieur à $100$ qui ne soit ni malheureux ni heureux, sauf pour le nombre $0$ qui a son propre cycle et composante connexe de taille $1$.

===
D'après la *1.B.1)*, on voit qu'il y a $19$ nombres heureux strictement inférieurs à $100$. $100$ est aussi un nombre heureux d'après la trajectoire de la *Partie B)*.

Ainsi, $P("\"Obtenir un nombre heureux inférieur à 100\"") = 20/100 = 1/5$.

== Trajectoires des nombres à $n$ chiffres.

=== Nombres à $3$ chiffres.

==== 
On sait que l’algorithme renvoie la somme des carrés des chiffres qui composent le nombre qu'on lui donne. Par conséquent, la valeur maximale pour un nombre à trois chiffres est celle renvoyée par le nombre à trois chiffres dont la somme des carrés des chiffres est la plus grande, soit 999 : $9^2+9^2+9^2 = 243$.

Or $N<=999$ donc l'image de N est inférieure ou égale à 243.
Donc 243 majore l'image de N.

Par ailleurs, le nombre (à $3$ chiffres) inférieur à 243 dont la somme des carrés des chiffres est la plus grande est 199.
Or, l'image de N est inférieure à 243 et $1^2+9^2+9^2 = 163$
Donc l'image de l'image de N est majorée par 163.

====
Soit $N$ un nombre à $3$ chiffres. Soit $N'$ l'image de $N$ par l'algorithme et $N''$ l'image de l'image de $N$ par l'algorithme.

On a montré précémment que $N''$ est majoré par $163$.
Le nombre #footnote[On choisira pour la suite uniquement les nombres *à $3$ chiffres* maximisant l'image. Dans le cas contraire, le nombre aurait $1$ ou $2$ chiffres et nous avons déjà montré que $cal(P)(1)$ et $cal(P)(2)$ sont vraies dans la *Partie B)*] inférieur à $163$ dont la somme des carrés des chiffres est la plus grande est $159$. Donc l'image de $N''$ est majorée par $107$ car $159 arrow 1^2 + 5^2 + 9^2 = 107$.

Le nombre inférieur à $107$ dont la somme des carrés des chiffres est la plus grande est $107$. Donc l'image de l'image de $N''$ est majorée par $50$ car $107 arrow 1^2 + 0^2 + 7^2 = 50$.

On remarque ainsi que peu importe le nombre à $3$ chiffres choisis à l'origine, on arrive à un nombre à $2$ chiffres. Or, on a montré que $cal(P)(2)$ est vraie dans la *Partie B)*. Donc $cal(P)(3)$ est vraie.

=== Nombres à $n$ chiffres.

====
On note pour $n >= 4$, $cal(Q)(n)$ l'assertion : "$n times 9^2 <= 10^(n-1)-1$".

- #underline[Initialisation] : Pour n = 4 : On a $4 times 9^2 = 324 <= 10^(4-1)-1 = 999$. Donc $cal(Q)(4)$ est vérifiée.

- #underline[Hérédité] : Soit $n in NN, n>=4$. Supposons que $cal(Q)(n)$ est vraie. Montrons que $cal(Q)(n+1)$ est vraie.

On a $(n+1) times 9^2 = n times 9^2 + 81$.
Par hypothèse de récurrence, on sait que $n times 9^2 <= 10^(n-1)-1$.

Ainsi, on obtient :
$(n+1) times 9^2 <= 10^(n-1) - 1 + 81$.
Donc,
$(n+1) times 9^2 <= 10^(n-1) + 80$

Calculons la différence :
$(10^n - 1) - (10^(n-1) + 80) = 10^n - 10^(n-1) - 81 = 10^(n-1)times(10 - 1) - 81 = 9 times 10^(n-1) - 81$.

Or, on a $n-1 >= 3$, donc $10^(n-1) >= 1000$.
Ainsi, $9 times 10^(n-1) - 81 >= 9000 - 81 > 0$.
On en déduit que $10^(n-1) + 80 <= 10^n - 1$.
Par transitivité, on a donc bien $(n+1) times 9^2 <= 10^n - 1$.
Donc $cal(Q)(n+1)$ est vraie.

- #underline[Conclusion] : Donc $forall n >= 4$ on a l'inégalité $n times 9^2 <= 10^(n - 1) - 1$.

====
Montrons que nous avons $forall n >= 4, cal(P)(n)$ par récurrence.

- #underline[Initialisation] : Pour $n = 4$, on note $x$ un nombre à $4$ chiffres.

On remarque que la somme des carrés de ses chiffres, notée $S_2$, vérifie $1^2 + 0^2 + 0^2 + 0^2 <= S_2 <= 9^2 + 9^2 + 9^2 + 9^2$.
Donc $1 <= S_2 <= 4 times 9^2$. Or, d'après la *2.a)*, on a $4 times 9^2 <= 10^3 - 1 = 999$. D'où $1 <= S_2 <= 999$.

Or, $S_2$ est l'image de $x$ et nous venons de montrer que $S_2$ a au plus $3$ chiffres. D'après la *Partie B*, $cal(P)(1)$, $cal(P)(2)$ et $cal(P)(3)$ sont vraies. Donc $S_2$ finit bien par échouer dans le puits $1$ ou dans le cycle $cal(C)$. Donc $cal(P)(4)$ est vraie.

- #underline[Hérédité] : Soit $n in NN^*$. Supposons que $cal(P)(k)$ soit vraie pour tout entier $k in ⟦4, n⟧$.
Montrons que $cal(P)(n + 1)$ est vraie

Soit $x$ un nombre à $n + 1$ chiffres.

On remarque que la somme des carrés de ses chiffres, notée $S_2$, vérifie $underbrace(1^2 + 0^2 + dots + 0^2, n + 1 "fois") <= S_2 <= underbrace(9^2 + dots + 9^2, n + 1 "fois")$.

Donc $1 <= S_2 <= (n + 1) times 9^2$. Or, d'après la *2.a)*, on a $(n + 1) times 9^2 <= 10^n - 1 = underbrace(99 dots 9, n "chiffres")$.

D'où $1 <= S_2 <= underbrace(99 dots 9, n "chiffres")$.

Or, $S_2$ est l'image de $x$ et nous venons de montrer que $S_2$ a au plus $n$ chiffres. Par l'hypothèse de récurrence $cal(P)(k)$ est vraie pour tout $k in ⟦4, n⟧$.

Ainsi, si $n >= 4$, $cal(P)(n)$ est vraie par hypothèse de récurrence et si $n < 4$, alors $cal(P)(n)$ est vraie d'après la *Partie B)* où nous avons montré que $cal(P)(1), cal(P)(2)$ et $cal(P)(3)$ sont vraies.

Donc $S_2$ finit bien par échouer dans le puits $1$ ou dans le cycle $cal(C)$. Donc $cal(P)(n + 1)$ est vraie.

- #underline[Conclusion] : Nous avons ainsi $forall n >= 4, cal(P)(n)$ par principe de récurrence.

Nous avons montré précédemment que $cal(P)(1), cal(P)(2)$ et $cal(P)(3)$ sont vraies.

Donc $forall n in NN^*, cal(P)(n)$.

=== Probabilité.

Voici un algorithme qui renvoie tous les nombres heureux en dessous de $10 space 000$ :

#align(center)[
  #code("1E1-DM6/probabilite.py")
]

On obtient ainsi $0.1442$.\
La probabilité de choisir un nombre heureux inférieur à $10 space 000$ est de $14.42%$.

#page(flipped: true, margin: 0.5cm)[
  #align(center + horizon)[
    #figure(
      image(
        "trajectoires.svg", 
        width: 100%,
        fit: "contain",
      ),
      caption: [Graphe fonctionnel de l'algorithme pour les 300 premiers entiers \ (on remarque bien qu'il n'existe pas de noeud de degré sortant vers un noeud différent nul hormis pour le puits $1$)]
    )
  ]

  #v(2%)

  #align(center + bottom)[*Merci pour la lecture de ce devoir !*]

  #align(center + bottom)[_Andrei_ : on veut $+$ de DM d'algorithmique Madame svp #emoji.hands.folded#emoji.hands.folded]

  #align(center + bottom)[
  L'ensemble de nos devoirs maison, fichiers PDF et codes sont disponibles sur : \ #link("https://github.com/andreim42/DMs-Maths-LLG")
  ]

  #v(3%)
]

]