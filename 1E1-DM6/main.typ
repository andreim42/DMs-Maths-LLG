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
Pour plus de simplicité, nous utiliserons la notation $[C, arrow(dotless))$ pour désigner la demi-droite qui a pour début $C$ et comme direction $arrow(dotless)$

====

#exemples()
====
Soient $A(x_A, y_a)$ et $B(x_B, y_B)$ des points du plan.\
Supposons spdg que $x_A<=x_B$.\
Si $x_A=x_B$:\
  Alors $cal(T)(x_A, max(y_A, y_B))$ passe par $A$ et $B$ ($cal(T)$ est confondu avec le point avec le $y$ le plus élevé, et la droite verticale vers le bas (de direction $-arrow(dotless.j)$) passe par l'autre)\
Sinon, si $x_A<x_B$:\ 
  si $y_A>=y_B$:\
    Alors $cal(T)(x_A, y_B)$ passe par $A$ et $B$ (c.f. $cal(T_4)$ du 1.A.1.a)  Remarque : ce serait pas plutôt $cal(T)(x_B, y_A)$ ?\
  si $y_A<y_B$:\
    si $x_B<y_B$:\
      Alors $cal(T)(x_A, y_B-x_B+x_A)$ passe par $A$ et $B$ (c.f. $cal(T_2)$ du 1.A.1.a)\
    si $x_B>=y_B$:\
      Alors $cal(T)(x_B-y_B+y_A, y_A)$ passe par $A$ et $B$ (c.f. $cal(T_1)$ et $cal(T_3)$ du 1.A.1.a)\

Donc, dans tous les cas, il existe une droite tropicale $cal(T)$ qui passe par deux points $A$ et $B$ du plan.

===

====
Soient $A(0,0)$, $B(0,-2)$, deux points.\
Alors $A$ et $B$ sont sur une même droite de direction $-arrow(dotless.j)$. et les droites tropicales $cal(T)(0,1)$ et $cal(T')(0,0)$ passent toutes la deux par $A$ et $B$ et $cal(T)!=cal(T')$.\
Donc la propriété $cal(B)$ n'est pas vérifié lorsque les points sont dépendants.

====
Soient $A(x_A, y_B)$ et $B(x_B, y_B)$ deux points du plan indépendants.\
Soient $cal(T)$ et $cal(T')$ deux droites tropicales de centres respectifs $Y(x_Y, y_Y)$ et $Z(x_Z, y_Z)$.\
Supposons que $A,B in cal(T)$ et $A,B in cal(T')$\
Supposons spdg que $A in [Y, -arrow(dotless))and (B in [Y, -arrow(dotless.j))or B in [Y, arrow(dotless)+arrow(dotless.j)))$ ou $A in [Y,-arrow(dotless.j)) and B in [Y, arrow(dotless)+arrow(dotless.j))$\
De même: $A in [Z, -arrow(dotless))and (B in [Z, -arrow(dotless.j))or B in [Z, arrow(dotless)+arrow(dotless.j)))$ ou $A in [Z,-arrow(dotless.j)) and B in [Z, arrow(dotless)+arrow(dotless.j))$

/*C'EST DE LA MERDE

Donc on a: 
$
  A in [Y, -arrow(dotless))and (B in [Y, -arrow(dotless.j))or B in [Y, arrow(dotless)+arrow(dotless.j))) and A in [Z, -arrow(dotless))and (B in [Z, -arrow(dotless.j))or B in [Z, arrow(dotless)+arrow(dotless.j)))\
  "ou" A in [Y, -arrow(dotless))and (B in [Y, -arrow(dotless.j))or B in [Y, arrow(dotless)+arrow(dotless.j))) and A in [Z,-arrow(dotless.j)) and B in [Z, arrow(dotless)+arrow(dotless.j)),\
  "ou" A in [Y,-arrow(dotless.j)) and B in [Y, arrow(dotless)+arrow(dotless.j)) and A in [Z, -arrow(dotless))and (B in [Z, -arrow(dotless.j))or B in [Z, arrow(dotless)+arrow(dotless.j))),\
  "ou" A in [Y,-arrow(dotless.j)) and B in [Y, arrow(dotless)+arrow(dotless.j)) or A in [Z,-arrow(dotless.j)) and B in [Z, arrow(dotless)+arrow(dotless.j))
$

1er cas: si $A in [Y, -arrow(dotless))and (B in [Y, -arrow(dotless.j))or B in [Y, arrow(dotless)+arrow(dotless.j))) and A in [Z, -arrow(dotless))and (B in [Z, -arrow(dotless.j))or B in [Z, arrow(dotless)+arrow(dotless.j)))$:\
Alors $A$ appartient à deux (demi-)droites horizontales parallèles entre elles.\
Donc $y_Y=y_Z$\
$
(B in [Y, -arrow(dotless.j))or B in [Y, arrow(dotless)+arrow(dotless.j))) 
and (B in [Z, -arrow(dotless.j))or B in [Z, arrow(dotless)+arrow(dotless.j)))\
<==>(B in [Y, -arrow(dotless.j)) and B in [Z, -arrow(dotless.j)))
or(B in [Y, -arrow(dotless.j))and B in [Z, arrow(dotless)+arrow(dotless.j)))\
or(B in [Y, arrow(dotless)+arrow(dotless.j)))and B in [Z, -arrow(dotless.j)))
or(B in [Y, arrow(dotless)+arrow(dotless.j))and B in [Z, arrow(dotless)+arrow(dotless.j)))
$
1er sous-cas: Si $B in [Y, -arrow(dotless.j)) and B in [Z, -arrow(dotless.j))$\
Alors $B$ appartient à deux (demi-)droites verticales et parallèles.\
Donc $x_Y=x_Z$\
2e sous-cas: Si $B in [Y, -arrow(dotless.j))and B in [Z, arrow(dotless)+arrow(dotless.j))$\
Alors $Y=Z(=B)$\
3e sous-cas: si $B in [Y, arrow(dotless)+arrow(dotless.j)))and B in [Z, -arrow(dotless.j))$\
De même, $Y=Z=(=B)$\
4e sous-cas: si $B in [Y, arrow(dotless)+arrow(dotless.j))and B in [Z, arrow(dotless)+arrow(dotless.j))$\
Alors $B$ appartient à deux (demi-)droites parallèles.\
Donc ces deux droites sont confondues sur l'intervalle où elles sont toutes deux définies.\
Or, $Y in[Y, arrow(dotless)+arrow(dotless.j)) and Z in[Z, arrow(dotless)+arrow(dotless.j))and y_Y=y_Z$\
Donc $x_Y=x_Z$

Donc $x_Y=x_Z "et" y_Y=y_Z$ donc $Y=Z$

2e sous-cas: $A in [Y, -arrow(dotless))and (B in [Y, -arrow(dotless.j))or B in [Y, arrow(dotless)+arrow(dotless.j))) and A in [Z,-arrow(dotless.j)) and B in [Z, arrow(dotless)+arrow(dotless.j))$*/

===
On considère les droites tropicales $cal(T)$ et $cal(T')$ de centres respectifs $Y(x,y)$ et $Z(x',y')$
On suppose que leurs points centraux sont indépendants.\
Les demi-droites $[Z;-arrow(dotless))$ et $[Y;-arrow(dotless))$ sont parallèles donc non sécantes.\
Les demi-droites $[Z;-arrow(dotless.j))$ et $[Y;-arrow(dotless.j))$ sont parallèles donc non sécantes.\
Les demi-droites $[Z;arrow(dotless)+arrow(dotless.j))$ et $[Y;arrow(dotless)+arrow(dotless.j))$ sont parallèles donc non sécantes.\
#import "figures.typ": exemple13a
#import "figures.typ": exemple13b
#import "figures.typ": exemple13c

Premier cas : si $x<x'$ et $y<y'$

On a $[Z;-arrow(dotless))$ et $[Y;-arrow(dotless.j))$ non sécantes car $y<y'$\
Et $[Y;-arrow(dotless))$ et $[Z;-arrow(dotless.j))$ non sécantes car $x<x'$\
Mais $[Y;arrow(dotless)+arrow(dotless.j))$ coupe soit $[Z;-arrow(dotless))$ en $(x+y'-y;y')$, soit $[Z;-arrow(dotless.j))$ en $(x';y+x'-x)$ car $x<x'$ et $y<y'$.\
Donc $cal(T)$ et $cal(T')$ sont sécantes en un seul point.
#exemple13a()


Deuxième cas : si $x<x'$ et $y>y'$

On a $[Y;arrow(dotless)+arrow(dotless.j))$ qui ne coupe ni $[Z;-arrow(dotless))$ ni $[Z;-arrow(dotless.j))$ car $y>y'$\
Et $[Y;-arrow(dotless))$ et $[Z;-arrow(dotless.j))$ non sécantes car $x<x'$\

Mais $[Z;-arrow(dotless))$ et $[Y;-arrow(dotless.j))$ sont sécantes en $(x;y')$ car $x<x'$ et $y>y'$\
Donc $cal(T)$ et $cal(T')$ sont sécantes en un seul point.
#exemple13b()

Troisième cas : si $x>x'$ et $y<y'$

On a $[Y;arrow(dotless)+arrow(dotless.j))$ qui ne coupe ni $[Z;-arrow(dotless))$ ni $[Z;-arrow(dotless.j))$ car $x>x'$\
Et $[Z;-arrow(dotless))$ et $[Y;-arrow(dotless.j))$ non sécantes car $y<y'$

Mais $[Y;-arrow(dotless))$ et $[Z;-arrow(dotless.j))$ sont sécantes en $(x';y)$ car $x>x'$ et $y<y'$.\
Donc $cal(T)$ et $cal(T')$ sont sécantes en un seul point.
#exemple13c()

Quatrième cas : Si $x>x'$ et $y>y'$

On a le même résultat que le premier cas, en inversant Y et Z
\
\
\
Donc, dans tous les cas, $cal(T)$ et $cal(T')$ sont sécantes en un seul point.
==
===
$3xor 7=max(3,7)=7$\
$-5xor 2=max(-5,2)=2$\
$3times.o 7=3+7=10$\
$-5times.o 2=-5+2=-3$
===
Soient $a, b, c in RR$\
- $(a xor b)xor c=max(max(a,b),c)=max(a,b,c)=max(a,max(b,c))=a xor(b xor c)$\
Donc $xor$ est associatif
- $a xor b=max(a,b)=max(b,a)=b xor a$\
Donc $xor$ est commutatif
- $a times.o (b xor c)=a+max(b,c)=max(a+b,a+c)=a times.o b xor a times.o c$\
Donc $times.o$ est distributif par rapport à $xor$.
===


===

]
