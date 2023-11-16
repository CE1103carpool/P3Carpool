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

    public Server() {
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
    private JSONObject handleGet(JSONObject myJson){
        JSONObject respuesta = new JSONObject();
        String metodo = (String) myJson.get("tipoConsulta");
        if(metodo.equals("login")){
            String carnet = (String) myJson.get("carne").toString();
            String password = (String) myJson.get("password").toString();
            if (carnet.equals("2023") && password.equals("pws")){
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
            String carnet = (String) myJson.get("carne").toString();
            String password = (String) myJson.get("password").toString();
            String nombre = (String) myJson.get("nombre").toString();
            String direccion = (String) myJson.get("direccion").toString();

            //metodos del xml
                respuesta.put("respuesta","exito");
                respuesta.put("error","no");
                System.out.println("registro exitoso");

        }
        return respuesta;
    }
    @Override
    public void handle(HttpExchange exchange) throws IOException
    {
        if ("POST".equals(exchange.getRequestMethod())) {
            JSONObject myJson = getJsonBody(exchange.getRequestBody());

            JSONObject responseJson = handleGet(myJson);

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
