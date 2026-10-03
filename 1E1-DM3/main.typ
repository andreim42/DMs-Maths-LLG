#import "../templates/dm.typ": dm, code

#dm(
  titre: "Partie entière. Notion de densité",
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

Le programme ne marche pas sur $RR_-$. En effet, ``partent(``$-3.14$``)`` = $0$.

Voici une proposition de correction:

#code("1E1-DM3/1_1.py")

=== 
Soit $x in RR$ et $p in NN$.

====
Un décimal est un nombre qu'on peut écrire sous la forme $d/10^n$ avec $d in ZZ, n in NN$\
Par définition, $floor(10^p x) in ZZ$ et $p in NN$\
Donc $(floor(10^p x))/10^p in DD$

Selon la définition de la partie entière, $floor(x) <=x<floor(x) +1$\

Donc $floor(10^p x) <= 10^p < floor(10^p x) +1$\

Donc $floor(10^p x)/10^p <= (10^p x )/10^p < (floor(10^p x)+1)/10^p$\

Donc $floor(10^p x)/10^p <= (10^p x )/10^p < floor(10^p x)/10^p +1/10^p$

====
On a : $floor(10^p x + 1/2) <= 10^p x + 1/2 < floor(10^p x + 1/2) + 1$

Donc $floor(10^p x + 1/2) - 1/2 <= 10^p x < floor(10^p x + 1/2) + 1/2$

D'où : $(floor(10^p x + 1/2) - 1/2)/10^p <= x < (floor(10^p x + 1/2) + 1/2)/10^p$

Or, $a = floor(10^p times x+1/2)/10^p$

Donc $a-1/(2times 10^p)=< x < a +1/(2times 10^p)$
Ce qui signifie que $a$ est le nombre décimal à $p$ chiffres après la virgule le plus proche de $x$. 
Donc $a$ est bien un arrondi de $x$ à $10^(-p)$ près.

= Notion de Densité

===
====
Raisonnons par l'absurde : Supposons que la grenouille puisse sauter par-dessus la mare.

La grenouille passe donc d'une position $x_1 <= x$ à une position $x_2 >= y$. Donc $x_2 - x_1 >= y - x = cal(l)$

Donc $delta >= cal(l)$. Contradiction !

Donc la grenouille ne peut pas sauter par-dessus la mare.

Le théorème de la grenouille est donc vérifié.

====
On cherche le nombre $b in NN$ de bonds tel que $b$ est minimal et la grenouille tombe dans la marre, i.e. $x < delta times b < y$.

Donc $x/delta < b < y/delta$ car $x != y$ donc $delta > 0$

Donc $x/delta < b < x/delta + l/delta$ car $y = x + cal(l)$

Or, $cal(l)/delta>1$ donc on a bien $b in NN$, et $b = floor(x / delta) + 1$

===
====
$1/n<y-x$. Donc $n>1/(y-x)$. Donc $n> floor(1/(y-x))$

Donc on peut prendre $n = floor(1/(y-x))+1$

====
Soient $x, y in RR$ tels que $x < y$.

Posons $x' = x + M$ avec $M in NN$ tel que $x + M >= 0$.
Posons $y' = y + M$.

D'après la *2.a)*, il existe $n in NN^*$ tel que $1/n < y' - x'$.

Prenons une longueur de saut $delta = 1/n$. En appliquant le théorème de la Grenouille sur l'intervalle $]x', y'[$, la grenouille tombe dans la mare après un certain nombre de bonds $k in NN$. Son point de chute est $k times delta = k/n$.

Ainsi :
$x' < k/n < y' <==> x + M < k/n < y + M <==> x < k/n - M < y$
Posons $a = k/n - M = (k - M n)/n$. Puisque $k, M, n in ZZ$ et $n != 0$, on a $a in QQ$.

On a donc trouvé un rationnel $a$ tel que $x < a < y$. $QQ$ est donc dense dans $RR$.

====
Soient $x, y in RR$ tels que $x < y$. On peut supposer que $0 <= x < y$ en utilisant la même astuce que précédemment (on ne posera plus $x'$ et $y'$ ici pour plus de simplicité).

D'après la question *2.b)*, il existe un rationnel $r in QQ$ tel que $x/sqrt(2) < r < y/sqrt(2)$.

Donc $x < r sqrt(2) < y$.

Or $r in QQ$ et $sqrt(2) in RR without QQ$, donc $a = r sqrt(2) in RR without QQ$ ($r > 0$ donc $r != 0$).

Donc $RR without QQ$ est dense dans $RR$

===
====
Soit $a in RR^*_+$.
Pour $n in NN^*$, on note $P(n)$ l'assertion : '$(1+a)^n >= 1+n a$'.

Montrons que $forall n in NN^*, P(n)$ par récurrence.

