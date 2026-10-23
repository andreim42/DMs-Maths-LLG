#import "../templates/dm.typ": dm, olympiades

#dm(
  titre: "Droites tropicales",
  problems_name: "Problème",
  numbers: true,
  auteurs: "BONNET Zéphyr, FERRAOUN Rayane, MELLIER Raphaël, MITROI Andrei",
  classe: $1^"ère"1$,
  numero: 6,
)[

= #olympiades #h(0.5em) Les droites tropicales

==

#import "figures.typ": exemples

===
Pour plus de simplicité, nous utiliserons la notation $[C, arrow(dotless))$ pour désigner la demi-droite qui a pour début $C$ et comme direction $arrow(dotless)$.

De même, on notera parfois la droite tropicale $cal(T)$ de point central de coordonnées $x, y$, $cal(T)(x; y)$. On veillera pour autant à ne pas confondre une droite tropicale (un ensemble de points) et son point central.

====

#exemples()
====
Soient $A(x_A, y_A)$ et $B(x_B, y_B)$ des points du plan.\
Supposons spdg que $x_A<=x_B$.\
Si $x_A=x_B$:\
  Alors $cal(T)(x_A, max(y_A, y_B))$ passe par $A$ et $B$ ($cal(T)$ est confondu avec le point avec le $y$ le plus élevé, et la demi-droite verticale vers le bas (de direction $-arrow(dotless.j)$) passe par l'autre point).\
Sinon, si $x_A<x_B$ :\
  si $y_A>=y_B$:\
    Alors $cal(T)(x_B, y_A)$ passe par $A$ et $B$ (c.f. $cal(T_4)$ du 1.A.1.a)\
  si $y_A<y_B$:\
    si $x_B - x_A < y_B - y_A$:\
      Alors $cal(T)(x_A, y_B-x_B+x_A)$ passe par $A$ et $B$ (c.f. $cal(T_2)$ du 1.A.1.a)\
    si $x_B - x_A >= y_B - y_A$:\
      Alors $cal(T)(x_B-y_B+y_A, y_A)$ passe par $A$ et $B$ (c.f. $cal(T_1)$ et $cal(T_3)$ du 1.A.1.a)\

Donc, dans tous les cas, il existe une droite tropicale $cal(T)$ qui passe par deux points $A$ et $B$ du plan.

===
====
Soient $A(0,0)$, $B(0,-2)$, deux points.

Alors $A$ et $B$ sont sur une même droite de direction $-arrow(dotless.j)$ (la droite de formule $x=0$) et les droites tropicales $cal(T)(0,1)$ et $cal(T')(0,0)$ passent toutes les deux par $A$ et $B$ et $cal(T)!=cal(T')$.

Donc la propriété $cal(B)$ n'est pas vérifiée lorsque les points sont dépendants.

====
Soient $A$ et $B$ deux points du plan indépendants.
D'après le *A.1.b)*, nous savons déjà qu'il existe au moins une droite tropicale passant par $A$ et $B$. Il reste à prouver son unicité.

Puisque $A$ et $B$ sont indépendants, ils n'appartiennent à aucune droite de direction $-arrow(dotless.i)$, $-arrow(dotless.j)$ ou $arrow(dotless.i)+arrow(dotless.j)$. Par conséquent, ils ne peuvent pas se trouver sur la même demi-droite d'une droite tropicale. 
Ils doivent donc obligatoirement appartenir à deux demi-droites distinctes de la droite tropicale. 

Les directions des demi-droites étant fixes, l'intersection des droites portant ces demi-droites donne un point central unique. Le point central étant unique, la droite tropicale l'est aussi. La propriété $(cal(B)')$ est donc démontrée.

===
On considère les droites tropicales $cal(T)$ et $cal(T')$ de centres respectifs $Y(x,y)$ et $Z(x',y')$
On suppose que leurs points centraux sont indépendants.

Les demi-droites $[Z;-arrow(dotless))$ et $[Y;-arrow(dotless))$ sont parallèles donc non sécantes.

Les demi-droites $[Z;-arrow(dotless.j))$ et $[Y;-arrow(dotless.j))$ sont parallèles donc non sécantes.

Les demi-droites $[Z;arrow(dotless)+arrow(dotless.j))$ et $[Y;arrow(dotless)+arrow(dotless.j))$ sont parallèles donc non sécantes.

#import "figures.typ": exemple13a
#import "figures.typ": exemple13b
#import "figures.typ": exemple13c

#table(
  columns: 2,
  stroke: 0em,

  align(horizon)[
    Premier cas : si $x<x'$ et $y<y'$
    
    On a $[Z;-arrow(dotless))$ et $[Y;-arrow(dotless.j))$ non sécantes car $y<y'$

    Et $[Y;-arrow(dotless))$ et $[Z;-arrow(dotless.j))$ non sécantes car $x<x'$

    Mais $[Y;arrow(dotless)+arrow(dotless.j))$ coupe soit $[Z;-arrow(dotless))$ en $(x+y'-y;y')$, soit $[Z;-arrow(dotless.j))$ en $(x';y+x'-x)$ car $x<x'$ et $y<y'$.

    Donc $cal(T)$ et $cal(T')$ sont sécantes en un seul point.
  ],
  exemple13a()
)

#line(length: 100%, stroke: 0.05em + luma(44%))

#table(
  columns: 2,
  stroke: 0em,

  align(horizon)[
    Deuxième cas : si $x<x'$ et $y>y'$
    
    On a $[Y;arrow(dotless)+arrow(dotless.j))$ qui ne coupe ni $[Z;-arrow(dotless))$ ni $[Z;-arrow(dotless.j))$ car $y>y'$

    Et $[Y;-arrow(dotless))$ et $[Z;-arrow(dotless.j))$ non sécantes car $x<x'$
    
    Mais $[Z;-arrow(dotless))$ et $[Y;-arrow(dotless.j))$ sont sécantes en $(x;y')$ car $x<x'$ et $y>y'$

    Donc $cal(T)$ et $cal(T')$ sont sécantes en un seul point.
  ],
  exemple13b()
)

#table(
  columns: 2,
  stroke: 0em,

  align(horizon)[
    Troisième cas : si $x>x'$ et $y<y'$
    
    On a $[Y;arrow(dotless)+arrow(dotless.j))$ qui ne coupe ni $[Z;-arrow(dotless))$ ni $[Z;-arrow(dotless.j))$ car $x>x'$

    Et $[Z;-arrow(dotless))$ et $[Y;-arrow(dotless.j))$ non sécantes car $y<y'$
    
    Mais $[Y;-arrow(dotless))$ et $[Z;-arrow(dotless.j))$ sont sécantes en $(x';y)$ car $x>x'$ et $y<y'$.

    Donc $cal(T)$ et $cal(T')$ sont sécantes en un seul point.
  ],
  exemple13c()
)

Quatrième cas : Si $x>x'$ et $y>y'$

On a le même résultat que le premier cas, en inversant Y et Z

#h(1em)

Donc, dans tous les cas, $cal(T)$ et $cal(T')$ sont sécantes en un seul point.

===
====
Prenons les droites tropicales $cal(T)$,$cal(T')$ et $cal(T'')$ d'origines respectives $T(1;1)$, $U(5;1)$ et $V(6;4)$

#import "figures.typ": exemple14a
#exemple14a()

On observe bien que $hat(I) + hat(I') + hat(I'') = 45° + 135° + 90° = 270° != 360°$.

Donc tous les triangles tropicaux n'ont pas des angles de mesures sommant à $360°$.

====
Soit un triangle tropical de sommets $A$, $B$ et $C$ deux à deux indépendants.
Par définition, un triangle tropical est un domaine borné du plan délimité par trois droites tropicales.

Puisque le domaine est fermé et borné, ses trois côtés sont nécessairement portés par des segments issus des trois directions définissant les droites tropicales : $-arrow(dotless.i)$, $-arrow(dotless.j)$ et $arrow(dotless.i)+arrow(dotless.j)$.

Les sommets $A$, $B$ et $C$ correspondent aux points d'intersection de ces différentes directions. Les angles intérieurs du triangle sont donc fixés par l'intersection deux à deux de ces trois vecteurs directeurs :

- L'angle formé par les directions $-arrow(dotless.i)$ et $-arrow(dotless.j)$ mesure $90°$.
- L'angle formé par les directions $-arrow(dotless.i)$ et $arrow(dotless.i)+arrow(dotless.j)$ mesure $135°$.
- L'angle formé par les directions $-arrow(dotless.j)$ et $arrow(dotless.i)+arrow(dotless.j)$ mesure $135°$.

Chaque sommet $A$, $B$ et $C$ correspond à l'un de ces trois angles.

On a donc bien $hat(A) + hat(B) + hat(C) = 90° + 135° + 135° = 360°$.

==
===
$3xor 7=max(3,7)=7$\
$-5xor 2=max(-5,2)=2$\
$3times.o 7=3+7=10$\
$-5times.o 2=-5+2=-3$

===
Soient $a, b, c in RR$\
- $(a xor b)xor c=max(max(a,b),c)=max(a,b,c)=max(a,max(b,c))=a xor(b xor c)$

Donc $xor$ est associatif.

- $a xor b=max(a,b)=max(b,a)=b xor a$

Donc $xor$ est commutatif.

- $a times.o (b xor c)=a+max(b,c)=max(a+b,a+c)=a times.o b xor a times.o c$

Donc $times.o$ est distributif par rapport à $xor$.
===
Soit $x, y in RR$. Soit $cal(T)$ le lieu des coins de $P_T$, soit l'ensemble des points du plan pour lesquels le maximum de $P_T$ est atteint par au moins deux membres.

$
#text[«maximum atteint au moins deux fois»] &<==> 
cases(
  &a + x = b + y >= c,
  "ou" &a + x = c >= b + y,
  "ou" &b + y = c >= a + x
) \
&<==>
cases(
  &(y = x + a - b "et" a + x >= c),
  "ou" &(x = c - a "et" c >= b + y),
  "ou" &(y = c - b "et" c >= a + x)
) \
&<==>
cases(
  &(y = x + a - b "et" x >= c - a),
  "ou" &(x = c - a "et" y <= c - b),
  "ou" &(y = c - b "et" x <= c - a)
)
$

On remarque que l'on retrouve bien les trois demi-droites constituant une droite tropicale : une demi-droite de direction $arrow(dotless.i)+arrow(dotless.j)$ (il s'agit du cas $y = x + a - b$ avec $x >= c - a$), une demi-droite de direction $-arrow(dotless.i)$ (il s'agit du cas $y = c - b$ avec $x <= c - a$) et une demi-droite de direction $-arrow(dotless.j)$ (il s'agit du cas $x = c - a$ avec $y <= c - b$). Il suffit maintenant de vérifier que ces trois demi-droites partent toutes d'une même origine.

Pour trouver cette origine, résolvons le système pour le cas où le maximum est atteint trois fois (intersection des droites) :

$
cases(
  y = x + a - b,
  x = c - a,
  y = c - b
)
&<==>
cases(
  c - b = c - a + a - b,
  x = c - a,
  y = c - b
)
&<==>
cases(
  0 = 0,
  x = c - a,
  y = c - b
)
$

On trouve le point $O_cal(T)(c - a; c - b)$ comme origine de notre droite tropicale, c'est le seul point où le maximum est atteint trois fois.

Le lieu des coins de $P_T$ est donc bien une droite tropicale $cal(T)$ d'origine $O_cal(T)(c - a; c - b)$.

===
De manière similaire à l'exercice précédent, soit $cal(T')$ le lieu des coins de $Q_T$, soit l'ensemble des points du plan pour lesquels le maximum de $Q_T$ est atteint par au moins deux membres.

Soit $x, y in RR$. On a $Q_T(x, y) = 1 xor (-1) times.o x xor 0 times.o y xor (-5) times.o x^2 = max(1, x - 1, y, x^2 - 5)$.

$
#text[«maximum atteint au moins deux fois»] &<==> 
cases(
  &y = 1 >= max(x - 1, x^2 - 5),
  "ou" &y = x - 1 >= max(1, x^2 - 5),
  "ou" &y = x^2 - 5 >= max(1, x - 1),
  "ou" &1 = x - 1 >= max(y, x^2 - 5),
  "ou" &1 = x^2 - 5 >= max(y, x - 1),
  "ou" &x - 1 = x^2 - 5 >= max(y, 1)
) \
&<==>
cases(
  & (y = 1 "et" x <= 2 "et" x^2 <= 6),
  "ou" &(y = x - 1 "et" x >= 2 "et" x^2 - x - 4 <= 0),
  "ou" &(y = x^2 - 5 "et" x^2 >= 6 "et" x^2 - x - 4 >= 0),
  "ou" &(x = 2 "et" y <= 1 "et" -1 <= 1),
  "ou" &(x = plus.minus sqrt(6) "et" y <= 1 "et" x - 1 <= 1),
  "ou" &(x = (1 plus.minus sqrt(17))/2 "et" y <= x - 1 "et" x - 1 >= 1)
) \
&<==>
cases(
  & (y = 1 "et" -sqrt(6) <= x <= 2) &"(segment parallèle à" y = k")",
  "ou"& (y = x - 1 "et" 2 <= x <= (1 + sqrt(17))/2) &"(segment parallèle à" y = x")",
  "ou"& (y = x^2 - 5 "et" (x <= -sqrt(6) "ou" x >= (1 + sqrt(17))/2)) &"(parabole)",
  "ou"& (x = 2 "et" y <= 1) &"(droite parallèle à x = k)",
  "ou"& (x = -sqrt(6) "et" y <= 1) &"(droite parallèle à x = k)",
  "ou"& (x = (1 + sqrt(17))/2 "et" y <= (sqrt(17) - 1)/2) &"(droite parallèle à x = k)"
)
$

On remarque que l'on retrouve bien différentes composantes constituant notre lieu des coins : un segment horizontal (cas $y = 1$), un segment oblique (cas $y = x - 1$), deux branches paraboliques (cas $y = x^2 - 5$) et trois demi-droites de direction $-arrow(dotless.j)$ (les droites parallèles à $x=k$). Il suffit maintenant de vérifier que ces composantes partent de points centraux communs.

Pour trouver ces origines, résolvons les systèmes pour les cas où le maximum est atteint trois fois (intersection des différentes courbes) :

$
cases(
  y = 1,
  y = x^2 - 5,
  x = -sqrt(6)
)
#h(2em) " ; " #h(2em)
cases(
  y = 1,
  y = x - 1,
  x = 2
)
$
#align(center)[et]
$
cases(
  y = x - 1,
  y = x^2 - 5,
  x = (1 + sqrt(17))/2
)
<==>
cases(
  y = (1 + sqrt(17))/2 - 1 = (sqrt(17)-1)/2,
  y = x^2 - 5,
  x = (1 + sqrt(17))/2
)
$

On trouve les points $I(-sqrt(6); 1)$, $I'(2; 1)$ et $I''((1+sqrt(17))/2; (sqrt(17)-1)/2)$ comme points d'intersection de notre figure, ce sont les seuls points où le maximum est atteint trois fois.

On peut en conclure que le lieu des coins de $Q_T$ est la réunion des ensembles de points définis plus tôt. Voici ci-dessous une figure de ce lieu des coins :

#import "figures.typ": exemple14b
#exemple14b()


#align(center)[*Merci pour la lecture de ce devoir !*]

#align(center + bottom)[
L'ensemble de nos devoirs maison, fichiers PDF et codes sont disponibles sur : \ #link("https://github.com/andreim42/DMs-Maths-LLG")
]

]
