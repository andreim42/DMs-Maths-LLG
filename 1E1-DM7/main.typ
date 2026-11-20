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

===

===
====

====

== Formules
===

===

]