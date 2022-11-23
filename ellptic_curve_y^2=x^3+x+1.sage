#elliptic curve y^2=x^3+x+1 in normal form
E=EllipticCurve([0,0,0,1,1])
E.rank()

#compute torsion points
E.torsion_points()

#curve is not smooth over F_2, so not elliptic
#E2=EllipticCurve(GF(2), [0,0,0,1,1]) returns an error appropriately
#it has a singularity at the origin since both partial derivatives vanish there

#we can still compute the number of points over extensions F_2.
#let's compute for fields where the exponent m of 2^m divides the exponent n of 2^n
#find points of curve over extensions of F_2^1, e.g. F_2^2=4, F_2^4=16, F_2^5=32
def g(x,y):
    return y^2-x^3+x+1

#after the change of variables x->x+1, y->y+1, we obtain the curve y^2=x^2(x+1)
Q.<x,y> = PolynomialRing(GF(2))
show(g(x+1,y+1))

#arithmetic over field extensions of F_2
P.<x> = PolynomialRing(GF(2))
f = x^3 + x + 1 # Fano Polynomial
k.<a> = GF(2^3, modulus=f
k.modulus()
x^3+x+1
a^(2^3)

#find zeros of f(x,y) over degree 3 field extension F_8 of F_2 \isom F_2[x]/(x^3+x+1)
print("Finding zeros of f(x,y)=y^2-x^3-x-1 ...")
[g(0,0),g(1,0),g(0,1),g(1,1),g(a,0),g(a,1),g(a,a),g(a,a^2),g(a,a^3)]

#perform a grid search for points over F_8
solutions_over_F_8 = []
for i in range(8):
    for j in range(8):
        if g(a^i,a^j) == 0:
            solutions_over_F_8.append((i,j))
print(solutions_over_F_8)

#evaluate curve over F_7
E2=EllipticCurve(GF(7), [0,0,0,1,1])

#compute number of points
E2.order()

#the Zeta function over F_7 is a rational function of T. What is it? Only need q^n for all n.
#for algebraic closure of F_7, \union_{m|n}F_7^m. Dylan Yott? Community seminar? Is this a bug?
#dividing_exponents_seven = [7^1,7^2,7^4,7^8]
#Rob: the number of points over 7^n are determined by the number of points over F_7, and \alpha, \beta
N=10
number_of_points_over_extensions_of_F_7 = []
for n in range(1,N):
    number_of_points_over_extensions_of_F_7+=[EllipticCurve(GF(7^n), [0,0,0,1,1]).order()]

#build the Zeta function for the finite field F_7 and the elliptic curve y^2=x^3+x+1
#the shape of the Zeta function should be something like (1-\alpha*T)*(1-\beta*T)/((1-T)*(1-qT)) where
#q is the order of the finite field of interest, for instance q=7^m. Setting m=1, we can look at q=7.
#What are the complex numbers \alpha and \beta?

#let's examine the algebraic variety E3 over the finite field F_7, and compute an approximation of the Zeta function
var('T')
def zeta(q,T):
    return sum(exp(number_of_points_over_extensions_of_F_7[n]*T**n/n) for n in range(1,N-2))

#zeta(7,T) = (1-\alpha*T)(1-\beta*T)/((1-T)*(1-qT)) thanks to Joe Silverman.
#\alpha = (3+\sqrt{19}*i)/14, \beta = \overline{\alpha}
#define the Zeta function using the formulas found in Silverman, pp. 140 - 144
#compute \alpha and \beta
n_7 = number_of_points_over_extensions_of_F_7[0]
a_7 = 7+1-n_7
h(T)=1-a_7*T+7*T^2
alpha=h(T).roots()[1][0]
beta=h(T).roots()[0][0]
def zeta_silverman(q,T):
    return (1-alpha*T)*(1-beta*T)/((1-T)*(1-q*T))

#computes the Zeta function of y^2=x^3+x+1 over F_7
print("The Zeta function of the elliptic curves y^2=x^3+x+1 over F_7 is ...")
print(zeta_silverman(7,T))

#the number of points over extensions of F_7 can be computed by evaluating the n-th derivative of the zeta function
zeta_diff = lambda T : diff(zeta_silverman(7,T),T)
