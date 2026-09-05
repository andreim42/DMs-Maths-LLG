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

variables_1c1 = ["cal(P)", "cal(Q)"]

assertions_1c1 = [
    (lambda P, Q:P | Q, "cal(P) or cal(Q)"),
    (lambda P, Q:~(P | Q), "not(cal(P) or cal(Q))"),
    (lambda P, Q:~P, "not cal(P)"),
    (lambda P, Q:~Q, "not cal(Q)"),
    (lambda P, Q:(~P) & (~Q), "not cal(P) and not cal(Q)"),
]

construct_table(Logic3, variables_1c1, assertions_1c1, "1c1.csv")

variables_1c2 = ["cal(P)", "cal(Q)"]

assertions_1c2 = [
    (lambda P, Q:P | Q, "cal(P) and cal(Q)"),
    (lambda P, Q:~(P | Q), "not(cal(P) and cal(Q))"),
    (lambda P, Q:~P, "not cal(P)"),
    (lambda P, Q:~Q, "not cal(Q)"),
    (lambda P, Q:(~P) & (~Q), "not cal(P) or not cal(Q)"),
]

construct_table(Logic3, variables_1c2, assertions_1c2, "1c2.csv")