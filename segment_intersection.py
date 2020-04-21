from __future__ import division
import numpy as np


def degenerateCases(p1, p2, p3, p4):
    """Computes degerate cases of the intersection of two segments"""

    if ( ( p2[0] - p1[0] ) == 0 ) and ( ( p2[1] - p1[1] ) == 0 ) and \
       ((p4[0] - p3[0]) == 0) and ((p4[1] - p3[1]) == 0):
        # We have intersection of two points.
        if (p1[0] == p3[0]) and (p1[1] == p3[1]):
            # Both are the same point.
            return p1
        else:
            # Both are diferents points
            return None
    if (p2[0] - p1[0]) == 0 and (p4[0] - p3[0]) == 0:
        # We have two vertical segments
        if p1[0] - p3[0] == 0:
            # Both are in the same vertical
            if max(p1[1], p2[1]) <= max(p3[1], p4[1]) and max(p1[1], p2[1]) >= min(p3[1], p4[1]):
                # If the max of first segment is between the edges of the other, they intersect
                return [p1[0], max(p1[1], p2[1])]
            elif min(p1[1], p2[1]) <= max(p3[1], p4[1]) and min(p1[1], p2[1]) >= min(p3[1], p4[1]):
                # If the min of first segment is between the edges of the other, they intersect
                return [p1[0], min(p1[1], p2[1])]
            else:
                # Otherwise they don't intersect
                return None
        else:
            return None

    if (p2[1] - p1[1]) == 0 and (p4[1] - p3[1]) == 0:
        # We have two horizontal segments
        if p1[1] - p3[1] == 0:
            # Both are in the same horizontal
            if max(p1[0], p2[0]) <= max(p3[0], p4[0]) and max(p1[0], p2[0]) >= min(p3[0], p4[0]):
                # If the max of first segment is between the edges of the other, they intersect
                return [max(p1[0], p2[0]), p1[1]]
            if min(p1[0], p2[0]) <= max(p3[0], p4[0]) and min(p1[0], p2[0]) >= min(p3[0], p4[0]):
                # If the min of first segment is between the edges of the other, they intersect
                return [min(p1[0], p2[0]), p1[1]]
            else:
                return None
        else:
            return None


def intersectSegments(p1, p2, p3, p4):
    """Takes four points, the first two defines a segment and 
    the other two defines another.
    Returns the intersection of both segments if it exists, None if
    it doesn't.

    Note
    -----
    Equation of the intersection of two lines defined by the segments:
    p1 + lambda * (p2 - p1) = p3 + mu * (p4 - p3)

    Solution using symbolic computation:
    from sympy import solve, symbols, Eq
    x, y = symbols('x y')
    
    sol = solve([Eq(p1[0] + x * (p2[0] - p1[0]), p3[0] + y * (p4[0] - p3[0])),
                 Eq(p1[1] + x * (p2[1] - p1[1]), p3[1] + y * (p4[1] - p3[1]))], [x, y])

    Parameters
    ----------
    p1, p2
        Edges of the first segment.
    p3, p4
        Edges of the second segment.

    Returns:
    ----------
    p
        The intersection of the segments. None if there is not intersection.
"""

    if ((p2[0] - p1[0]) == 0 and (p4[0] - p3[0]) == 0)or((p2[1] - p1[1]) == 0 and (p4[1] - p3[1]) == 0):
        #Degenerate cases: two vertical segments, two horizontal or two points
        return degenerateCases(p1, p2, p3, p4)

    # We use the manual solution of the sistem.

    # Leading vector of the first line
    u = p2 - p1
    # Leading vector of the second line
    v = p4 - p3

    # Extra check that assures there won't be any problems with 0 division
    # This is the case when we have parallel not degenerates segments
    if (v[0] * u[1] - u[0] * v[1]) == 0 or u[0] == 0:
        # We should check if they overlap, but it's not 
        # necessary for Bezier curves intersection
        return None

    # Solution of the intersection of two lines in R2
    # We solved it manually and obtained this solution
    mu = ((p3[1] - p1[1]) * u[0] - u[1] * (p3[0] - p1[0])) / (v[0] * u[1] - u[0] * v[1])
    lam = ((p3[0] - p1[0]) + mu * v[0]) / u[0]

    # Checks if the intersection is in the segments, not out in the lines that they define
    if (lam <= 1) and (lam >= 0) and (mu <= 1) and (mu >= 0):
        """Como tomamos p1 y el vector p1-p2, el lambda de la interseccion
        debe estar entre 0 y 1, es decir dentro del segmento"""
        # Both segments intersect in a point
        return np.array(p1 + lam * (p2 - p1))
    else:
        # There's not intersection
        return None
