import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpServer;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.util.Scanner;

public class Server implements Runnable{

    Dijkstra d;
    Dijkstra.Grafo g;



    public Server() {
        d=new Dijkstra();
        g = new Dijkstra.Grafo(30);
        g.agregarAristaNoDirigida(0, 1, 2);
        g.agregarAristaNoDirigida(1, 2, 1);
        g.agregarAristaNoDirigida(0, 3, 6);
        g.agregarAristaNoDirigida(2, 3, 1);
        g.agregarAristaNoDirigida(1, 3, 3);
        g.agregarAristaNoDirigida(0, 1, 2);
        g.agregarAristaNoDirigida(1, 2, 1);
        g.agregarAristaNoDirigida(0, 3, 6);
        g.agregarAristaNoDirigida(2, 3, 1);
        g.agregarAristaNoDirigida(1, 3, 3);
        g.agregarAristaNoDirigida(0, 1, 2);
        g.agregarAristaNoDirigida(1, 2, 1);
        g.agregarAristaNoDirigida(0, 3, 6);
        g.agregarAristaNoDirigida(2, 3, 1);
        g.agregarAristaNoDirigida(1, 3, 3);
        g.agregarAristaNoDirigida(0, 1, 2);
        g.agregarAristaNoDirigida(1, 2, 1);
        g.agregarAristaNoDirigida(0, 3, 6);
        g.agregarAristaNoDirigida(2, 3, 1);
        g.agregarAristaNoDirigida(1, 3, 3);
        g.agregarAristaNoDirigida(0, 1, 2);
        g.agregarAristaNoDirigida(1, 2, 1);
        g.agregarAristaNoDirigida(0, 3, 6);
        g.agregarAristaNoDirigida(2, 3, 1);
        g.agregarAristaNoDirigida(1, 3, 3);
        g.agregarAristaNoDirigida(0, 1, 2);
        g.agregarAristaNoDirigida(1, 2, 1);
        g.agregarAristaNoDirigida(0, 3, 6);
        g.agregarAristaNoDirigida(2, 3, 1);
        g.agregarAristaNoDirigida(1, 3, 3);
        g.agregarAristaNoDirigida(0, 1, 2);
        g.agregarAristaNoDirigida(1, 2, 1);
        g.agregarAristaNoDirigida(0, 3, 6);
        g.agregarAristaNoDirigida(2, 3, 1);
        g.agregarAristaNoDirigida(1, 3, 3);
        g.agregarAristaNoDirigida(0, 1, 2);
        g.agregarAristaNoDirigida(1, 2, 1);
        g.agregarAristaNoDirigida(0, 3, 6);
        g.agregarAristaNoDirigida(2, 3, 1);
        g.agregarAristaNoDirigida(1, 3, 3);
        g.agregarAristaNoDirigida(0, 1, 2);
        g.agregarAristaNoDirigida(1, 2, 1);
        g.agregarAristaNoDirigida(0, 3, 6);
        g.agregarAristaNoDirigida(2, 3, 1);
        g.agregarAristaNoDirigida(1, 3, 3);
        g.agregarAristaNoDirigida(0, 1, 2);
        g.agregarAristaNoDirigida(1, 2, 1);
        g.agregarAristaNoDirigida(0, 3, 6);
        g.agregarAristaNoDirigida(2, 3, 1);
        g.agregarAristaNoDirigida(1, 3, 3);
        g.agregarAristaNoDirigida(0, 1, 2);
        g.agregarAristaNoDirigida(1, 2, 1);
        g.agregarAristaNoDirigida(0, 3, 6);
        g.agregarAristaNoDirigida(2, 3, 1);
        Thread escucho = new Thread(this);
        escucho.start();
    }
    @Override
    public void run() {
        try {
            HttpServer apiServer = HttpServer.create(new InetSocketAddress(9999),128);
            System.out.println("Servidor abierto");
            apiServer.createContext("/",new SimpleHandler());
            apiServer.setExecutor(null);
            apiServer.start();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
class SimpleHandler implements HttpHandler

{
    AddXmlNode adder = new AddXmlNode();
    private JSONObject getJsonBody(InputStream body){
        Scanner s = new Scanner(body).useDelimiter("\\A");
        String jsonImput = s.hasNext() ? s.next() : "";
        s.close();
        JSONParser parser = new JSONParser();
        JSONObject jsonObject;
        try {
            jsonObject = (JSONObject) parser.parse(jsonImput);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        return jsonObject;
    }
    private JSONObject handleGet(JSONObject myJson) throws InterruptedException {
        System.out.println("handle metodo aceptado");
        JSONObject respuesta = new JSONObject();
        String metodo = (String) myJson.get("tipoConsulta");
        if(metodo.equals("login")){
<<<<<<< HEAD
            System.out.println("metodo login");
            String carnet = (String) myJson.get("carnet").toString();
            System.out.println("carnet obtenido");
=======
            String carnet = (String) myJson.get("carnet").toString();
>>>>>>> edf8104a45bee53c5a471dbe31b6f887613efd8d
            String password = (String) myJson.get("password").toString();
            String contrasennaServer = adder.leerXML(carnet);
            System.out.println("password: "+password);
            System.out.println("contra: " +contrasennaServer);
            if (password.equals(contrasennaServer)){
                respuesta.put("respuesta","exito");
                respuesta.put("error","no");
                System.out.println("login exitoso");
            }
            else{
                respuesta.put("respuesta","error");
                respuesta.put("error","error de credenciales");
                System.out.println("login error");
            }
        }
        else if(metodo.equals("register")){
            String carnet = (String) myJson.get("carnet").toString();
            String password = (String) myJson.get("password").toString();
            String nombre = (String) myJson.get("name").toString();
            String direccion = (String) myJson.get("direccion").toString();
            adder.XMLAppend(carnet,password,nombre,direccion);


            //metodos del xml
                respuesta.put("respuesta","exito");
                respuesta.put("error","no");
                System.out.println("registro exitoso");
        }
        else if(metodo.equals("solicitarConductor")){
            //checar conductor
            while (true){

            }
        }
        else if(metodo.equals("buscarCarro")){
            int numero=5;
<<<<<<< HEAD
            //if (random.net)
=======
>>>>>>> edf8104a45bee53c5a471dbe31b6f887613efd8d
        }
        return respuesta;
    }
    @Override
    public void handle(HttpExchange exchange) throws IOException
    {
        System.out.println("handle");
        if ("POST".equals(exchange.getRequestMethod())) {
            System.out.println("post");
            JSONObject myJson = getJsonBody(exchange.getRequestBody());

            JSONObject responseJson = null;
            try {
                System.out.println("Handle method");
                responseJson = handleGet(myJson);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }

            exchange.sendResponseHeaders(200, responseJson.toJSONString().getBytes().length);


            OutputStream output = exchange.getResponseBody();
            output.write(responseJson.toJSONString().getBytes());
            output.flush();

            /*
             * Implementat metodos post
             * no devuelve nada
             * recibe un json
             * */

        } else if (("GET".equals(exchange.getRequestMethod()))) {
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
    }
}
