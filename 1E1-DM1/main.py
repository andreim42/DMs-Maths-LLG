from engine.constructor import construct_table
from logics import Logic3

variables_1a = ["cal(P)", "cal(Q)"]

assertions_1a = [
    (lambda P, Q:P & Q, "cal(P) and cal(Q)"),
    (lambda P, Q:Q & P, "cal(Q) and cal(P)"),
]

construct_table(Logic3, variables_1a, assertions_1a, "1a.csv")

variables_1b = ["cal(P)", "cal(Q)", "cal(R)"]

assertions_1b = [
    (lambda P, Q, R:P & Q, "cal(P) and cal(Q)"),
    (lambda P, Q, R:Q & R, "cal(Q) and cal(R)"),
    (lambda P, Q, R:(P & Q) & R, "(cal(P) and cal(Q)) and cal(R)"),
    (lambda P, Q, R:P & (Q & R), "cal(P) and (cal(Q) and cal(R))"),
]

construct_table(Logic3, variables_1b, assertions_1b, "1b.csv")