package order.controller.yj;

import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Order_detail extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		
		
		
		
		
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/order/order_detail.jsp");
	}

}
