import com.sun.net.httpserver.HttpServer;

import java.io.*;
import java.net.InetSocketAddress;
import java.nio.charset.StandardCharsets;
import java.util.Scanner;

public class API {
    public static void main(String[] args) throws IOException {
        HttpServer server = HttpServer.create(new InetSocketAddress(9999), 0);
        server.createContext("/", exchange -> {
            /*
            * Implementar metodos de get
            * tiene que devolver un json
            * */
            if ("GET".equals(exchange.getRequestMethod())) {
                String responseText = "Usando GET\n";
                exchange.sendResponseHeaders(200, responseText.getBytes().length);
                OutputStream output = exchange.getResponseBody();
                output.write(responseText.getBytes());
                output.flush();

                /*
                * Implementat metodos post
                * no devuelve nada
                * recibe un json
                * */

            } else if (("POST".equals(exchange.getRequestMethod()))) {
                System.out.println("Hello World");
                Scanner s = new Scanner(exchange.getRequestBody()).useDelimiter("\\A");
                String result = s.hasNext() ? s.next() : "";
                System.out.println("Hello World 2");
                String responseText = "Usando POST\n" + result;
                System.out.println(responseText);
                exchange.sendResponseHeaders(200, responseText.getBytes().length);
                OutputStream output = exchange.getResponseBody();
                output.write(responseText.getBytes());
                output.flush();
            } else {
                exchange.sendResponseHeaders(405, -1);// 405 Method Not Allowed
            }
            exchange.close();
        });

        server.setExecutor(null); // creates a default executor
        server.start();
    }
}