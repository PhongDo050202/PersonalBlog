package personalBlog.Service;

import java.util.List;

import personalBlog.Model.Comment;


public interface CommentService {
	public List<Comment> getComments(String id);
	public void create(Comment comment);
}
