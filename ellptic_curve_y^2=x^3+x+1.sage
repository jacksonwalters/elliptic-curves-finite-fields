#elliptic curve y^2=x^3+x+1 in normal form
E=EllipticCurve([0,0,0,1,1])
E.rank()

#compute torsion points
E.torsion_points()

#curve is singular over F_2
E2=EllipticCurve(GF(2), [0,0,0,1,1])

#evaluate curve over F_7
E2=EllipticCurve(GF(7), [0,0,0,1,1])

#compute number of points
E2.order()
