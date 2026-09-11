#import "../templates/dm.typ": dm, resultat

#dm(
  titre: "Équations fonctionnelles. Nombres échangeables",
  problems_name: "Exercice",
  numbers: true,
  auteurs: "BONNET Zéphyr, FERRAOUN Rayane, MELLIER Raphaël, MITROI Andrei",
  classe: $1^"ère"1$,
  numero: 2,
)[
  
= Équations fonctionnelles

==
On cherche À déterminer toutes les fonctions $g : NN -> NN$ telles que : \
$forall m, n in NN, g(m+n) = g(M) times g(n)$.

===
$italic("Analyse")$ : on suppose qu'il existe une telle fonction $g$. 
====
En choisissant $m=0$, on a $g(n) = g(0) times g(n)$
donc $g(0) = 1 or g(n)=1$.

En choisissant $m=n$, on a $g(2n) = 2g(n)$, donc si $n = 0, g(0)=0$.

Donc $g(0) = 0 or g(0) = 1$ 

====
Soit $n in NN$

Supposons que $g(0) = 0$ et montrons que g est la fonction nulle par récurrence.

*Initialisation*: 

Pour $n=0, g(n)=g(0)=0$

*Hérédité*:

Soit $n in NN$.

Supposons $g(n)=0$ et montrons que $g(n+1)=0$

$g(n+1)$ peut s'écrire sous la forme $g(n) times g(1)$.

$1$ peut se décomposer en $1+0$, donc $g(1)=g(1+0)=g(1) times g(0)$

Or, $g(0)=0$, donc $g(1)=g(1) times 0=0$

Donc $g(n+1)=g(n) times 0 = 0$

Donc $forall n in NN, g(n)=0$

Donc $g$ est la fonction nulle.

====
Montrons que $forall n in NN, g(0)=1 ==> g(n)=a^n #text("où") a=g(1)$ par récurrence.

*Initialisation*

Pour $n=0, g(n) = g(0) = 1 = a^0$ où $a=g(1)$

*Hérédité*

Soit $n in NN$.

Supposons que $g(n) = a^n #text("où") a = g(1)$

Montrons que $g(n+1) = a^(n+1) #text("où") a = g(1)$

$
g(n+1)& = g(n) times g(1)\
&=a^n times g(1) #text("où") a=g(1)\
&=g(1)^n times g(1)\
&=g(1)^(n+1)\
&=a^(n+1) #text("où") a=g(1)
$

Donc $forall n in NN, g(n) = a^n, #text("où") a=g(1)$

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

===
$italic("Analyse")$ : on suppose qu'il existe une telle fonction $g$. 

====
En choisissant $m=0$, on a $g(n) = g(0) times g(n)$
donc $g(0) = 1 or g(n)=1$.

En choisissant $m=n$, on a $g(2n) = 2g(n)$, donc si $n = 0, g(0)=0$.

Donc $g(0) = 0 or g(0) = 1$ 

====
Soit $m in NN$

Supposons que $g(0) = 0$ et montrons que g est la fonction nulle par récurrence.

*Initialisation*: 

$m=0 ==> g(m)=g(0)=0$

*Hérédité*:

Soit $n in NN$.

Supposons $g(n)=0$ et montrons que $g(n+1)=0$.

$g(n+1)$ peut s'écrire sous la forme $g(n) times g(1)$.

$1$ peut se décomposer en $1+0$, donc $g(1)=g(1+0)=g(1) times g(0)$.

Or, $g(0)=0$, donc $g(1)=g(1) times 0=0$.

Donc $g(n+1)=g(n) times 0 = 0$.

Donc $forall n in NN, g(n)=0$.

Donc $g$ est la fonction nulle.

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

]