- #underline[Initialisation] : Pour $n = 1$ :

Donc $(1+a)^n = 1+a >= 1+n a = 1+a$

- #underline[Hérédité] : Soit $n in NN^*$. Supposons que $P(n)$ est vraie. Montrons que $P(n+1)$ est vraie.

Comme $1+a > 0$ : $(1+a)^(n+1) >= (1+n a)(1+a)$

Donc
$(1+a)^(n+1) >= 1 + a + n a + n a^2 = 1 + (n+1)a + n a^2$

Or $n a^2 >= 0$, donc :
$(1+a)^(n+1) >= 1 + (n+1)a$

Donc $P(n+1)$ est vraie.

- #underline[Conclusion] : Donc, d'après le principe de récurrence, $forall n in NN^*$, $(1+a)^n >= 1+n a$.

====
Soit $b in ]0; 1[$.

On a $1/b > 1$, il existe donc $a in RR^*_+$ tel que $1/b = 1+a$.

D'après l'inégalité de Bernoulli, pour tout $n in NN^*$ :

$(1/b)^n = (1+a)^n >= 1+n a >= n a$

Donc, $b^n <= 1/(n a) = (1/a)/n$ (car $b > 0$ et $a in RR^*_+$).

En posant $C = 1/a$, on a bien $C in RR^*_+$ telle que $0 < b^n <= C/n$.

===
====
Soient $x, y in RR$ tels que $0 <= x < y$.

Posons $b = 1/10$. Comme $b in ]0; 1[$, d'après la question 3.b, il existe $C > 0$ tel que $0 < (1/10)^p <= C/p$ pour tout $p in NN^*$.

On cherche un entier $p$ tel que $C/p < y - x$.

Puisque $y - x > 0$, cette inéquation équivaut à $p > C / (y - x)$.

Il suffit de choisir l'entier $p = floor(C / (y - x)) + 1$.

Pour cet entier $p$, on a bien $1/10^p <= C/p < y - x$.

====
Soient $x, y in RR$ tels que $x < y$.

Posons $x' = x + M$ avec $M in NN$ tel que $x + M >= 0$.
Posons $y' = y + M$.

D'après la *4.a)*, il existe $p in NN$ tel que $1/10^p < y' - x'$.

Prenons $delta = 1/10^p$. La grenouille tombe dans la mare après $k$ bonds.

Donc $x' < k/10^p < y'$ avec $k in NN$. Donc $x < (k - M times 10^p)/10^p < y$.

Posons $a = (k - M times 10^p)/10^p$. On a $a in DD$.

Donc $DD$ est dense dans $RR$.

===
====
Soit $x=a+b times sqrt(2)$ et $y=c+d times sqrt(2)$

Alors

$
x+y &= a+b sqrt(2) + c+d sqrt(2) \
&=a+c + (b+d) sqrt(2) \
&= m+n sqrt(2) #text[avec] m = a+c #text[et] n=b+d 
$

Donc $m,n in ZZ$

Donc $x + y in ZZ [sqrt(2)]$

Et 
$
x y &= (a+b sqrt(2))(c+d sqrt(2)) \
&=a c + a d sqrt(2) + b c sqrt(2) + 2b d \
&= m+n sqrt(2) #text[avec] m= a c + 2b d #text[et] n= a d + b c \
$

Donc $ZZ[sqrt(2)]$ est stable par addition et multiplication.

====
On a $u = -1 + sqrt(2)$. Donc $0 < u < 1$.

D'après la *3.b)*, il existe $C > 0$ tel que $0 < u^p <= C/p$ pour tout $p in NN^*$.

Puisque $y - x > 0$, posons $p = floor(C / (y - x)) + 1$. Donc $0 < u^p <= C/p < y - x$.

====
Soient $x, y in RR$ tels que $0 <= x < y$ (comme on l'a vu précédemment on peut se permettre de supposer cela en omettant l'étape où on translate $x$ et $y$ pour qu'ils soient positifs).

D'après la *5.b)*, il existe $p in NN$ tel que $0 < u^p < y - x$.

Prenons $delta = u^p$. La grenouille tombe dans la mare après $k$ bonds.

Donc $x < k times u^p < y$ avec $k in NN$. Or $u in ZZ[sqrt(2)]$.
Donc $u^p in ZZ[sqrt(2)]$ et $k times u^p in ZZ[sqrt(2)]$ (par stabilité de la multiplication).

Donc $ZZ[sqrt(2)]$ est dense dans $RR$.

#v(5%)

#align(center)[*Merci pour la lecture de ce devoir !*]

#align(center)[#align(bottom)[
L'ensemble de nos devoirs maison, fichiers PDF et codes sont disponibles sur : \ #link("https://github.com/andreim42/DMs-Maths-LLG")
]]

]
