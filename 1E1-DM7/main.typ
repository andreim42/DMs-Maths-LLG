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

On pose $X = x + a/3, p = b - a^2/3 "et" q=c+(2a^2)/27-(a b)/3$. Ainsi, $forall x in RR, $

$
X^3 + p X + q = 0 &<==> (x + a/3)^3 + p(x + a/3) + q = 0 \
&<==> x^3 + 3x^2 a/3 + 3a^2/9 x + a^3/27 + p x + p a/3 + q = 0 \
&<==> x^3 + a x^2 + (a^2/3 + p)x + a^3/27 + p a/3 + q = 0 \
&<==> x^3 + a x^2 + (a^2/3+b-a^2/3)x + a^3/27 + a/3(b-a^2/3)+c+(2a^2)/27 - (a b)/3 = 0 \ 
&<==> x^3 + a x^2 + b x + a^3/27+(a b)/3-(3a^2)/27+(2a^2)/27-(a b)/3+c = 0 \
&<==> x^3 + a x^2 + b x + c
$
===
Posons $X=u+v$

====
On a donc:\
$
forall x in RR,
X^3 + p X + q = 0&<==> (u+v)^3 + p(u+v) + q=0 \
&<==> u^3 + 3u^2v + 3u v^2 + v^3 + p(u+v) + q = 0 \
&<==> u^3 + v^3 + 3u v(u+v) + p(u+v) + q = 0 \
&<==> u^3 + v^3 + (u+v)(3u v+p) + q = 0 \
$

====
L'équation devient:
$
forall x in RR, u^3 + v^3 + (u+v)(3u v+p) + q = 0 
&<==> u^3 + v^3 + 0(u+v) + q = 0 \
&<==> u^3 + v^3 + q = 0
$

====
$3u v + p = 0$, donc $u v = p/3$, donc $u^3v^3 = p^3/27$ 

====
$
forall x in RR, x^2 + q x + p^3/27=0 &<==> x^2 -x(u^3 + v^3) + u^3v^3 = 0 \
&<==> x^2 -u^3x -v^3x + u^3v^3 = 0 \
&<==> (x - u^3)(x-v^3) = 0
$
Donc $u^3$ et $v^3$ sont solutions de l'équation x^2 + q x + p^3/27=0

Mais bon, je ne vois pas à quoi ça sert...

== Exemples
===
$(E) : x^3 + 6x + 2 = 0$

On pose $x = u + v$.

On obtient $u^3 + v^3 + (u+v)(3u v+6) + 2 = 0$

Posons également $3u v + 6 =0$

On sait que $u^3$ et $v^3$ sont solutions de l'équation du second degré suivante : \
$t^2 + 2t - 6^3/27 = 0 <==> t^2 + 2t - 8 = 0$, dont le discriminant $Delta$ est $Delta = 2^2 - 4 times (- 8) = 36 >0$

L'équation admet donc deux solutions :

$u^3 = (-2 + sqrt(36))/2 = 2$ et $v^3 = (-2 - sqrt(36))/2 = -4$, quitte à les interchanger sans perte de généralité.

Donc $u = root(3, 2)$ et $v = root(3, -4) = -root(3, 4)$. On vérifie que $3u v + 6 = 3 root(3, -8) + 6 = -6 + 6 = 0$, donc la contrainte est bien respectée.

Ainsi, $x_0 = u + v = root(3, 2) - root(3, 4)$ est solution de $(E)$.

Montrons qu'elle est unique. Les fonctions $x |-> x^3$ et $x |-> 6x + 2$ sont strictement croissantes sur $RR$.

Par somme, la fonction $f : x |-> x^3 + 6x + 2$ est donc strictement croissante sur $RR$.

L'équation $(E)$ n'admet donc qu'une seule solution : $cal(S) = {root(3, 2) - root(3, 4)}$.
===
$(E') : 2x^3 + 5x^2 - 24x - 63 = 0 <==> x^3 + 5/2 x^2 - 12x - 63/2 = 0$

Posons $X = x + 5/6$. On a alors :
$p = -12 - (5/2)^2 / 3 = -169/12$ et $q = -63/2 + (2(5/2)^3)/27 - ((5/2)(-12))/3 = -2197/108$.

L'équation devient $(E'_1) : X^3 - 169/12 X - 2197/108 = 0$.

En posant $X = u + v$, on obtient $u^3 + v^3 + (u+v)(3u v - 169/12) - 2197/108 = 0$.

On impose $3u v - 169/12 = 0$, et on sait donc que $u^3$ et $v^3$ sont solutions de l'équation du second degré :

$t^2 - 2197/108 t + (169/12)^3/27 = 0$

$Delta = (- 2197/108)^2 - 4 times (169/12)^3/27 = 0$.

On a donc $u^3 = v^3 = 2197/216$, d'où $u = v = root(3, 2197/216) = 13/6$.

On vérifie bien que $3u v - 169/12 = 3 times (13/6)^2 - 169/12 = 0$.

Donc $X_1 = u + v = 13/6 + 13/6 = 13/3$ est solution de $(E'_1)$.

Factorisons le polynôme par $(X - 13/3)$. Pour tout $X in RR$ :
$
(X - 13/3)(X^2 + 13/3 X + 169/36) &= X^3 + (13/3 - 13/3)X^2 + (169/36 - 169/9)X - 2197/108 \
&= X^3 - 169/12 X - 2197/108
$

Or $X^2 + 13/3 X + 169/36 = (X + 13/6)^2$.

Ainsi, $(E'_1) <==> (X - 13/3)(X + 13/6)^2 = 0 <==> X = 13/3 "ou" X = -13/6$.

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

Or, les fonctions $x |-> x^3$ et $x |-> 3x - 4$ sont strictement croissantes sur $RR$, donc par somme $g : x |-> x^3 + 3x - 4$ est strictement croissante sur $RR$ : la solution est unique.

On en déduit que $root(3, 2 + sqrt(5)) + root(3, 2 - sqrt(5)) = 1$ et $cal(S) = {1}$.

== Formules
On pose $Delta = (4p^3 + 27q^2)/27$

===
On sait que, en posant $X = u + v$ et en imposant $3u v + p = 0$, on obtient que $u^3$ et $v^3$ sont solutions de l'équation du second degré suivante : $t^2 + q t - p^3/27 = 0$.

]