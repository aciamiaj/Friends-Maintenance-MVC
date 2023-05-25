import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class V_97_FriendObj {
	
	Connection con;
	
	public V_97_FriendObj() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String dburl = "jdbc:mysql://localhost:3306/w11_jaimaica";
			String uname = "root";
			String password = "navarr0Jds1..";
		    
			this.con = DriverManager.getConnection(dburl, uname, password);
		    
		} catch(Exception e) {
			
		}
	}
	

	public int registerFriend(M_97_FriendModel friend) throws Exception {
		if (friend.getFriendName() == null) {
		String insertQuery = "INSERT INTO friends VALUES(?,?,?,?,?);";
		PreparedStatement prd = con.prepareStatement(insertQuery);
		prd.setInt(1, friend.getFriendID());
		prd.setString(2, friend.getFriendName());
		prd.setString(3, friend.getEmailAddr());
		prd.setInt(4, friend.getAge());
		prd.setString(5, friend.getFavoriteColor());
		
		return prd.executeUpdate();
		}
		else {
			throw new Exception("Friend Name cannot be null");
		}
	}
	
	public int deleteFriend(M_97_FriendModel friend) throws Exception {
		if (friend.getFriendName() == null) {
	    String deleteQuery = "DELETE FROM friends WHERE friendID = ?";
	    PreparedStatement prd = con.prepareStatement(deleteQuery);
	    prd.setInt(1, friend.getFriendID());
	    int rowsDeleted = prd.executeUpdate();
	    prd.close();
	    return rowsDeleted;
		}
		else {
			throw new Exception("Friend Name cannot be null");
		}
	}
}
