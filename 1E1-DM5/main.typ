#import "../templates/dm.typ": dm, olympiades

#dm(
  titre: "Autour de Farey",
  problems_name: "Problème",
  numbers: true,
  auteurs: "BONNET Zéphyr, FERRAOUN Rayane, MELLIER Raphaël, MITROI Andrei",
  classe: $1^"ère"1$,
  numero: 5,
)[

#set math.mat(delim: "|")

= #olympiades

== Somme des cancres dans $QQ_+$.
Soit $x = a/b$ et $y= c/d$ appartenant à $QQ_+$.
On pose $x xor y = (a+c)/(b+d)$

===
$x xor x = (a+a)/(b+b) = (2a)/(2b) = a/b = x$

===
$x xor y = (a+c)/(b+d) = (c+a)/(d+b) = y xor x$

Donc $xor$ est commutative.

===
Soit $z in QQ$ tel que $z = e/f$ avec $e in NN$ et $f in NN^*$

$(x xor y) xor z = (a+c)/(b+d) xor e/f = (a+c+e)/(b+d+f) = a/b xor (c+e)/(d+f) = x xor (y xor z)$

Donc $xor$ est associative.

===
Supposons que $x < y$, soit $a/b < c/d$. Donc $a d < b c$ car $b > 0$ et $d > 0$. D'où $a d - b c < 0$.

D'une part, montrons que $x < x xor y$, soit $a/b < (a+c)/(b+d)$. Déterminons le signe de $a/b - (a+c)/(b+d)$ :

On a $a/b - (a+c)/(b+d) = (a(b+d) - b(a+ c))/b(b+d) = (a b + a d - b a - b c)/b(b + d) = (a d - b c)/b(b + d) < 0$ car $a d - b c < 0$ et $b > 0$ et $d > 0$ soit $b(b + d) > 0$.

Donc $x < x xor y$.

D'autre part, montrons que $x xor y < y$, soit $(a+c)/(b+d) < c/d$.
Déterminons le signe de $(a+c)/(b+d) - c/d$.

On a $(a+c)/(b+d) - c/d = (d(a+c) - c(b+d))/d(b+d) = (d a + d c - c b - c d)/(d(b+d)) = (a d - b c)/d(b+d) < 0$ car $a d - b c < 0$ et $b > 0$ et $d > 0$.

Donc $x xor y < y$.

Ainsi, $x < x xor y < y$.

== Déterminant de deux nombres de $QQ_+$.
Soit $x = a/b$ et $y= c/d$ appartenant à $QQ_+$.

===
Montrons que $x = y$ si et seulement si $delta(x,y) = 0$. Raisonnons par double-implication :

D'une part, supposons que $x = y$.

Alors $a/b=c/d$ et $a/b$ et $c/d$ sont irréductibles.

Donc $a=c$ et $b=d$
Donc $delta(x,y)=a d-b c = a b-b a = 0$.

D'autre part, supposons que $delta(x,y) = 0$.
Donc $a d - b c = 0$, donc $a d = b c$, d'où $a/b = c/d$ car $b != 0$ et $d != 0$.

Donc $x = y$.
Donc $x = y$ ssi $delta(x,y) = 0$.

===
$delta(y,x)=mat(c,a;d,b)=c b-d a=-(d a-c b)=-(a d-c b)=-mat(a,c;b,d)=-delta(x,y)$  

===
Montrons que $x < y$ si et seulement si $delta(x,y) <= -1$.
Raisonnons par double-implication :

D'une part, supposons que $x < y$ :

$
x<y &"donc" a/b<c/d \
&"donc" a/b-c/d<0 \
&"donc" (a d-b c)/(b d)<0 \
&"donc" a d-b c<0 \
&"donc" a d-b c<=-1 #text[car] a d-b c in NN \
&"donc" delta(x,y)<=1
$

D'autre part, supposons que $delta(x,y)<=-1$ :

$
delta(x,y)<=-1 &"donc" a d-b c<=-1 \
&"donc" (a d-b c)/(b d)<=-1/(b d) #text[car] b d>0 \
&"donc" a/b-c/d<=-1/(b d) \
&"donc" x<=y-1/(b d) \
&"donc" x<y #text[car] 0<1/(b d)
$

Donc $x < y$ ssi $delta(x, y) <= -1$.

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

Supposons que $delta(x,y)=-1$.
On pose pgcd$(a+c,b+d)=p$.
On pose $k=(a+c)/p$ et $k'=(b+d)/p$.

$p divides a+c$ et $p divides b+d$ donc $k,k'in NN$
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
 
Donc $p=1$ car $-1/p = -1$, donc la fraction est irréductible, car pgcd$(a+c,b+d)=1$.

== Ensembles de Farey.
===
$cal(F)_5 = {0/1;1/5;1/4;1/3;2/5;1/2;3/5;2/3;3/4;4/5;1/1}$

$cal(F)_6 = {0/1;1/6;1/5;1/4;1/3;2/5;1/2;3/5;2/3;3/4;4/5;5/6;1/1}$

$cal(F)_7 = {0/1;1/7;1/6;1/5;1/4;2/7;1/3;2/5;3/7;1/2;4/7;3/5;2/3;5/7;3/4;4/5;5/6;6/7;1/1}$

$cal(F)_8 = {0/1;1/8;1/7;1/6;1/5;1/4;2/7;1/3;3/8;2/5;3/7;1/2;4/7;3/5;5/8;2/3;5/7;3/4;4/5;5/6;6/7;7/8;1/1}$

===
Supposons qu'on ait $m in NN, n in NN^*$ tels que $m/n in cal(F)_n$. montrons que $(n - m)/n in cal(F)_n$.

Soit $f = (n - m)/n$. On a $f = 1 - m/n$. Or $m/n in cal(F)_n$ donc $m/n <= 1$ donc $0<=f<=1$.

Montrons par l'absurde que la fraction $f=(n-m)/n$ est irréductible.

Supposons que la fraction $(n-m)/n$ ne soit pas irréductible.

Alors donc $exists k in ZZ^*, k|n "et" k|n-m$

Donc $exists p, q in QQ^*, n=k q "et" n-m=k p$

$
k q - m &= k p \
m &= k q - k p = k(q - p) \
m/n &= (k(q - p))/(k q) = (q - p)/q
$

Donc la fraction $m/n$ n'est pas irréductible. Contradiction !
Donc $(n-m)/n in cal(F_n)$.

Montrons que $1/2$ est le centre de symétrie de $cal(F_n)$ 

On sait que $m/n$ et $(n-m)/n$ appartiennent à $cal(F_n)$. D'où :

$
(m/n + (n-m)/n)/2 = (n/n)/2 = 1/2
$

Donc $m/n$ et  $(n-m)/n$ sont à une même distance de $1/2$ et l'un des deux termes au moins est supérieur à $1/2$.

Donc $1/2$ est le centre de symétrie de $cal(F_n)$

===
Soient $x = a/b, y = c/d$ deux fractions consécutives de $cal(F)_(n+1)$ avec $a in NN, b in NN^*, c in NN, d in NN^*$.

Montrons que $x in cal(F)_n$ ou $y in cal(F)_n$. Raisonnons par l'absurde. Supposons que $x in cal(F)_(n+1)$ et $y in cal(F)_(n+1)$.

Supposons spdg que $x < y$, soit $a/b < c/d$.

Alors $b = n + 1$ et $d = n + 1$. Donc $a/(n + 1)$ et $c/(n + 1)$ sont consécutives. Donc $c = a + 1$ car on aurait

$x = a/(n + 1) < (a + 1)/(n + 1) < c/(n + 1) = y$ alors que $x$ et $y$ sont consécutives.
Donc on a $a/(n + 1)$ et $(a + 1)/(n + 1)$ consécutives.

_Montrons qu'on peut choisir un $z = k/n$ tel que $x < z < y$._ : Soit $z = k/n$ avec $k in NN$.

$
x < z < y &<==> a/(n + 1) < k/n < (a + 1)/(n + 1) \
&<==> (n a)/n(n + 1) < k(n + 1)/n(n + 1) < n(a + 1)/n(n + 1) \
&<==> n a < k(n + 1) < n(a + 1) \
&<==> n a < k n + k < n a + n \
&<==> n a < k(n + 1) < n(a + 1) \
&<==> (n a)/(n + 1) < k < n(a + 1)/(n + 1) \
&<==> (a(n + 1) - a)/(n + 1) < k < (n a + n)/(n + 1) = (a(n + 1) - a + n)/(n + 1) \
&<==> a - a/(n + 1) < k < a - (a - n)/(n + 1)
$

Le seul entier $k$ valide est $k = a$ car $0 < a < n$ et on a bien $z = a/n in cal(F)_n$. Donc $a/(n + 1) < a/n < (a + 1)/(n + 1)$. Or $a/(n + 1)$ et $(a + 1)/(n + 1)$ sont consécutifs. Contradiction !

Donc on a $x in cal(F)_(n + 1)$ ou $y in cal(F)_(n + 1)$.

===
Pour $n in NN^*$, on note $cal(P)(n)$ l'assertion : "si $x < y$ sont deux fractions consécutives de $cal(F)_n$
alors $delta (x; y) = -1$ et $x xor y$ est la première#footnote[On considère ici que le terme "première fraction qui va apparaître" signifie qu'elle va être la première à être générée entre les deux fractions lors de la construction à partir des ensembles précédents et non pas qu'elle sera première dans l'ordre croissant des fractions.] fraction qui va apparaître entre $x$ et $y$ dans un ensemble $cal(F)_m$ avec $m >= n + 1$".

====
_Initialisation_ : Pour $n = 1$, supposons que $x < y$ soient deux fractions de $cal(F)_1 = {0/1, 1/1}$.

Donc $x = 0/1$ et $y = 1/1$. D'où $delta (x; y) = 0 - 1 = -1$ et $x xor y = 1/2$.

Or, $cal(F)_(2) = {0/1, 1/2, 1/1}$ donc $1/2 = x xor y in cal(F)_2$ donc $1/2$ apparaît dès $cal(F)_2$.

Donc $cal(P)(1)$ est vraie.

====
_Hérédité_ : Soit $n in NN^*$. On suppose que $cal(P)(n)$ est vraie.

Soient $x = a/b$ et $y = c/d$ deux fractions consécutives de $cal(F)_(n + 1)$ telles que $x < y$.
D'après la question *C.3)* l'une, au moins, de ces fractions appartient à $cal(F)_n$.
Raisonnons par disjonction de cas :

=====
$1^("er")$ cas : $x, y in cal(F)_n$. On sait que $x$ et $y$ sont deux fractions consécutives de $cal(F)_(n+1)$. Or, $x, y in cal(F)_n$ et $cal(F)_n in cal(F)_(n+1)$ donc elles sont aussi consécutives dans $cal(F)_n$.

On a alors $delta (x; y) = -1$ et $x xor y$ qui va être la première fraction à appraître entre $x$ et $y$ dans un ensemble $cal(F)_m$ avec $m >= n + 1$ par hypothèse de récurrence.

Or, on sait que $x$ et $y$ sont consécutives dans $cal(F)_(n+1)$, donc on a même que $x xor y$ va être la première fraction à apparaître entre $x$ et $y$ dans un ensemble $cal(F)_m$ avec $m >= n + 2 = (n + 1) + 1$.
Donc $cal(P)(n + 1)$ est vraie.

=====
$2^("ème")$ cas : $x in cal(F)_n$ et $y in cal(F)_(n + 1) without cal(F)_n$.
On note $z$ la fraction successive de $x$ dans $cal(F)_n$.

_Montrons que $y = x xor z$ et que $delta (x; y) = -1$_ : Par hypothèse de récurrence, on a $delta (x; z) = -1$ et $x xor z$ est la première fraction à apparaître entre $x$ et $z$ dans un ensemble $cal(F)_m$ avec $m >= n + 1$. Or, $y$ est la première fraction à apparaître entre $x$ et $z$ dans $cal(F)_(n + 1)$ car $x$ et $y$ sont consécutifs. Donc $x xor z = y$.

De plus, $delta (x; y) = delta (x; x xor z) = delta (x; z) = -1$ d'après la *B.4)*.

Soit $t = r/s$ la première fraction irréductible qui va apparaître entre $x$ et $y$ dans un certain ensemble $cal(F)_m$ avec $m >= n + 2$.

_Montrons que $delta (t; x)$ et $delta (y; t)$ sont des entiers supérieurs ou égaux à 1_ :
On a $x < t < y$. Donc $delta (x; y) <= -1$ et $delta (t; y) <= -1$ d'après la *B.3)*. Or, $delta (t; x) = -delta (x; y)$ et $delta (y; t) = -delta (t; y)$ d'après la *B.2)*.

