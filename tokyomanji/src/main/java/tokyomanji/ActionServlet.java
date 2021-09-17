package tokyomanji;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ActionServlet")
public class ActionServlet extends HttpServlet {
	private String jdbcURL = "jdbc:mysql://localhost:3306/toman";
	private String jdbcUsername = "root";
	private String jdbcPassword = "";
	
	private static final String SELECT_MEMBER_BY_NAME = "select * from members where name =?";
	private static final String SELECT_ALL_MEMBERS = "SELECT * FROM members";
	private static final String DELETE_MEMBER_SQL = "delete from members where name = ?;";
	private static final String UPDATE_MEMBER_SQL = "update members set name = ?,rank = ?, tattoo=? where name = ?;";
		
	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
	 	}
		return connection;
	}
	
    public ActionServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getServletPath();
		System.out.println("Action is: " + action);
		
		try {
			switch(action) {
			case "/ActionServlet/add":
				showAddMember(request, response);
				break;
			case "/ActionServlet/delete":
				deleteMember(request, response);
				break;
			case "/ActionServlet/edit":
				showEditGang(request, response);
				break;
			case "/ActionServlet/update":
				updateMember(request, response);
				break;
				
			default:
				listMembers(request,response);
				break;
			}
		 } catch (SQLException ex) {
			 throw new ServletException(ex);
		 }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
	
	private void listMembers(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		List < Member > members = new ArrayList <Member> ();	
		try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_MEMBERS);) 
		{
			System.out.println(preparedStatement);
			
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();
			
			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String name = rs.getString("name");
				String rank = rs.getString("rank");
				String tattoo = rs.getString("tattoo");
				members.add(new Member(name, rank,tattoo));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
			
			System.out.println("Total : " + members.size());
			
			request.setAttribute("listMembers", members);
			RequestDispatcher dispatcher = request.getRequestDispatcher("gangManagement.jsp");
			dispatcher.forward(request, response);
	}
	
	//method to redirect to add page
	private void showAddMember(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("addMember.jsp");
		dispatcher.forward(request, response);
	}
	
	//method to get parameter, query database for existing 
	private void showEditGang(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		
		System.out.println("Directing to showEditGang...");
		
		String name = request.getParameter("name");
		
		Member existingMember = new Member();
		
		try (Connection connection = getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(SELECT_MEMBER_BY_NAME);)
		{
			preparedStatement.setString(1, name);
			
			System.out.println(preparedStatement);
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				name = rs.getString("name");
				String rank = rs.getString("rank");
				String tattoo = rs.getString("tattoo");
				existingMember = new Member(name, rank, tattoo);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		//Serve up the product-form.jsp
		request.setAttribute("member", existingMember);
		request.getRequestDispatcher("/editMember.jsp").forward(request, response);

	}
	//method to update the user data
	private void updateMember(HttpServletRequest request, HttpServletResponse response)
	throws SQLException, IOException, ServletException {
		System.out.println("Directing to updateMember...");
		//get values from the request
		String oriMemberName = request.getParameter("oriMemberName");
		String name = request.getParameter("name");
		String rank = request.getParameter("rank");
		String tattoo = request.getParameter("tattoo");
		System.out.println(name);
		System.out.println(rank);
		//database operation
		try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_MEMBER_SQL);) {
			statement.setString(1, name);
			statement.setString(2, rank);
			statement.setString(3, tattoo);
			statement.setString(4, oriMemberName);
			statement.executeUpdate();
		}
		response.sendRedirect("/tokyomanji/ActionServlet");
	}
	
	//method to delete user
	private void deleteMember(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		System.out.println("Deleting Member...");
		String name = request.getParameter("name");
		try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_MEMBER_SQL);) 
		{
			statement.setString(1, name);
			statement.executeUpdate();
		}
		response.sendRedirect("/tokyomanji/ActionServlet");
	}
	
}
