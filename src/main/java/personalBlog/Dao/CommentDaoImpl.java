package personalBlog.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import personalBlog.Model.Comment;

@Repository
public class CommentDaoImpl implements CommentDao {

	@Autowired
	private DataSource dataSource;

	// Lấy danh sách các comments dựa trên ID bài viết
	public List<Comment> getComments(String id) {
		String query = "select * from comments where id = ?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Comment> list = new ArrayList<Comment>();
		try {
			con = dataSource.getConnection();
			ps = con.prepareStatement(query);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				Comment comment = new Comment();
				comment.setUsername(rs.getString("username"));
				comment.setCid(rs.getString("cid"));
				comment.setCmt(rs.getString("cmt"));
				comment.setDate(rs.getDate("date"));
				comment.setId(rs.getString("id"));
				list.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
				ps.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	// Tạo comments và lưu vào cơ sở dữ liệu
	public void create(Comment comment) {
		String query = "insert into comments (cmt, username, date, id) values (?, ?, ?, ?)";
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = dataSource.getConnection();
			ps = con.prepareStatement(query);
			ps.setString(1, comment.getCmt());
			ps.setString(2, comment.getUsername());
			ps.setDate(3, new java.sql.Date(comment.getDate().getTime()));
			ps.setString(4, comment.getId());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
