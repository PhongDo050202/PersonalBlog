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

import personalBlog.Model.Blog;

@Repository
public class BlogDaoImpl implements BlogDao {

	@Autowired
	private DataSource dataSource;

	// Gọi Setter cho DataSource
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	// Tạo bài viết và lưu vào cơ sở dữ liệu
	public void create(Blog blog) {
		String query = "insert into blog (blogname, username, title, content) values (?, ?, ?, ?)";
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = dataSource.getConnection();
			ps = con.prepareStatement(query);
			ps.setString(1, blog.getBlogname());
			ps.setString(2, blog.getUsername());
			ps.setString(3, blog.getTitle());
			ps.setString(4, blog.getContent());
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

	// Cập nhật bài viết trong cơ sở dữ liệu
	public void update(Blog blog) {
		String query = "update blog set title = ?, content = ? where id = ? ";
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = dataSource.getConnection();
			ps = con.prepareStatement(query);
			ps.setString(1, blog.getTitle());
			ps.setString(2, blog.getContent());
			ps.setString(3, blog.getId());
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

	// Xóa bài viết từ cơ sở dữ liệu
	public void delete(Blog blog) {
		String query = "delete blog where id = ?";
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = dataSource.getConnection();
			ps = con.prepareStatement(query);
			ps.setString(1, blog.getId());
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

	// Lấy tên blog từ tên người dùng
	public String getBlogName(String username) {
		String query = "SELECT userdomain FROM users WHERE username = '" + username + "'";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery(query);
			if (rs.next())
				return rs.getString("userdomain");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	// Lấy danh sách bài viết từ trang thứ pageNumber
	public List<Blog> getAll(int pageNumber) {
		String id = "id";
		String query = "select * from blog order by " + id + " desc limit 6 offset " + pageNumber;
		List<Blog> blogList = new ArrayList<Blog>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				Blog blog = new Blog();
				blog.setId(rs.getString("id"));
				blog.setBlogname(rs.getString("blogname"));
				blog.setUsername(rs.getString("username"));
				blog.setTitle(rs.getString("title"));
				blog.setContent(rs.getString("content"));
				blogList.add(blog);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
				rs.close();
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return blogList;
	}

	// Lấy danh sách bài viết từ một blog cụ thể
	public List<Blog> getAllUser(String blogname) {
		String query = "select * from blog where blogname = '" + blogname + "'";
		List<Blog> blogList = new ArrayList<Blog>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				Blog blog = new Blog();
				blog.setBlogname(rs.getString("blogname"));
				blog.setUsername(rs.getString("username"));
				blog.setContent(rs.getString("content"));
				blog.setTitle(rs.getString("title"));
				blog.setId(rs.getString("id"));
				blogList.add(blog);
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
		return blogList;
	}

	// Lấy bài viết dựa trên ID
	public Blog getByID(String id) {
		String query = "select content, title, username from blog where id = ?";
		Blog blog = new Blog();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			ps = con.prepareStatement(query);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				blog.setContent(rs.getString("content"));
				blog.setTitle(rs.getString("title"));
				blog.setUsername(rs.getString("username"));
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
		return blog;
	}
}
