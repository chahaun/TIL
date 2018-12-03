package tool;
import java.io.*;
import java.util.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;

public class NewLineTag extends SimpleTagSupport implements DynamicAttributes {
	private Map<String,Object> attrs = new HashMap<String,Object>();
    public void setDynamicAttribute(String uri, String localName, Object value) throws JspException {
             attrs.put(localName, value);
    }

    public void doTag() throws JspException, IOException {
    	String color = (String) attrs.get("color");
        int size = Integer.parseInt((String) attrs.get("size"));
        JspContext context = getJspContext();
        JspWriter out = context.getOut();
        out.println( "<FONT color= " + color + "> ");
        for (int cnt = 0; cnt < size; cnt++) {
              out.print("*");
        }
        out.println("</FONT><BR>");
        return;
    }
}
