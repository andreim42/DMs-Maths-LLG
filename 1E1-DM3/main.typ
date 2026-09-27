#import "../templates/dm.typ": dm, code

#dm(
  titre: "Équations fonctionnelles. Nombres échangeables",
  problems_name: "Exercice",
  numbers: true,
  auteurs: "BONNET Zéphyr, FERRAOUN Rayane, MELLIER Raphaël, MITROI Andrei",
  classe: $1^"ère"1$,
  numero: 3,
)[

= Partie entière

===
On a $3/2 < floor(5/2) <= 5/2$ et $floor(5/2) in ZZ$\
Donc $floor(5/2) = 4/2 = 2$

On a $-pi-1< floor(-pi) <= -pi$ et $floor(-pi) in ZZ$\
$-pi-1 approx -4.14$ et $-pi approx-3,14$\
Donc $floor(-pi) = -4$

On a $(2pi)/7-1<floor((2pi)/7) <=(2pi)/7$\
$(2pi)/7 approx 0,9$\
Donc $floor((2pi)/7) = 0$

Le programme ne marche pas sur $RR hyph.minus$.\
Voici une proposition de correction:

#code("1E1-DM3/1_1.py")

=== 
Soit $x in RR$
====
Un décimal est un nombre qu'on peut écrire sous la forme $d/10^n$ avec $d in ZZ, n in NN$\
Par définition, $floor(10^p x) in ZZ$ et $p in NN$\
Donc $(floor(10^p x))/10^p in DD$

Selon la définition de la partie entière, $floor(x) <=x<floor(x) +1$\

Donc $floor(10^p x) <= 10^p < floor(10^p x) +1$\

Donc $floor(10^p x)/10^p <= (10^p x )/10^p < (floor(10^p x)+1)/10^p$\

Donc $floor(10^p x)/10^p <= (10^p x )/10^p < floor(10^p x)/10^p +1/10^p$
====

On sait que pour tout réel X :\

$floor(X)<=X < floor(X+1)  $


Prenons $X = 10^p times x +1/2$ avec $x in RR$ et $p in NN$ 

Donc $floor(10^p times x +1/2) <= 10^p times x +1/2 < floor(10^p times x +1/2) +1 $\v


Isolons $x$ :\

$(floor(10^p times x +1/2))-1/2 <= 10^p times x < floor(10^p times x +1/2) +1/2 $\


Donc $(floor(10^p times x +1/2)-1/2)/10^p <=
x < (floor(10^p times x +1/2) +1/2)/10^p $\


Or, $a = floor(10^p times x+1/2)/10^p$

Donc $a-1/(2times 10^p)=< x < a +1/(2times 10^p)$
Ce qui signifie que $a$ est le nombre décimal à $p$ chiffres après la virgule le plus proche de $x$. 
Donc $a$ est bien un arrondi de $x$ à $10^(-p)$ près.


= Notion de Densité

=== 
Par raisonnement absurde:

==== 
Supposons que la grenouille peut sauter par-dessus la mare\
Alors on a $delta >= y-x$\
Donc $delta >= cal(l)$ car $cal(l) = y-x$\
Absurde\
Donc la grenouille ne peut pas sauter par-dessus la mare.\
Le théorème de la grenouille est donc vérifié.
====
On cherche le nombre $b$ de bonds tel que $b in NN$, $b$ est le plus petit possible et $ x < delta times b < y$.\
Donc $x/delta < b < y/delta$ car $delta$ est une longueur donc $delta > 0$ \
Donc $x/delta<b<x/delta+l/delta$ car $y = x+cal(l)$\
Or, $cal(l)/delta>1$\
$x/delta < b$ donc b existe et est le premier entier strictement supérieur à $x/delta$ car b est le plus petit possible.\
Donc $b=floor(x/delta)+1$


===

====
$1/n<x-y$\
Donc $n>1/(y-x)$\

Donc $n> floor(1/(y-x))$\
Donc on peut prendre $n = floor(1/(y-x))+1$
====
D'après la question précédente, $forall x, y in RR^+, exists n in NN^*$, tel que $n=floor(1/(y-x))$.\
Donc $1/n<y-x$, donc $x<x+1/n$ et $x+1/n<y$\
Donc $x<x+1/n<y$\
Donc $exists a in QQ, a=(x times n +1)/n$, tel que $x<a<y$\

====
Soit $x, y in RR$\
Choisissons $a=(y-x)/sqrt(2)$\
Alors $sqrt(2) times a=y-x$ et $a in RR without QQ$\
Donc $a<y-x$\
Donc $x<x+a$ et $x+a<y$\
Donc $RR without QQ$ est dense dans $RR$

===

====
Soit $a in RR^*_+$\
Montrons que $forall n in NN^*$, $(1+a)^n >= 1+n a$ par récurrence.\
Soit P($n$) l'assertion : '$forall n in NN^*$, $(1+a)^n >= 1+n a$'\
- #underline[Initialisation] : Prenons $n = 1$\
Donc $(1+a)^n = 1+a >= 1+n a = 1+a$\

- #underline[Hérédité] : Soit $n in NN^*$. Supposons que P($n$) est vraie. Montrons que P($n+1$) est vraie.\
$ (1+a)^(n+1) >= 1+a(n+1) <==> (1+a)^(n+1) >= a n +a+1 >= a n+1$ car a > 0\
Donc P($n+1$) est vraie.\
Donc, par le principe de récurrence, $forall n in NN^*$, $(1+a)^n >= 1+n a$.
====
Soit $b in ]0;1[$\
Montrons qu'il existe $C in RR^*_+$ tel que $0 < b^n <= C/n$\
Choisissons $C = b^2 n$\
On a $b > 0$ et $n>0$ donc $C in RR^*_+$\
Et\
$0 < b^2 <= b^2 &<==> 0 < b^2 <= (b^2 n)/n\ &<==> 0 < b^2 <= C/n$\
Donc $exists C in RR^*_+, forall n in NN^*,space 0 < b^2 <= C/n$

===
====
Soit $x, y in RR$\
Selon le 2) de l'exercice 1, on a $forall p in NN, floor(10^p times 1/(y-x))/10^p<=1/(y-x)<floor(10^p times 1/(y-x))/10^p+1/10^p$\
Donc $1/(y-x)-floor(10^p times 1/(y-x))/10^p<1/10^p$\

Donc $(10^p-(y-x) times floor(10^p times 1/(y-x)))/(10^p times (y-x))<1/10^p$
====

===

====

====

====

]