Ainsi, $delta (t; x) >= 1$ et $delta (y; t) >= 1$. De plus, $delta (t; x) = r b - s a$ et $delta (y; t) = c s - d r$. Or, $a, c, r in NN$ et $b, d, s in NN^*$.

Donc $delta (t; x)$ et $delta (y; t)$ sont des entiers supérieurs ou égaux à $1$.

_Montrons que $r = a delta (y; t) + c delta (t; x)$ et $s = b delta (y; t) + d delta (t; x)$_ :

On a $a delta (y; t) + c delta (t; x) = a(c s - d r) + c(r b - s a) = dot(a c s) - a d r + c r b - dot(c s a) = r (b c - a d) = - r delta (x; y) = r$ car on a montré que $delta (x; y) = -1$.

Et, $b delta (y; t) + d delta (t; x) = b(c s - d r) + d(r b - s a) = b c s - dot(b d r) + dot(d r b) - d s a = s(b c - a d) = -s delta (x; y) = s$ car on a montré que $delta (x; y) = -1$.

Raisonnons par l'absurde pour montrer que $s = b + d$.
Supposons que $delta (y; t) != 1$ et $delta (t; x) != 1$. Alors on aura que $b + d < s$. De plus, $delta (x; y) = -1$ donc $x xor y$ est irréductible. Donc $x xor y = (a + c)/(b + d)$ apparaît avant $t$ dans la construction des ensembles. Or, $t$ est la première fraction irréductible à apparaître entre $x$ et $y$. Contradiction !

