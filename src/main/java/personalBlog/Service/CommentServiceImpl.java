package personalBlog.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import personalBlog.Dao.CommentDao;
import personalBlog.Model.Comment;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDao commentDao;

	// Lấy danh sách comments dựa trên ID bài viết
	public List<Comment> getComments(String id) {
		return commentDao.getComments(id);
	}

	// Tạo coment mới
	public void create(Comment comment) {
		commentDao.create(comment);
	}

}
