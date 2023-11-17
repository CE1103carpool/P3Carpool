import java.util.*;
public class Dijkstra {
    static class Grafo {
        LinkedList<Pair<Integer>> adj[];
        int n; // Número de vertices.
        Grafo(int n) {
            this.n = n;
            adj = new LinkedList[n];
            for(int i = 0;i<n;i++) adj[i] = new LinkedList<>();
        }
        // agregar una arista dirigida entre los vértices a y b con el costo como peso
        public void agregarAristaDirigida(int a, int b, int costo) {
            adj[a].add(new Pair(b, costo));
        }
        public void agregarAristaNoDirigida(int a, int b, int costo) {
            agregarAristaDirigida(a, b, costo);
            agregarAristaDirigida(b, a, costo);
        }
    }
    static class Pair<E> {
        E first;
        E second;
        Pair(E f, E s) {
            first = f;
            second = s;
        }
    }

    // Comparador para ordenar Pares en la Cola de Prioridad
    class ComparadorPar implements Comparator<Pair<Integer>> {
        public int compare(Pair<Integer> a, Pair<Integer> b) {
            return a.second - b.second;
        }
    }

    // Calcular el camino más corto para cada vértice del origen y devuelve la distancia
    public int[] dijkstra(Grafo g, int src) {
        int distancia[] = new int[g.n]; // la distancia más corta de cada vértice desde src
        boolean visitado[] = new boolean[g.n]; // el vértice es visitado o no
        Arrays.fill(distancia, Integer.MAX_VALUE);
        Arrays.fill(visitado, false);
        PriorityQueue<Pair<Integer>> pq = new PriorityQueue<>(100, new ComparadorPar());
        pq.add(new Pair<Integer>(src, 0));
        distancia[src] = 0;
        while(!pq.isEmpty()) {
            Pair<Integer> x = pq.remove(); // Extraer el vértice con la distancia más corta desde src
            int u = x.first;
            visitado[u] = true;
            Iterator<Pair<Integer>> iter = g.adj[u].listIterator();
            // Iterar sobre los vecinos de u y actualizar sus distancias
            while(iter.hasNext()) {
                Pair<Integer> y = iter.next();
                int v = y.first;
                int peso = y.second;
                // Comprobar si el vértice v no es visitado
                // Si el nuevo camino a través de u ofrece menos costo, entonces actualizar el arreglo de distancia y agregarlo a cp
                if(!visitado[v] && distancia[u]+peso<distancia[v]) {
                    distancia[v] = distancia[u]+peso;
                    pq.add(new Pair(v, distancia[v]));
                }
            }
        }
        return distancia;
    }

    //Generar aleatoriamente esos datos
    public static void main(String args[]) {
        Dijkstra d = new Dijkstra();
        Dijkstra.Grafo g = new Grafo(4);
        g.agregarAristaNoDirigida(0, 1, 2);
        g.agregarAristaNoDirigida(1, 2, 1);
        g.agregarAristaNoDirigida(0, 3, 6);
        g.agregarAristaNoDirigida(2, 3, 1);
        g.agregarAristaNoDirigida(1, 3, 3);


        //g es el origen del gafo (la empresa en nuesto caso)
        //src es el punto de partida (del conductor)
        int dist[] = d.dijkstra(g, 0);
        System.out.println(Arrays.toString(dist));
    }
}