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

#find zeros of f(x,y) over degree 3 field extension F_8 of F_2 \isom F_2[x]/(x^3+x+1)
print g(a,a)

#arithmetic over field extensions of F_2
P.<x> = PolynomialRing(GF(2))
f = x^3 + x + 1 # Fano Polynomial
k.<a> = GF(2^3, modulus=f)
k.modulus()
x^3+x+1
a^(2^3)

#evaluate curve over F_7
E2=EllipticCurve(GF(7), [0,0,0,1,1])

#compute number of points
E2.order()
