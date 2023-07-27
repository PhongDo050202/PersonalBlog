package personalBlog.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import personalBlog.Dao.BlogDao;
import personalBlog.Model.Blog;

@Service
public class BlogServiceImpl implements BlogService {

	@Autowired
	private BlogDao blogDao;

	// Tạo bài viết
	@Transactional
	public void create(Blog blog) {
		blogDao.create(blog);
	}

	// Lấy danh sách bài viết cho trang chủ
	public List<Blog> getAll(int pageNumber) {
		return blogDao.getAll(pageNumber);
	}

	// Lấy danh sách bài viết của một người dùng
	public List<Blog> getAllUser(String blogname) {
		return blogDao.getAllUser(blogname);
	}

	// Cập nhật bài viết
	@Transactional
	public void update(Blog blog) {
		blogDao.update(blog);
	}

	// Lấy tên blog dựa trên tên người dùng
	public String getBlogName(String username) {
		return blogDao.getBlogName(username);
	}

	// Lấy bài viết dựa trên ID
	public Blog getByID(String id) {
		return blogDao.getByID(id);
	}

	// Xóa bài viết
	@Transactional
	public void delete(Blog blog) {
		blogDao.delete(blog);
	}
}
