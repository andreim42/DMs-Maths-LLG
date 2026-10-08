#import "../templates/dm.typ": dm, olympiades, code, affiche-csv, etapes-algo

#dm(
  titre: "Nombres heureux",
  problems_name: "Problème",
  numbers: true,
  auteurs: "BONNET Zéphyr, FERRAOUN Rayane, MELLIER Raphaël, MITROI Andrei",
  classe: $1^"ère"1$,
  numero: 6,
)[

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

En exécutant le code python, on a bien `karma(157) = 75`, `karma(75) = 74` et `karma(74) = 65`. Donc on a bien $157 -> 75$, $75 -> 74$ et $74 -> 65$.

===
L'algorithme calcule la somme des carrés des chiffres qui composent le nombre qui lui est donné.

=== 
====
Même sans calculer les images de $157, 175, 517, 715$ et $751$ nous pouvons dire que ce sont les mêmes, car ils sont composés des trois mêmes chiffres.

====
Montrons que $forall p in NN^*$, on peut trouver au moins un antécédent à $p$ par récurrence.\
Soit $p in NN^*$\
_Initialisation_:\
Pour $p=1$, on a $1^2=1$
Donc $1$ a un antécédent.

- #underline[Hérédité] :
Supposons que $p$ a un antécédent $a$ et montrons que $p+1$ en a un aussi.\
$p=$ karma$(a)$\
Donc $p=a_1^2+a_2^2+a_3^2+...+a_n^2$ avec $a=a_1a_2a_3...a_n$\
Donc $p+1=a_1^2+a_2^2+a_3^2+...+a_n^2+1$\
Donc $p+1=a_1^2+a_2^2+a_3^2+...+a_n^2+a'_(n+1)^2$ avec $a'_(n+1)=1$\
Donc $p+1=$ karma$(a')$ avec $a'=a_1a_2a_3...a_n a'_(n+1)$\

Donc tout $p in NN^*$ admet un antécédent.\

Montrons à présent que si $p$ admet un antécédent, alors il en admet une infinité.\
$p=$ karma$(a)$\
Donc $p=a_1^2+a_2^2+a_3^2+...+a_n^2$ avec $a=a_1a_2a_3...a_n$\
Donc $p=a_1^2+a_2^2+a_3^2+...+a_n^2+0^2$\
Donc $p=a'_1^2+a'_2^2+a'_3^2+...+a'_n^2+a'_(n+1)^2$ avec 
$forall i in [|1, n|], a_i=a'_i and a'_(n+1)=0$\
Donc $forall p in NN, exists a, a' in NN, p=$ karma$(a')=$ karma$(a)$ et $a!=a'$\

- #underline[Conclusion] : Donc $forall p in NN^*,p$ admet une infinité d'antécédents, par principe de récurrence.

====
_$157  = 2^2+5^2+8^2+8^2$_

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

Ainsi, $P("\"Obtenir un nombre heureux inférieur à 100\"") = 19/100$.

== Trajectoires des nombres à $n$ chiffres.

=== Nombres à $3$ chiffres.

==== 
On sait que l’algorithme renvoie la somme des carrés des chiffres qui composent le nombre qu'on lui donne. Par conséquent, la valeur maximale pour un nombre à trois chiffres est celle renvoyée par le nombre à trois chiffres dont la somme des chiffres est la plus grande, soit 999 : $9^2+9^2+9^2 = 243$.\
Or $N<=999$ donc l'image de N est inférieure ou égale à 243.\
Donc 243 majore l'image de N.\
\
Par ailleurs, le nombre inférieur à 243 dont la somme des chiffres est la plus grande est 199.\
Or, l'image de N est inférieure à 243 et $1^2+9^2+9^2 = 163$\
Donc l'image de l'image de N est majorée par 163.

====
Soit $N$ un nombre à $3$ chiffres. Soit $N'$ l'image de $N'$ par l'algorithme et $N''$ l'image de l'image de $N$ par l'algorithme.

On a montré précémment que $N''$ est majoré par $163$.

=== Nombres à $n$ chiffres.

====
Soit n appartenant à $NN$ tel que $n>=4$. On pose $Q(n)$ l'assertion : "$n times 9^2 <= 10^(n-1)-1$".\
Initialisation : Prenons n = 4.\
On a $4 times 9^2 = 324 <= 10^(4-1)-1 = 999$. \
Donc $Q(4)$ est vérifiée.\

Hérédité : Soit $n in NN, n>=4$. Supposons que $Q(n)$ est vraie.\ Montrons que $Q(n+1)$ est vraie.\
On a $0 <= n times 9^2 <= 10^(n-1)-1$ et on sait que $forall a in ⟦9, +infinity⟧, 0 <= a + 9^2 <= a times 10$    A JUSTIFIER MIEUX ANDREI #emoji.hands.folded\
D'où $(n+1) times 9^2 <= 10^n-10 <= 10^n-1$

Donc $Q(n+1)$ est vraie.

====
Montrons que nous avons $forall n >= 4, ==> cal(P)(n)$ par récurrence.

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

Voici un algorithme qui renvoie tous les nombres heureux en dessous de $10space 000$:
[NOTE : faire une légère variation]
#align(center)[
  #code("1E1-DM6/probabilite.py")
]

On obtient ainsi $1 space 442$.\
La probabilité de choisir un nombre heureux en dessous de $10space 000$ est de $1442/10000 = 14,42%$.

#page(flipped: true, margin: 0.5cm)[
  #align(center + horizon)[
    #figure(
      image(
        "trajectoires.svg", 
        width: 100%,
        fit: "contain",
      ),
      caption: [Graphe fonctionnel de l'algorithme pour 300 premiers entiers \ (on remarque bien qu'il n'existe pas de noeud de degré sortant $0$ hormis pour le puits $1$)]
    )
  ]

  #v(2%)

  #align(center + bottom)[*Merci pour la lecture de ce devoir !*]

  #align(center + bottom)[_Andrei_ : on veut $+$ de DM d'algorithmique Madame svp #emoji.hands.folded #emoji.hands.folded]

  #align(center + bottom)[
  L'ensemble de nos devoirs maison, fichiers PDF et codes sont disponibles sur : \ #link("https://github.com/andreim42/DMs-Maths-LLG")
  ]

  #v(3%)
]

]