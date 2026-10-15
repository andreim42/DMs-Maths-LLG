#import "../templates/dm.typ": dm, olympiades
#set math.mat(delim: "|")

#dm(
  titre: "Autour de Farey",
  problems_name: "Problème",
  numbers: true,
  auteurs: "BONNET Zéphyr, FERRAOUN Rayane, MELLIER Raphaël, MITROI Andrei",
  classe: $1^"ère"1$,
  numero: 7,
)[
= #olympiades
==
Soit $x = a/b$ et $y= c/d$ appartenant à $QQ$.
On pose $x xor y = (a+b)/(c+d)$
===
$x xor x = (a+a)/(b+b) = (2a)/(2b) = a/b = x$
===
$x xor y = (a+b)/(c+d) = (b+a)/(d+c) = y xor x$

Donc $xor$ est commutative.
===
Soit $z in QQ$ tel que $z = e/f$ avec $e in NN$ et $f in NN^*$

$(x xor y) xor z = (a+b)/(c+d) xor e/f = (a+c+e)/(b+d+f) = a/b xor (c+e)/(d+f) = x xor (y xor z)$

Donc $xor$ est associative.
===
On a:\ 
$x xor y=(a+c)/(b+d)=((a+c)b d)/((b+d)b d)=(a b d+b c d)/(b^2d+b d^2)$\
$x=a/b=(a times d(b+d))/(b times d(b+d))=(a b d+a d^2)/(b^2d+b d^2)$\
$y=c/d=(c times b(b+d))/(d times b(b+d))=(b^2c+b c d)/(b^2d+b d^2)$

Supposons que $x<y$:\
$
x<y&<==>x-y=0\
&<==>a/b-c/d=0\
&<==>(a d-b c)/(b d)=0\
&<==>a d-b c=0 #text[car] b, d in NN^*\
&<==>cases(a d<b c, a d< b c)\
&<==>cases(a d^2<b c d,a b d<b^2c)\
&<==>cases(a b d+a d^2<a b d+b c d, a b d+b c d<b^2c+b c d)\
&<==>cases((a b d+a d^2)/(b^2d+b d^2)<(a b d+b c d)/(b^2d+b d^2), (a b d+b c d)/(b^2d+b d^2)<(b^2c+b c d)/(b^2d+b d^2))\
&<==>cases(x<x xor y,x xor y<y)\
&<==>x<x xor y<y
$
Donc $x<y==>x<x xor y<y$
==
===
Supposons que $x = y$.\
Alors $a/b=c/d$ et $a/b and c/d$ sont irréductibles.\
Donc $a=c and b=d$\
Donc $delta(x,y)=a d-b c = a b-b a = 0$
===
$delta(y,x)=mat(c,a;d,b)=c b-d a=-(d a-c b)=-(a d-c b)=-mat(a,c;b,d)=-delta(x,y)$  

===
Par double implication:\
Supposons que $delta(x,y)<=-1$
$
delta(x,y)<=-1 &==> vec(a b)vec(c d)<=-1\
&==>a d-b c<=-1\
&==>(a d-b c)/(b d)<=-1/(b d) #text[car] b d>0\
&==>a/b-c/d<=-1/(b d)\
&==>x<=y-1/(b d)\
&==>x<y #text[car] 0<1/(b d)
$
Supposons que $x<y$
$
x<y &==> a/b<c/d\
&==>a/b-c/d<0\
&==>(a d-b c)/(b d)<0\
&==>a d-b c<0\
&==>a d-b c<=-1 #text[car] a d-b c in NN\
&==>delta(x,y)<=1
$
===
$
delta(x, x xor y) &= mat(a,a+c;b,b+d)\
&=a(b+d)-b(a+c)
&=a b+a d-b a-b c\
&=a d-b c\
&=delta(x,y)\
&=a d-b c\
&=a d+c d-b c-c d\
&=(a+c)d-(b+d)c\
&=mat(a+c,c;b+d,b)\
&=delta(x xor y, y)\
$
Donc $delta(x,x xor y)=delta(x xor y,y)=delta(x,y)$

Supposons que $delta(x,y)=1$\
On pose pgcd$(a+c,b+d)=p$\
On pose $k=(a+c)/p$ et $k'=(b+d)/p$.\
$p divides a+c and p divides b+d$ donc $k,k'in NN$\
Donc $x xor y=k/k'$

$ 
delta(x,y)=-1&=delta(x xor y,y)\
&=mat(k,c;k',d)\
&=k d-k'c\
&=d(a+c)/p-c(b+d)/p\
&=(a d+c d+b c+c d)/p\
&=(a d-b c)/p\
&=(mat(a,c;b,d))/p\
&=(delta(x,y))/p\
&=-1/p
$
Donc $p=1$, donc la fraction est irréductible, car pgcd$(a+c,b+d)=1$

==
===
$cal(F)_5 = {0/1;1/5;1/4;1/3;2/5;1/2;3/5;2/3;3/4;4/5;1/1}$

$cal(F)_6 = {0/1;1/6;1/5;1/4;1/3;2/5;1/2;3/5;2/3;3/4;4/5;5/6;1/1}$

$cal(F)_7 = {0/1;1/7;1/6;1/5;1/4;2/7;1/3;2/5;3/7;1/2;4/7;3/5;2/3;5/7;3/4;4/5;5/6;6/7;1/1}$

$cal(F)_8 = {0/1;1/8;1/7;1/6;1/5;1/4;2/7;1/3;3/8;2/5;3/7;1/2;4/7;3/5;5/8;2/3;5/7;3/4;4/5;5/6;6/7;7/8;1/1}$

===
Supposons qu'on ait $m in NN, n in NN^*$ tels que $m/n in cal(F)_n$. montrons que $(n - m)/n in cal(F)_n$.

Soit $f = (n - m)/n$. On a $f = 1 - m/n$. Or $m/n in cal(F)_n$ donc $m/n <= 1$ donc $0<=f<=1$.

Montrons par l'absurde que la fraction $f=(n-m)/n$ est irréductible.\
Supposons que la fraction $(n-m)/n$ ne soit pas irréductible.\
Alors donc $exists k in ZZ^*, k|n "et" k|n-m$\
Donc $exists p, q in QQ^*, n=k q "et" n-m=k p$
$
k q-m=k p\
m=(k q)/(k p)\
m/n=((k q)/(k p))/(k q)=(k q)/(k p k q) "donc la fraction" m/n "n'est pas irréductible"
$

Absurde\
Donc $(n-m)/n in cal(F_n)$


Montrons que $1/2$ est le centre de symétrie de $cal(F_n)$ 

On sait que $m/n$ et $(n-m)/n$ appartiennent à $cal(F_n)$

$(m/n + (n-m)/n)/2 = (n/n)/2 = 1/2$

Donc $m/n$ et  $(n-m)/n$ sont à une même distance de $1/2$ et l'un des deux termes au moins est supérieur à $1/2$

Donc $1/2$ est le centre de symétrie de $cal(F_n)$
===
jsp parler des écarts on remarque que le plus grand écart $epsilon = 1/n$.

===
====


====

==
Faut montrer qu'il existe un point appartenant aux deux cercles correspondant à $x$ et $y$

- Montrons que le cercle de Ford à un nombre de $cal(F_n)$ est tangent à l'axe des abscisses.
Soit $x$ une fraction de $cal(F_n)$ (avec $x=a/b$).\
Le cercle de Ford associé est le cercle $scr(C)$ de centre $O(a/b,1/(2b^2))$ et de rayon $1/(2b^2)$.\ 
On considère le point $M$ le projeté orthogonal de $O$ sur l'axe des abscisses. \
Donc $M$ a pour coordonnées $(a/b, 0)$.\

$M O=sqrt((x_M-x_O)^2+(y_M-y_O)^2)=sqrt(0^2+(-1/(2b^2))^2)=1/(2b^2)$\
Donc $M$ appartient au cercle $scr(C)$ de centre O et de rayon $1/(2b^2)$ et $O M$ est perpendiculaire à l'axe des abscisses.\
Donc $scr(C)$ est tangent à l'axe des abscisses.

- Montrons que les deux cercles associés à deux fractions consécutives de $cal(F)_n$ sont tangents entre eux.

Deux cercles sont tangents si et seulement si la somme de leurs rayons est égale à la distance entre leurs centres.

Pour  les cercles $scr(C)$, le cercle de centre $O(a/b, 1/(2b^2))$ et de rayon $R_scr(C) = 1/(2b^2)$ et $scr(C'),$ le cercle de centre $O'(c/d, 1/(2d^2))$ et de rayon $R_scr(C') = 1/(2d^2)$, on a :

$O O'=sqrt((x_O-x_O')^2+(y_O-y_O')^2)$

et $R_scr(C) + R_scr(C') = 1/(2b^2) + 1/(2d^2) = (d^2+b^2)/(2b^2d^2)$

D'où :

$O O'^2 &=(x_O-x_O')^2+(y_O-y_O')^2\
&= (a/b-c/d)^2+(1/(2b^2) - 1/(2d^2))^2\
&= ((a d-b c)/(b d))^2 + ((2d^2-2b^2)/(4b^2d^2))^2\
&= (-1/(b d))^2 + ((d^2-b^2)/(2b^2d^2))^2 ("car" delta(x,y)= -1)\
&= 1/(b^2d^2) + ((d^4 - 2d^2b^2 + b^4)/(4b^4d^4))\
&= (d^4 + 2b^2d^2 + b^4)/(4b^4d^4)\
&= ((d^2+b^2)/(2b^2d^2))^2\
&= (R_scr(C) + R_scr(C'))^2$

Or $O O'$ et $R_scr(C) + R_scr(C')$ sont des longueurs,

donc $O O' = R_scr(C) + R_scr(C')$

Donc les cercles $scr(C)$ et $scr(C')$ sont tangents.

==
===

====

====

===
  
]
