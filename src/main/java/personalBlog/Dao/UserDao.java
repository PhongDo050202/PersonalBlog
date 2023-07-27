package personalBlog.Dao;

import java.util.List;

import personalBlog.Model.User;


public interface UserDao {
	public void createUser(User user);
	public List<User> getAll();
	public void delete(User user);
	public void suspendOrEnable(String username, int enabled);
	public User getUserByUsername(String username);
	//public void createSampleUser();
}
