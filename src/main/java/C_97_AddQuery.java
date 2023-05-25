import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class C_97_AddQuery
 */
@WebServlet("/C_97_AddQuery")
public class C_97_AddQuery extends HttpServlet {

	V_97_FriendObj friendObj;
	
	public void init() {
		this.friendObj = new V_97_FriendObj();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		M_97_FriendModel friendModel = new M_97_FriendModel();
		int friendID = Integer.parseInt(request.getParameter("friendID"));
		friendModel.setFriendID(friendID);
		friendModel.setFriendName(request.getParameter("friendName"));
		friendModel.setEmailAddr(request.getParameter("emailAddr"));
		int age = Integer.parseInt(request.getParameter("age"));
		friendModel.setAge(age);
		friendModel.setFavoriteColor(request.getParameter("favoriteColor"));
		
		try {
            friendObj.registerFriend(friendModel);
            response.sendRedirect("V_97_View.jsp");
        } catch (Exception e) {
            PrintWriter out = response.getWriter();
            out.println("Error: " + e.getMessage());
        } 

	}
}
