#elliptic curve y^2=x^3+x+1 in normal form
E=EllipticCurve([0,0,0,1,1])
E.rank()

#compute torsion points
E.torsion_points()

#curve is singular over F_2
#E2=EllipticCurve(GF(2), [0,0,0,1,1])

#we can still compute the number of points over extensions F_2.
#let's compute for fields where the exponent m of 2^m divides the exponent n of 2^n
#find points of curve over extensions of F_2^1, e.g. F_2^2=4, F_2^4=16, F_2^5=32
def g(x,y):
    return y^2-x^3+x+1

#arithmetic over field extensions of F_2
P.<x> = PolynomialRing(GF(2))
f = x^3 + x + 1 # Fano Polynomial
k.<a> = GF(2^3, modulus=f)
k.modulus()
x^3+x+1
a^(2^3)

#find zeros of f(x,y) over degree 3 field extension F_8 of F_2 \isom F_2[x]/(x^3+x+1)
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
number_of_points_over_extensions_of_F_7 = []
for n in range(1,100):
    number_of_points_over_extensions_of_F_7+=[EllipticCurve(GF(7^n), [0,0,0,1,1]).order()]

#build the Zeta function for the finite field F_7 and the elliptic curve y^2=x^3+x+1
#the shape of the Zeta function should be something like (1-\alpha*T)*(1-\beta*T)/((1-T)*(1-qT)) where
#q is the order of the finite field of interest, for instance q=7^m. Setting m=1, we can look at q=7.
#What are the complex numbers \alpha and \beta?

#let's examine the algebraic variety E3 over the finite field F_7, and compute an approximation of the Zeta function
def zeta(q,T):
    exp(1)
