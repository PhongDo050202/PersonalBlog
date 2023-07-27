package personalBlog.Service;

import java.util.List;

import personalBlog.Model.User;


public interface UserService {
	public void create(User user);
	public List<User> getAll();
	public void delete(User user);
	public void suspendOrEnable(String username,int enabled);
	public User getUserByUsername(String username);
	//public void createSampleUser();
}
