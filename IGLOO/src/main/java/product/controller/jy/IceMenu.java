package product.controller.jy;

import common.controller.AbstractController;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import product.model.jy.MenuDAO;
import product.model.jy.MenuDAO_imple;


public class IceMenu extends AbstractController {

	private MenuDAO mdao = null;
	
	public IceMenu() {
		mdao = new MenuDAO_imple();
	}

	
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		
		
		
		setViewPage("/WEB-INF/product/iceMenu.jsp");

	}

}