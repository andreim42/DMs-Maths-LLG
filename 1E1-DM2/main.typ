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
_Analyse_ : on suppose qu'il existe une telle fonction $g$. 
====
En choisissant $m=0$, on a $g(n) = g(0) times g(n)$
donc $g(0) = 1 or g(n)=0$.

En choisissant $m=n$, on a $g(2n) = 2g(n)$, donc si $n = 0, g(0)=0$.

Donc $g(0) = 0 or g(0) = 1$ 

====
Soit $n in NN$

Supposons que $g(0) = 0$ et montrons que g est la fonction nulle par récurrence.

- #underline[*Initialisation*]: 

Pour $n=0, g(n)=g(0)=0$

- #underline[*Hérédité*]:

Soit $n in NN$.

Supposons $g(n)=0$ et montrons que $g(n+1)=0$

$g(n+1)$ peut s'écrire sous la forme $g(n) times g(1)$.

$1$ peut se décomposer en $1+0$, donc $g(1)=g(1+0)=g(1) times g(0)$

Or, $g(0)=0$, donc $g(1)=g(1) times 0=0$

Donc $g(n+1)=g(n) times 0 = 0$

- #underline[*Conclusion*] : Donc $forall n in NN, g(n)=0$, d'après le principe de récurrence.

Donc $g$ est la fonction nulle.

====
Montrons que $forall n in NN, g(0)=1 ==> g(n)=a^n #text("où") a=g(1)$ par récurrence.

- #underline[*Initialisation*] :

Pour $n=0, g(n) = g(0) = 1 = a^0$ où $a=g(1)$

- #underline[*Hérédité*] :

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

- #underline[*Conclusion*] : Donc $forall n in NN, g(n) = a^n, #text("où") a=g(1)$, d'après le principe de récurrence.

=== 
_Synthese_ :
Soit $m,n in NN$, 

Posons

$g: &NN -> NN \
&x mapsto 0$ \
$ g(m+n)=0 times 0 = g(m) times g(n) $

\
Posons désormais 

$g : &NN -> NN \
&x mapsto g(1)^x$

$ m+n=x ==> g(m+n) = g(1)^(n+m) = g(1)^n times g(1)^m = g(n) times g(m) $

_Conclusion_ :\
Les fonctions 

$ g : &NN -> NN \
&x mapsto g(1)^x $ et 

$ g: &NN -> NN \
&x mapsto 0 $
sont les seules fonctions $g : NN -> NN$ telles que $forall n, m in NN$, $g(m+n)=g(m) times g(n)$.

==
On cherche à déterminer toutes les fonctions $f : NN -> NN$ telles que :\
- $f(1) = 1$\
- $forall m, n in NN, f(m+n)=f(m) times f(n) + f(n) + f(m)$.
===
_Analyse_: On suppose qu'une telle fonction $f$ existe.

====
$
f(m+n)=f(m) times f(n) + f(n) + f(m) <==>
f(m+n) = (f(m)+1)(f(n)+1)-1
$

Si $m=n=0$, alors $f(0)=f(0)^2+2f(0)$

Donc $-f(0)=f(0)^2$

Donc $f(0)=-f(0)^2$

Donc $f(0)=0$
====
Si $m=n=1$, alors

$
f(2)&=(f(1)+1)(f(1)+1)-1\
&=(1+1)(1+1)-1\
&=3
$




Si $m=1 and n=2$, alors

$
f(3)&=(f(1)+1)(f(2)+1)-1\
&=(1+1)(3+1)-1\
&=7
$

Si $m=n=3$, alors

$
f(6)&=(f(3)+1)(f(3)+1)-1\
&=(7+1)(7+1)-1\
&=63
$
====
Montrons que $forall n in NN, f(n+1)=2f(n)+1$

Soit $n in NN$.

$
f(n+1)&=(f(n)+1)(f(1)+1)-1\
&=2(f(n)+1)-1\
&=2f(n)+1
$

Donc $f(n+1)=2f(n)-1$

====
Soit $n, m in NN and g(x)=f(x)+1$.

$
g(m+n)&=f(m+n)+1\
&=f(m) times f(n)+f(n)+f(m)+1\
&=f(n)(f(m)+1)+(f(m)+1)\
&=(f(n)+1) times (f(m)+1)\
&=g(n) times g(m)
$

====
$g(n)=f(n)+1$

Donc $
f(n)&=g(n)-1\
&=g(1)^n-1\
&=(f(1)+1)^n-1\
&=2^n-1\
$

===
_Synthèse_ : \
Posons 

