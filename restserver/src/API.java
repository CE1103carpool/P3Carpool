
/*
* ARCHIVO DE EJEMPLO
* NO USAR
* 
* */



import com.sun.net.httpserver.HttpServer;

import java.io.*;
import java.net.InetSocketAddress;
import java.nio.charset.StandardCharsets;
import java.util.Scanner;

public class API implements Runnable{
    public API(){
        Thread escucho = new Thread(this);
        escucho.start();
    }
    public static void main(String[] args) throws IOException {
        new API();
    }

    /**
     *
     */
    @Override
    public void run() {

        try{
            HttpServer server = null;

            server = HttpServer.create(new InetSocketAddress(9999),128);

            server.createContext("/", exchange -> {
                /*
                 * Implementar metodos de get
                 * tiene que devolver un json
                 * */
                if ("GET".equals(exchange.getRequestMethod())) {
                    Scanner s = new Scanner(exchange.getRequestBody()).useDelimiter("\\A");
                    System.out.println("Scaner");
                    String jsonImput = s.hasNext() ? s.next() : "";
                    s.close();
                    System.out.println("jsonImput");
                    //JsonObject jsonObject = JsonParser.parseString(jsonImput).getAsJsonObject();
                    System.out.println("jobj");

                    //String metodo = jsonObject.get("tipoConsulta").getAsString();
                    System.out.println("metodo");

                    String responseText = "Usando POST\n" ;
                    System.out.println(responseText);
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
                    Scanner s = new Scanner(exchange.getRequestBody()).useDelimiter("\\A");
                    String jsonImput = s.hasNext() ? s.next() : "";
                    //JsonObject jobj = JsonParser.parseString(jsonImput).getAsJsonObject();
                    //String metodo = jobj.get("tipoConsulta").getAsString();
                    String responseText = "Usando POST\n" + jsonImput;
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

            server.setExecutor(java.util.concurrent.Executors.newCachedThreadPool()); // creates a default executor
            server.start();

        }
        catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}