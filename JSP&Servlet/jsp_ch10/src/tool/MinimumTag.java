package tool;
import java.io.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;

public class MinimumTag extends SimpleTagSupport{
	private String var;
	private int num1, num2;
	public void setVar(String var) {
		this.var = var;
	}
	public void setNum1(Integer num1) {
		this.num1 = num1;
	}
	public void setNum2(Integer num2) {
		this.num2 = num2;
	}
	public void doTag() throws JspException, IOException {
		JspContext context = getJspContext();
		if(num1 < num2)
			context.setAttribute(var, num1);
		else
			context.setAttribute(var, num2);
		return;
	}
}