Donc $delta (y; t) = delta (t; x) = 1$. Donc $t = r/s = (a + c)/(b + d) = x xor y$.

Ainsi, $delta (x; y) = -1$ et $x xor y$ est bien la première fraction à apparaître entre $x$ et $y$ dans un ensemble $cal(F)_m$ avec $m >= n + 2$. Donc $cal(P)(n + 1)$ est vraie.

=====
$3^("ème")$ cas : $x in cal(F)_(n + 1) without cal(F)_n$ et $y in cal(F)_n$. D'après la *C.2)*, $cal(F)_(n + 1)$ est symétrique donc

$x' = (b - a)/b in cal(F)_(n + 1) without cal(F)_n$ et $y' = (d - c)/d in cal(F)_n$.

De plus, $x < y$ sont deux fractions consécutives de $cal(F)_(n + 1)$ donc $y' < x'$ et $x'$ et $y'$ sont deux fractions consécutives de $cal(F)_(n + 1)$. Ainsi, on se ramène au cas précédent et on raisonne de la même manière.

Donc $cal(P)(n + 1)$ est vraie.

$4^("ème")$ cas : $x, y in cal(F)_(n + 1) without cal(F)_n$. Ce cas est impossible, en effet d'après le *C.3)*, $x$ ou $y$ appartient à $cal(F)_n$.

