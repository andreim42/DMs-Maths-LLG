#import "../templates/dm.typ": dm

#dm(
  titre: "Méthode de Cardan",
  problems_name: "Problème",
  numbers: true,
  auteurs: "BONNET Zéphyr, FERRAOUN Rayane, MELLIER Raphaël, MITROI Andrei",
  classe: $1^"ère"1$,
  numero: 7,
)[

=

== Méthode de Cardan

Soient $a, b, c in RR$.

=== Réduction du problème (transformation de #smallcaps[Tchirnhauss]).

Soit $x in RR$.
On pose $X = x + a/3, p = b - a^2/3 "et" q=c+(2a^3)/27-(a b)/3$. On obtient donc,

$
X^3 + p X + q = 0 &<==> (x + a/3)^3 + p(x + a/3) + q = 0 \
&<==> x^3 + 3x^2 a/3 + 3a^2/9 x + a^3/27 + p x + p a/3 + q = 0 \
&<==> x^3 + a x^2 + (a^2/3 + p)x + a^3/27 + p a/3 + q = 0 \
&<==> x^3 + a x^2 + (a^2/3+b-a^2/3)x + a^3/27 + a/3(b-a^2/3)+c+(2a^3)/27 - (a b)/3 = 0 \ 
&<==> x^3 + a x^2 + b x + a^3/27+(a b)/3-(3a^3)/27+(2a^3)/27-(a b)/3+c = 0 \
&<==> x^3 + a x^2 + b x + c = 0
$

On peut donc bien se ramener à l'équation $(E_1)$ à partir de l'équation $(E_0)$ en suivant les équivalences dans le sens inverse avec le changement de variable effectué.

===
Soient $u, v in RR$ tels que $X=u+v$.

====
On a donc:\
$
X^3 + p X + q = 0&<==> (u+v)^3 + p(u+v) + q=0 \
&<==> u^3 + 3u^2v + 3u v^2 + v^3 + p(u+v) + q = 0 \
&<==> u^3 + v^3 + 3u v(u+v) + p(u+v) + q = 0 \
&<==> u^3 + v^3 + (u+v)(3u v+p) + q = 0 \
$

====
On impose pour la suite $3u v + p = 0$.
L'équation devient:

$
u^3 + v^3 + (u+v)(3u v+p) + q = 0
&<==> u^3 + v^3 + 0(u+v) + q = 0 \
&<==> u^3 + v^3 + q = 0
$

====
On a $3u v + p = 0$, donc $u v = - p/3$, donc $u^3v^3 = - p^3/27$ 

====
En supposant que $(u, v)$ vérifie $(E_2)$ et $3u v + p = 0$, on a $u^3 + v^3 = -q$ et $u^3 v^3 = -p^3/27$. Ainsi,

$
forall t in RR, t^2 + q t - p^3/27=0 &<==> t^2 -t(u^3 + v^3) + u^3v^3 = 0 \
&<==> t^2 -u^3t -v^3t + u^3v^3 = 0 \
&<==> (t - u^3)(t-v^3) = 0
$
Donc $u^3$ et $v^3$ sont des racines du polynôme du second degré $t^2 + q t - p^3/27$.

/* Bloc inutile d'Andrei crée par hubris
Or, on a $Delta = q^2 + (4p^3)/27$. (DISCUTER DU SIGNE DE DELTA)

Donc $t_1 = (-q - sqrt(Delta))/2 = (-q - sqrt(q^2 + (4p^3)/27))/2$ et $t_2 = (-q + sqrt(Delta))/2 = (-q + sqrt(q^2 + (4p^3)/27))/2$

Quitte à interchanger $u$ et $v$ on peut supposer que $u^3 = t_1$ et $v^3 = t_2$.

Donc $u = root(3, t_1) = root(3, (-q - sqrt(q^2 + (4p^3)/27))/2)$ et $v = root(3, t_2) = root(3, (-q + sqrt(q^2 + (4p^3)/27))/2)$.

Or, $(E_1) <==>^(X = u + v) (E_2)$. Donc $$

Ainsi, $X_1 = u + v = root(3, (-q - sqrt(q^2 + (4p^3)/27))/2) + root(3, (-q + sqrt(q^2 + (4p^3)/27))/2)$ est une solution de $(E_2)$ et donc de $(E_1)$.

Donc, il existe $d, e, f in RR$ tel que
$
X^3 + p X + q &= (X - X_1)(d X^2 + e X + f) \
&= d X^3 + e X^2 + f X - d X_1 X^2 - e X_1 X - f X_1 \
&= d X^3 + (e - d X_1)X^2 + (f - e X_1)X - f X_1
$

Par identification, on a :

$
cases(
  d = 1,
  e - d X_1 = 0,
  f - e X_1 = p,
  f X_1 = -q
)
<==>

cases(
  d = 1,
  e = X_1,
  f = p + X_1^2,
  f X_1 = -q
)
$

Donc $X^3 + p X + q = (X - X_1)(X^2 + X_1 X + p + X^2_1)$

Trouvons les racines de $X^2 + X_1 X + p + X^2_1$ :

$Delta' = X_1^2 - 4(p + X_1^2) = X^2_1 - 4p - 4X^2_1 = -(3X^2_1 + 4p)$

Si $Delta' > 0$, alors on a $X_2 = (-X_1 - sqrt(Delta'))/2$ et $X_3 = (-X_1 + sqrt(Delta'))/2$.

Puisqu'on a effectué le changement de variable $X = x + a/3$ pour passer de $(E_0)$ à $(E_1)$, pour toute solution $S$ de $(E_1)$, $S - a/3$ est une solution de $(E_0)$.

Donc
$
cal(S) = {X_1, X_2, X_3} = {
  root(3, (-q - sqrt(q^2 + (4p^3)/27))/2) + root(3, (-q + sqrt(q^2 + (4p^3)/27))/2) - a/3, \
  (-(root(3, (-q - sqrt(q^2 + (4p^3)/27))/2) + root(3, (-q + sqrt(q^2 + (4p^3)/27))/2)) - sqrt(-3(root(3, (-q - sqrt(q^2 + (4p^3)/27))/2) + root(3, (-q + sqrt(q^2 + (4p^3)/27))/2))^2 - 4p))/2 - a/3, \
  (-(root(3, (-q - sqrt(q^2 + (4p^3)/27))/2) + root(3, (-q + sqrt(q^2 + (4p^3)/27))/2)) + sqrt(-3(root(3, (-q - sqrt(q^2 + (4p^3)/27))/2) + root(3, (-q + sqrt(q^2 + (4p^3)/27))/2))^2 - 4p))/2 - a/3
}
$

*/

== Exemples
===
$(E) : x^3 + 6x + 2 = 0$

On pose $x = u + v$. 
On obtient $u^3 + v^3 + (u+v)(3u v+6) + 2 = 0$. 
Posons également $3u v + 6 =0$

On sait que $u^3$ et $v^3$ sont solutions de l'équation du second degré suivante : \
$t^2 + 2t - 6^3/27 = 0 <==> t^2 + 2t - 8 = 0$, dont le discriminant est $Delta = 2^2 - 4 times (- 8) = 36 >0$

L'équation admet donc deux solutions :

$u^3 = (-2 + sqrt(36))/2 = 2$ et $v^3 = (-2 - sqrt(36))/2 = -4$, quitte à les interchanger sans perte de généralité.

Donc $u = root(3, 2)$ et $v = root(3, -4) = -root(3, 4)$. On vérifie que $3u v + 6 = 3 root(3, -8) + 6 = -6 + 6 = 0$, donc la contrainte est bien respectée.
Ainsi, $x_0 = u + v = root(3, 2) - root(3, 4)$ est solution de $(E)$.

Montrons qu'elle est unique. Les fonctions $x |-> x^3$ et $x |-> 6x + 2$ sont strictement croissantes sur $RR$.

Par somme, la fonction $f : x |-> x^3 + 6x + 2$ est donc strictement croissante sur $RR$, elle est donc injective sur $RR$ et $x_0$ est bien l'unique solution.

L'équation $(E)$ n'admet donc qu'une seule solution : $cal(S) = {root(3, 2) - root(3, 4)}$.
===
$(E') : 2x^3 + 5x^2 - 24x - 63 = 0 <==> x^3 + 5/2 x^2 - 12x - 63/2 = 0$

Posons $X = x + 5/6$. On a alors :
$p = -12 - (5/2)^2 / 3 = -169/12$ et $q = -63/2 + (2(5/2)^3)/27 - ((5/2)(-12))/3 = -2197/108$.

L'équation devient $(E'_1) : X^3 - 169/12 X - 2197/108 = 0$.

En posant $X = u + v$, on obtient $u^3 + v^3 + (u+v)(3u v - 169/12) - 2197/108 = 0$.

On impose $3u v - 169/12 = 0$, et on sait donc que $u^3$ et $v^3$ sont solutions de l'équation du second degré :

$t^2 - 2197/108 t + (169/12)^3/27 = 0$.
On a $Delta = (- 2197/108)^2 - 4 times (169/12)^3/27 = 0$.

On a donc $u^3 = v^3 = (2197/108)/2 = 2197/216 = 13^3 / 6^3$, d'où $u = v = root(3, 13^3 / 6^3) = 13/6$.

On a bien que $3u v - 169/12 = 3 times (13/6)^2 - 169/12 = 3 times 169/36 - 169/12 = 169/12 - 169/12 = 0$.

Donc $X_1 = u + v = 13/6 + 13/6 = 13/3$ est solution de $(E'_1)$.

Puisque $13/3$ est racine de $(E'_1)$, il existe $a, b, c in RR$ tels que :
$
X^3 - 169/12 X - 2197/108 &= (X - 13/3)(a X^2 + b X + c) \
&= a X^3 + (b - 13/3 a)X^2 + (c - 13/3 b)X - 13/3 c
$

Par identification , on obtient :
$
cases(
  a = 1,
  b - 13/3 a = 0,
  c - 13/3 b = -169/12,
  -13/3 c = -2197/108
)
<==>
cases(
  a = 1,
  b = 13/3,
  c = 169/9 - 169/12 = 169/36,
  -13/3 times 169/36 = -2197/108
)
$

Donc $X^3 - 169/12 X - 2197/108 = (X - 13/3)(X^2 + 13/3 X + 169/36)$.

Or $X^2 + 13/3 X + 169/36 = (X + 13/6)^2$.

Ainsi, $(E'_1) <==> (X - 13/3)(X + 13/6)^2 = 0 <==> X = 13/3 "ou" X = -13/6$. ($-13/6$ étant une racine d'ordre $2$).

En revenant à $x = X - 5/6$, on obtient $x_1 = 13/3 - 5/6 = 7/2$ et $x_2 = -13/6 - 5/6 = -3$.

L'équation $(E')$ admet donc exactement deux solutions : $cal(S) = {-3, 7/2}$.

===
====
On trouve comme solution évidente $x = 1$.
En effet, $1^3 + 3 times 1 - 4 = 0$

====
On pose $x = u + v$, ce qui donne $u^3 + v^3 + (u+v)(3u v + 3) - 4 = 0$.

On impose $3u v + 3 = 0$, donc $u^3$ et $v^3$ sont solutions de l'équation du second degré : \
$t^2 - 4t - 3^3/27 = 0 <==> t^2 - 4t - 1 = 0$.

Le discriminant vaut $Delta = (-4)^2 - 4 times (-1) = 20 > 0$.

On obtient donc, sans perte de généralité, $u^3 = (4 + sqrt(20))/2 = 2 + sqrt(5)$ et $v^3 = (4 - sqrt(20))/2 = 2 - sqrt(5)$.

D'où $u = root(3, 2 + sqrt(5))$ et $v = root(3, 2 - sqrt(5))$. On vérifie que $3u v + 3 = 3 root(3, 4 - 5) + 3 = 0$.

Ainsi, $x_0 = root(3, 2 + sqrt(5)) + root(3, 2 - sqrt(5))$ est solution de $(E'')$.

Or, les fonctions $x |-> x^3$ et $x |-> 3x - 4$ sont strictement croissantes sur $RR$, donc par somme $g : x |-> x^3 + 3x - 4$ est strictement croissante sur $RR$ et donc injective : la solution est  $x_0$ est donc unique.

On en déduit que $root(3, 2 + sqrt(5)) + root(3, 2 - sqrt(5)) = 1$ et $cal(S) = {1}$.

== Formules
On pose $Delta = (4p^3 + 27q^2)/27$

===
Supposons que $Delta > 0$

On sait que, en posant $X = u + v$ et en imposant $3u v + p = 0$, on obtient que $u^3$ et $v^3$ sont solutions de l'équation du second degré suivante : $t^2 + q t - p^3/27 = 0$.

Le discriminant de cette équation est $Delta_2 = q^2 + 4 times p^3 / 27 = (27q^2 + 4p^3)/27 = Delta > 0$.

Donc l'équation $t^2 + q t - p^3/27 = 0$ admet deux solutions distinctes :

$u^3 = (-q + sqrt(Delta))/2$ et $v^3 = (-q - sqrt(Delta))/2$, quitte à les interchanger sans perte de généralité.

De plus, $u^3 v^3 = -p^3/27$, donc dans $RR$, $u v = -p/3$, c'est-à-dire $3u v + p = 0$.

Donc $X_0 = u + v = root(3, (-q + sqrt(Delta))/2) + root(3, (-q - sqrt(Delta))/2)$ est solution de $(E_1)$.

Montrons qu'elle est unique. Puisque $X_0$ est racine de $(E_1)$, il existe $a, b, c in RR$ tels que :
$
X^3 + p X + q &= (X - X_0)(a X^2 + b X + c) \
&= a X^3 + (b - a X_0)X^2 + (c - b X_0)X - c X_0
$

Par identification, on a :
$
cases(
  a = 1,
  b - a X_0 = 0,
  c - b X_0 = p,
  -c X_0 = q
)
<==>
cases(
  a = 1,
  b = X_0,
  c = p + X_0^2,
  -(p + X_0^2)X_0 = q
)
$

La dernière équation est bien vérifiée car $-(p + X_0^2)X_0 = -X_0^3 - p X_0 = q$ (puisque $X_0$ est racine de $(E_1)$).

Donc $X^3 + p X + q = (X - X_0)(X^2 + X_0 X + p + X_0^2)$.

Le discriminant du polynôme $X^2 + X_0 X + p + X_0^2$ vaut $Delta' = X_0^2 - 4(p + X_0^2) = -3X_0^2 - 4p$.

Or $X_0 = u + v$ et $p = -3u v$, donc :
$
Delta' &= -3(u + v)^2 - 4(-3u v) \
&= -3(u^2 + 2u v + v^2) + 12u v \
&= -3u^2 - 6u v - 3v^2 + 12u v \
&= -3u^2 + 6u v - 3v^2 \
&= -3(u^2 - 2u v + v^2) \
&= -3(u - v)^2
$

Comme $Delta > 0$, on a $u^3 != v^3$, donc $u != v$, d'où $Delta' < 0$.

Le polynôme quotient n'a donc aucune racine réelle, et $(E_1)$ n'admet qu'une seule solution $X_0$.

===
Supposons que $Delta = 0$.

On sait que, en posant $X = u + v$ et en imposant $3u v + p = 0$, $u^3$ et $v^3$ sont solutions de l'équation du second degré $t^2 + q t - p^3/27 = 0$, de discriminant $Delta_2 = Delta$.

Or $Delta = 0$, donc $Delta_2 = 0$, c'est-à-dire $u^3 = v^3 = -q/2$.

Comme $u^3 v^3 = -p^3/27$, on a bien $u v = -p/3$, donc $X_1 = u + v = root(3, -q/2) + root(3, -q/2) = -2root(3, q/2)$ est solution de $(E_1)$.

Puisque $X_1$ est racine de $(E_1)$, il existe $a, b, c in RR$ tels que :
$
X^3 + p X + q &= (X - X_1)(a X^2 + b X + c) \
&= a X^3 + (b - a X_1)X^2 + (c - b X_1)X - c X_1
$

Par identification, on a :
$
cases(
  a = 1,
  b - a X_1 = 0,
  c - b X_1 = p,
  -c X_1 = q
)
<==>
cases(
  a = 1,
  b = X_1,
  c = p + X_1^2,
  -(p + X_1^2)X_1 = q
)
$

La dernière équation est bien vérifiée car $-(p + X_1^2)X_1 = -X_1^3 - p X_1 = q$ (puisque $X_1$ est racine de $(E_1)$).

Donc $X^3 + p X + q = (X - X_1)(X^2 + X_1 X + p + X_1^2)$.

Cherchons les racines du polynôme $X^2 + X_1 X + p + X_1^2$.

On a $Delta = 0$ donc $4p^3 + 27q^2 = 0$ donc $4p^3 = -27q^2$ donc $p = root(3, (-27q^2)/4) = -3 root(3, q^2/4)$.

De plus, $X_1^2 = (-2root(3, q/2))^2 = 4root(3, q^2/4)$

Le discriminant du polynôme $X^2 + X_1 X + p + X_1^2$ vaut donc :
$
Delta' &= X_1^2 - 4(p + X_1^2) = X_1^2 - 4p - 4X_1^2 = -3X_1^2 - 4p \
&= -3(4root(3, q^2/4)) - 4(-3root(3, q^2/4)) \
&= -12root(3, q^2/4) + 12root(3, q^2/4) = 0
$

Donc $X^2 + X_1 X + p + X_1^2$ a une racine double qui est $X_2 = -X_1/2 = 2root(3, q/2)/2 = root(3, q/2)$

Ainsi: 

- si $q != 0$, $X_1 != X_2$ et $(E_1)$ admet exactement deux racines : $cal(S) = {-2root(3, q/2), root(3, q/2)}$.

- si $q = 0$, alors $p = 0$ et les deux racines sont confondues : $X_1 = X_2 = 0$, donc $(E_1)$ n'admet qu'une racine d'ordre $3$ qui est $0$.

#align(center + bottom)[*Merci pour la lecture de ce devoir !*]

#align(center + bottom)[
L'ensemble de nos devoirs maison, fichiers PDF et codes sont disponibles sur : \ #link("https://github.com/andreim42/DMs-Maths-LLG")
]

]