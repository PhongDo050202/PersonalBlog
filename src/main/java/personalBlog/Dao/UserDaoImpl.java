package personalBlog.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import personalBlog.Model.User;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private DataSource dataSource;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

	// Gọi Setter cho DataSource
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	// Tạo người dùng mới và lưu vào cơ sở dữ liệu
	@SuppressWarnings("resource")
	public void createUser(User user) {
		passwordEncoder = new BCryptPasswordEncoder();
		String password = passwordEncoder.encode(user.getPassword());
		String createQuery = "insert into users (username, password, enabled, userdomain) values (?, ?, ?, ?)";
		String roleQuery = "insert into authorities (username, authority) values (?, ?)";
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = dataSource.getConnection();
			// Tạo người dùng
			ps = con.prepareStatement(createQuery);
			ps.setString(1, user.getUsername());
			ps.setString(2, password);
			ps.setBoolean(3, true);
			ps.setString(4, user.getUserdomain());
			ps.executeUpdate();

			// Mặc định sau khi tạo tài khoản, người dùng có quyền ROLE_USER
			ps = con.prepareStatement(roleQuery);
			ps.setString(1, user.getUsername());
			ps.setString(2, "ROLE_USER");
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

	// Lấy danh sách tất cả người dùng
	public List<User> getAll() {
		String query = "select * from users";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<User> userList = new ArrayList<User>();
		try {
			con = dataSource.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setUsername(rs.getString("username"));
				user.setUserdomain(rs.getString("userdomain"));
				user.setEnabled(rs.getBoolean("enabled"));
				userList.add(user);
			}
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
		return userList;
	}

	// Xóa người dùng
	public void delete(User user) {
		String query = "delete users where username = ?";
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = dataSource.getConnection();
			ps = con.prepareStatement(query);
			ps.setString(1, user.getUsername());
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

	// Tạm ngừng hoặc kích hoạt tài khoản người dùng
	public void suspendOrEnable(String username, int enabled) {
		String query = "update users set enabled = ? where username = ?";
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = dataSource.getConnection();
			ps = con.prepareStatement(query);
			ps.setInt(1, enabled);
			ps.setString(2, username);
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
	
    // Lấy thông tin người dùng dựa trên username
    public User getUserByUsername(String username) {
        String query = "select * from users where username = ?";
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        User user = null;
        try {
            con = dataSource.getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEnabled(rs.getBoolean("enabled"));
                user.setUserdomain(rs.getString("userdomain"));
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
        return user;
    }
    
// // Phương thức để thêm người dùng mẫu vào cơ sở dữ liệu
//    public void createSampleUser() {
//        User sampleUser = new User();
//        sampleUser.setUserName("admin");
//        sampleUser.setPassword("admin"); // Không cần mã hóa ở đây, để bcrypt encoder xử lý
//        sampleUser.setUserDomain("admindomain");
//
//        createUser(sampleUser);
//    }
}