_Conclusion_ : Dans tous les cas, $cal(P)(n + 1)$ est vraie.
Ainsi, pour tout $n in NN^*, cal(P)(n)$ est vraie par principe de récurrence.

== Cercles de Ford.
Faut montrer qu'il existe un point appartenant aux deux cercles correspondant à $x$ et $y$

- Montrons que le cercle de Ford à un nombre de $cal(F_n)$ est tangent à l'axe des abscisses.
Soit $x$ une fraction de $cal(F_n)$ (avec $x=a/b$).

Le cercle de Ford associé est le cercle $scr(C)$ de centre $O(a/b,1/(2b^2))$ et de rayon $1/(2b^2)$.

On considère le point $M$ le projeté orthogonal de $O$ sur l'axe des abscisses.

Donc $M$ a pour coordonnées $(a/b, 0)$.

$M O=sqrt((x_M-x_O)^2+(y_M-y_O)^2)=sqrt(0^2+(-1/(2b^2))^2)=1/(2b^2)$\
Donc $M$ appartient au cercle $scr(C)$ de centre O et de rayon $1/(2b^2)$ et $O M$ est perpendiculaire à l'axe des abscisses.

Donc $scr(C)$ est tangent à l'axe des abscisses.

- Montrons que les deux cercles associés à deux fractions consécutives de $cal(F)_n$ sont tangents entre eux.

Deux cercles sont tangents si et seulement si la somme de leurs rayons est égale à la distance entre leurs centres.

Pour  les cercles $scr(C)$, le cercle de centre $O(a/b, 1/(2b^2))$ et de rayon $R_scr(C) = 1/(2b^2)$ et $scr(C'),$ le cercle de centre $O'(c/d, 1/(2d^2))$ et de rayon $R_scr(C') = 1/(2d^2)$, on a :

$O O'=sqrt((x_O-x_O')^2+(y_O-y_O')^2)$

et $R_scr(C) + R_scr(C') = 1/(2b^2) + 1/(2d^2) = (d^2+b^2)/(2b^2d^2)$

D'où :

$
O O'^2 &=(x_O-x_O')^2+(y_O-y_O')^2\
&= (a/b-c/d)^2+(1/(2b^2) - 1/(2d^2))^2\
&= ((a d-b c)/(b d))^2 + ((2d^2-2b^2)/(4b^2d^2))^2\
&= (-1/(b d))^2 + ((d^2-b^2)/(2b^2d^2))^2 ("car" delta(x,y)= -1)\
&= 1/(b^2d^2) + ((d^4 - 2d^2b^2 + b^4)/(4b^4d^4))\
&= (d^4 + 2b^2d^2 + b^4)/(4b^4d^4)\
&= ((d^2+b^2)/(2b^2d^2))^2\
&= (R_scr(C) + R_scr(C'))^2
$

Or $O O'$ et $R_scr(C) + R_scr(C')$ sont des longueurs,

