package personalBlog.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import personalBlog.Dao.UserDao;
import personalBlog.Model.User;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    // Setter cho UserDao
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    // Tạo người dùng mới và lưu vào cơ sở dữ liệu
    public void create(User user) {
        userDao.createUser(user);
    }

    // Lấy danh sách tất cả người dùng
    public List<User> getAll() {
        return userDao.getAll();
    }

    // Xóa người dùng
    public void delete(User user) {
        userDao.delete(user);
    }

    // Tạm ngừng hoặc kích hoạt tài khoản người dùng
    public void suspendOrEnable(String username, int enabled) {
        userDao.suspendOrEnable(username, enabled);
    }

    // Lấy thông tin người dùng dựa trên username
    public User getUserByUsername(String username) {
        return userDao.getUserByUsername(username);
    }
    
//    @Override
//    @Transactional
//    public void createSampleUser() {
//        userDao.createSampleUser();
//    }
}

