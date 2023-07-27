package personalBlog.Dao;

import java.util.List;

import personalBlog.Model.Comment;


public interface CommentDao {
	public List<Comment> getComments(String id);
	public void create(Comment comment);
}
