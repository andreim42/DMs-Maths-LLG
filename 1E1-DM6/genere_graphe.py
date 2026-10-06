import graphviz
from karma import karma

def generer_graphe():
    dot = graphviz.Digraph()

    dot.attr(nodesep='0.15')
    dot.attr(ranksep='1.2')  
    
    dot.attr(rankdir='TB')
    dot.attr('node', shape='none', fontsize='64')
    
    deja_vus = set()
    for i in range(1, 300): 
        n = i
        for _ in range(20):
            proc = karma(n)
            arc = (str(n), str(proc))
            
            if arc not in deja_vus:
                dot.edge(arc[0], arc[1])
                deja_vus.add(arc)
                
            n = proc
            if n == 1:
                if ("1", "1") not in deja_vus:
                    dot.edge("1", "1")
                    deja_vus.add(("1", "1"))
                break

    dot = dot.unflatten(stagger=3)

    dot.render('trajectoires', format='svg', cleanup=True)
    print("Graphe généré : trajectoires.svg")

if __name__ == "__main__":
    generer_graphe()