$f : &NN -> NN\
&x mapsto 2^x-1$

Soit $m, n, x in NN$, tels que $m+n=x$

$
f(x)&=f(m+n)\
&=2^(m+n)-1\
&=2^n times 2^m - 1\
&=(f(n)+1) times (f(m)+1) -1\
&=f(n) times f(m) + f(n)+ f(m)+1-1\
&=f(n) times f(m) + f(n)+ f(m)
$

_Conclusion:_\
La fonction \
$
f: &NN -> NN\
&x mapsto 2^x-1
$
est la seule fonction $f : &NN -> NN$ telle que $f(m+n)=f(m) times f(n)+ f(n)+f(m)$.

= Nombres échangeables

===
Choisissons $a = 3$ et $b = -2$, on a alors $f_(3, -2) (3) = 3 - sqrt(3 - 2) = 2$ et $f_(3, -2)(2) = 3 - sqrt(2 - 2) = 3$. Donc $2$ et $3$ sont bien échangeables.

===
Soient $a, b in RR$. Soient $x, y in [-b, +infinity[$. Supposons que $x$ et $y$ sont échangeables, i.e. on a que $f_(a, b)(x) = y$ et $f_(a, b)(y) = x$.

- Supposons que $x = y$, on a alors $abs(x - y) <= 1$ donc la propriété est vérifiée.

- Supposons que $x != y$, on a alors,

$
cases(
  a - sqrt(x + b) = y,
  a - sqrt(y + b) = x
)
$

Donc $(a - sqrt(x + b)) - (a - sqrt(y + b)) = sqrt(y + b) - sqrt(x + b ) = y - x$ 

Supposons spdg que $x < y$.

D'où $y - x = abs(x - y) = sqrt(y + b) - sqrt(x + b)$

De plus, $y - x = (y + b) - (x + b) = (sqrt(y + b) - sqrt(x + b))(sqrt(y + b) + sqrt(x + b))$ (car $x$ et $y$ sont définis sur $[-b, +infinity[$ et $y + b$ et $x + b$ sont donc positifs).

Donc $sqrt(y + b) + sqrt(x + b) =^(x != y) (y - x)/(sqrt(y + b) - sqrt(x + b)) = (y - x) / (y - x) = 1$

Donc $0 <= y + b <= 1$ et $0 <= x + b <= 1$.
Donc $0 >= -(x + b) >= -1$.
Donc $-1 <= -(x + b) <= 0$.

Donc $-1 <= y - x <= 1$. Donc $abs(x - y) <= 1$.

Ainsi, dans tous les cas si $x$ et $y$ sont échangeables, alors $abs(x - y) <= 1$.

===
Soient $x, y in RR$. Supposons que $abs(x - y) <= 1$.

Soit $k = 1 - y + x$.
Supposons spdg que $x <= y$. Choisissons $a = y + k/2$ et $b = k^2/4 - x$.

#underline[Justifions l'existence de $sqrt(x + b)$ et $sqrt(y + b)$ :]

On a $abs(x - y) <= 1$, donc $y - x <= 1$, donc $1 - k <= 1$, donc $k >= 0$.

On a $x + b = x + k^2/4 - x = (k/2)^2 >= 0$ car un carré est toujours positif. Donc $sqrt(x + b)$ existe.

De plus, $y + b = y + k^2/4 - x = 1 - k + k^2/4 = (k^2 - 4k + 4)/4 = ((k - 2)/2)^2 >= 0$. Donc $sqrt(y + b)$ existe.

#pagebreak()

#underline[Montrons que $x$ et $y$ sont échangeables :]

On a alors $f_(a, b)(x) = a - sqrt(x + b) = (y + k/2) - sqrt(x + (k^2)/4 - x) = y + k/2 - k/2 = y$ et

$f_(a, b)(y) = a - sqrt(y + b) = (y + k/2) - sqrt(y + k^2/4 - x) = y + k/2 - sqrt((k^2 - 4k + 4)/4) = y + k/2 - sqrt((k - 2)^2/4) = y + k/2 - (2 - k)/2$

$= y + (k - (2 - k))/2 = y + (2k - 2)/2 = y + k - 1 = y + 1 - y + x - 1 = x$.

Donc on a bien $f_(a, b)(x) = y$ et $f_(a, b)(y) = x$. Ainsi, $x$ et $y$ sont bien échangeables.

#align(center)[#align(bottom)[
L'ensemble de nos devoirs maison, fichiers PDF et codes sont disponibles sur : \ #link("https://github.com/andreim42/DMs-Maths-LLG")
]]

]