donc $O O' = R_scr(C) + R_scr(C')$

Donc les cercles $scr(C)$ et $scr(C')$ sont tangents.

== Approximation.
===
==== On sait que $alpha = 1/sqrt(2)$    
#table(
  columns: 6,
  inset: 0.8em,

  [*étapes*],[*2*],[*3*],[*4*],[*5*],[*6*],
  [*Valeur par défaut*], [$2/3$], [$2/3$], [$2/3$], [$7/10$], [$12/17$],
  [*Valeur par excès*], [$1/1$], [$3/4$],[$5/7$], [$5/7$],[$5/7$]
) 
On s'arrête à l'étape 6, étant donné que la prochaine fraction serait : 
$ 12/17  xor 5/7 = 17/24$.

$24>20$, on ne peut donc pas le conserver.

L'encadrement, obtenu est donc $12/17 < 1/sqrt(2) < 5/7 $ qui est le meilleur encadrement possible des dénominateurs inférieurs ou égaux à $20$ 

====
On poursuit donc avec exactement la même méthode :
A partir de l'étape précédente, les bornes sont $12/17 $ et $5/7$

#table(
  columns: 5,
  inset: 0.8em,

  [*étapes*],[*7*],[*8*],[*9*],[*10*],
  [*Valeur par défaut*], [$12/17$], 
  [$12/17$], [$41/58$], [$70/99$],
  [*Valeur par excès*], [$17/24$], [$29/41$],[$29/41$], [$29/41$],
)

A l'étape 10 le dénominateur 106, dépasse 100 : on ne peut donc pas retenir cette fraction.

L'encadrement obtenu est donc $70/99 < 1/sqrt(2) < 29/41$ qui est le meilleur encadrement possible des dénominateurs inférieurs oui égaux à $100$ 

===
Montrez que : $forall$  $alpha $ $in$  $]0;1[$ et tout $n in NN^*, exists a/b in cal(F)_n$ ,telle que : 
$|alpha - a/b|$ $< 1/b(n+1) $

avec $a/b <= alpha <= c/d $

Considérons les deux fractions consécutives de $cal(F)_n$, la partie B nous permet d'utiliser la propriété:

$"bc" - "ad" = 1 $

Ainsi : 
$c/d -a/b = ("bc"-"ad")/"bd" = 1/"bd"$

On obtient donc : $c/d-a/b=1/"bd"$ 

De plus, puisque les fractions sont consécutives, dans $cal(F)_n$, on a: 
$b+d>=n+1$

Posons : $u= alpha-a/b $  et $v=c/d-alpha$, deux nombres positifs ou nuls 

En les additionnant : 
$u+v = alpha - a/b+c/d - alpha $

Donc 
$u+v = c/d-a/b$

Or d'après l'étape précédente
$u+v = 1/"bd"$

On aurait alors : $u>1/b(n+1)$
et 
$v>1/d(n+1)$

En sommant ces inégalités, on obtient donc : 
$u+v >1/b(n+1)+ 1/d(n+1) $

On met au même dénominateur : 
$u+v > (b+d)/(b d(n+1))$

Or $b+d>= n+1$, donc :
$(b+d)/"bd"(n+1)>=1/"bd"$

Par conséquent : 
$u+v>1/"bd"$
Mais nous avons démontré a l'étape deux que : 
$u+v=1/"bd"$

Absurde !

Ainsi au moins l'une des deux fractions verifie l'inégalité recherchée. 

*Conclusion :*
Il existe une fraction $a/b in cal(F)_n$ telle que : $|alpha - a/b| < 1/b(n+1)$

#v(5%)

#align(center)[*Merci pour la lecture de ce devoir !*]

#align(center + bottom)[
L'ensemble de nos devoirs maison, fichiers PDF et codes sont disponibles sur : \ #link("https://github.com/andreim42/DMs-Maths-LLG")
]

]