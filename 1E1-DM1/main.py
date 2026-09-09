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
    (lambda P, Q:P & Q, "cal(P) and cal(Q)"),
    (lambda P, Q:~(P & Q), "not(cal(P) and cal(Q))"),
    (lambda P, Q:~P, "not cal(P)"),
    (lambda P, Q:~Q, "not cal(Q)"),
    (lambda P, Q:(~P) | (~Q), "not cal(P) or not cal(Q)"),
]

construct_table(Logic3, variables_1c2, assertions_1c2, "1c2.csv")

variables_2a = ["cal(P)", "cal(Q)"]

assertions_2a = [
    (lambda P, Q:(~P), "not cal(P)"),
    (lambda P, Q:(~P) | Q , "not cal(P) or cal(Q)"),
    (lambda P, Q:P >> Q, "cal(P) ==> cal(Q)"),
]

construct_table(Logic3, variables_2a, assertions_2a, "2a.csv")


variables_2b = ["cal(P)", "cal(Q)"]

assertions_2b = [
    (lambda P, Q:(~P), "not cal(P)"),
    (lambda P, Q:(~Q), "not cal(Q)"),
    (lambda P, Q:P >> Q, "cal(P) ==> cal(Q)"),
    (lambda P, Q:~Q >> ~P, "not cal(Q) ==> not cal(P)"),
]

construct_table(Logic3, variables_2b, assertions_2b, "2b.csv")


variables_2c = ["cal(P)", "cal(Q)", "cal(R)"]

assertions_2c = [
    (lambda P, Q, R:P >> Q, "cal(P) ==> cal(Q)"),
    (lambda P, Q, R:Q >> R, "cal(Q) ==> cal(R)"),
    (lambda P, Q, R:(P >> Q) & (Q >> R), "(cal(P) ==> cal(Q)) and (cal(Q) ==> cal(R))"),
    (lambda P, Q, R:P >> R, "cal(P) ==> cal(R)"),
    (lambda P, Q, R:((P >> Q) & (Q >> R)) >> (P >> R), "((cal(P) ==> cal(Q)) and (cal(Q) ==> cal(R))) ==> (cal(P) ==> cal(R))"),
]

construct_table(Logic3, variables_2c, assertions_2c, "2c.csv")


variables_3a = ["cal(P)"]

assertions_3a = [
    (lambda P:~P, "not(cal(P))"),
    (lambda P:P | (~P), "cal(P) or not(cal(P))"),
]

construct_table(Logic3, variables_3a, assertions_3a, "3a.csv")


variables_3b = ["cal(P)", "cal(Q)"]

assertions_3b = [
    (lambda P, Q:P >> Q, "cal(P) ==> cal(Q)"),
    (lambda P, Q:P & (P >> Q), "cal(P) and (cal(P) ==> cal(Q))"),
    (lambda P, Q:(P & (P >> Q)) >> Q, "(cal(P) and (cal(P) ==> cal(Q))) ==> cal(Q)")
]

construct_table(Logic3, variables_3b, assertions_3b, "3b.csv")


variables_3c = ["cal(P)", "cal(Q)"]

assertions_3c = [
    (lambda P, Q:~P, "not cal(P)"),
    (lambda P, Q:P >> Q, "cal(P) ==> cal(Q)"),
    (lambda P, Q:~P >> Q, "not cal(P) ==> cal(Q)"),
    (lambda P, Q:(P >> Q) & (~P >> Q), "(cal(P) ==> cal(Q)) and (not cal(P) ==> cal(Q))"),
    (lambda P, Q:((P >> Q) & (~P >> Q)) >> Q, "((cal(P) ==> cal(Q)) and (not cal(P) ==> cal(Q))) ==> cal(Q)"),
]

construct_table(Logic3, variables_3c, assertions_3c, "3c.csv")