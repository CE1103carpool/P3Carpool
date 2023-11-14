import org.w3c.dom.*;
import javax.xml.parsers.*;
import java.io.*;
import javax.xml.transform.*;
import javax.xml.transform.dom.*;
import javax.xml.transform.stream.*;

public class ManejoXML {

    public static void main(String[] args) {
        escribirXML("archivo.xml");
        leerXML("archivo.xml");
    }

    public static void escribirXML(String nombreArchivo) {
        try {
            DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
            Document doc = docBuilder.newDocument();

            Element rootElement = doc.createElement("ElementoRaiz");
            doc.appendChild(rootElement);

            Element elemento = doc.createElement("ElementoHijo");
            elemento.appendChild(doc.createTextNode("Esto es un dato"));
            rootElement.appendChild(elemento);

            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            DOMSource source = new DOMSource(doc);
            StreamResult result = new StreamResult(new File(nombreArchivo));

            transformer.transform(source, result);

            System.out.println("Metodo Escribir Completado");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void leerXML(String nombreArchivo) {
        try {
            DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
            Document doc = docBuilder.parse(new File(nombreArchivo));

            NodeList listaDatos = doc.getElementsByTagName("ElementoHijo");

            for (int i = 0; i < listaDatos.getLength(); i++) {
                Node nodo = listaDatos.item(i);
                if (nodo.getNodeType() == Node.ELEMENT_NODE) {
                    Element elemento = (Element) nodo;
                    System.out.println("Dato: " + elemento.getTextContent());
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
