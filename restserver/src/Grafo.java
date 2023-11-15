import java.util.*;

public class Grafo {
    private int vertices;
    private Map<Integer, List<Integer>> listaAdyacencia;

    public Grafo(int vertices) {
        this.vertices = vertices;
        this.listaAdyacencia = new HashMap<>();
        for (int i = 0; i < vertices; i++) {
            listaAdyacencia.put(i, new LinkedList<>());
        }
    }

    public void agregarArista(int origen, int destino) {
        // Agregar una arista en ambas direcciones (grafo no dirigido)
        listaAdyacencia.get(origen).add(destino);
        listaAdyacencia.get(destino).add(origen);
    }

    public void imprimirGrafo() {
        for (Map.Entry<Integer, List<Integer>> entry : listaAdyacencia.entrySet()) {
            System.out.print("Vertice " + entry.getKey() + " está conectado a: ");
            for (Integer vecino : entry.getValue()) {
                System.out.print(vecino + " ");
            }
            System.out.println();
        }
    }

    public static void main(String[] args) {
        Grafo grafo = new Grafo(5);

        grafo.agregarArista(0, 1);
        grafo.agregarArista(0, 4);
        grafo.agregarArista(1, 2);
        grafo.agregarArista(1, 3);
        grafo.agregarArista(1, 4);
        grafo.agregarArista(2, 3);
        grafo.agregarArista(3, 4);

        grafo.imprimirGrafo();
    }
}
