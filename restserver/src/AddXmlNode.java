import java.io.File;
import java.util.*;
import javax.xml.transform.*;
import javax.xml.transform.stream.*;
import javax.xml.transform.dom.*;
import org.w3c.dom.*;
import javax.xml.parsers.*;

public class AddXmlNode {
    public void XMLAppend(String userCarnet,String userPassword,String userNombre,String userDireccion){
        try {
            DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
            Document document = documentBuilder.parse("archivo.xml");
            Element root = document.getDocumentElement();
            // server elements
            Element newServer = document.createElement("Employee");
            //newServer.setIdAttribute("2023",true);

            Element carnet = document.createElement("carnet");
            carnet.appendChild((document.createElement(userCarnet.toString())));
            newServer.appendChild(carnet);

            Element name = document.createElement("name");
            name.appendChild(document.createTextNode(userNombre));
            newServer.appendChild(name);

            Element password = document.createElement("password");
            password.appendChild(document.createTextNode(userPassword));
            newServer.appendChild(password);

            Element direccion = document.createElement("direccion");
            direccion.appendChild(document.createTextNode(userDireccion));
            newServer.appendChild(direccion);

            root.appendChild(newServer);


            DOMSource source = new DOMSource(document);

            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            StreamResult result = new StreamResult("archivo.xml");
            transformer.transform(source, result);
            System.out.println("adder finalizado");
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static String leerXML(String userCarnet) {
        String respuesta = "";
        try {
            DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
            Document doc = docBuilder.parse(new File("archivo.xml"));

            NodeList listaDatos = doc.getElementsByTagName("Employee");

            for (int i = 0; i < listaDatos.getLength(); i++) {
                Node nodo = listaDatos.item(i);
                if (nodo.getNodeType() == Node.ELEMENT_NODE) {
                    NodeList subcampos = nodo.getChildNodes();

                    for(j=0;j<subcampos.getLength());j++){
                        System.out.println(subcampos.item(0).getNodeValue());

                    }

                    //Node carnet = elemento.getElementsByTagName("carnet").item(0);
                    System.out.println(carnet.getNodeValue());

                    //System.out.println(elemento.getElementsByTagName("carnet").item(0).getTextContent().toString());
                    System.out.println(userCarnet);
                    if (elemento.getElementsByTagName("carnet").item(0).getTextContent() == userCarnet) {
                        System.out.println("dentro del if de obtener contraseñas");
                        respuesta= elemento.getElementsByTagName("password").item(0).getTextContent();
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return respuesta;
    }

}

