package personalBlog.Controller;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import personalBlog.Model.Blog;
import personalBlog.Model.Comment;
import personalBlog.Service.BlogService;
import personalBlog.Service.CommentService;

@Controller
@SessionAttributes("blog")
public class BlogController {

    @Autowired
    private BlogService blogService;

    @Autowired
    private CommentService commentService;

    // Hàm xử lý khi người dùng tạo bài viết mới
    @RequestMapping(value = "/blogpost", method = RequestMethod.POST)
    public String blogCreatePost(@ModelAttribute("blog") Blog blog, Principal principal) {
        String blogName = blogService.getBlogName(principal.getName());
        blog.setBlogname(blogName);
        blog.setUsername(principal.getName());
        blogService.create(blog);
        return "redirect:/posted";
    }

    // Hàm xử lý hiển thị trang tạo bài viết mới
    @RequestMapping(value = "/blogpost", method = RequestMethod.GET)
    public String blogCreatePost(Model model) {
        model.addAttribute("blog", new Blog());
        return "blogpost";
    }

    // Hàm xử lý khi người dùng đã tạo bài viết thành công và chuyển hướng đến trang thông báo "posted"
    @RequestMapping(value = "/posted", method = RequestMethod.GET)
    public String successPost() {
        return "posted";
    }

    // Hàm xử lý hiển thị thông tin của người dùng và danh sách các bài viết của người dùng trên trang "profile"
    @RequestMapping(value = "/{blogname}", method = RequestMethod.GET)
    public String successPost(@PathVariable("blogname") String blogname, Model model) {
        List<Blog> blog = blogService.getAllUser(blogname);
        model.addAttribute("blog", blog);
        model.addAttribute("blogURL", blogname);
        return "profile";
    }

    // Hàm xử lý hiển thị trang chi tiết bài viết và các bình luận của bài viết
    @RequestMapping(value = "/{blogname}/{id}/{title}", method = RequestMethod.GET)
    public String showBlogDetails(@PathVariable("blogname") String blogname, @PathVariable("id") String id,
                                @PathVariable("title") String title, Model model, Principal principal) {
        Blog blog = blogService.getByID(id);
        if (principal != null && principal.getName().equals(blog.getUsername())) {
            model.addAttribute("edit", true);
        } else {
            model.addAttribute("edit", false);
        }
        List<Comment> comments = commentService.getComments(id);
        model.addAttribute("blogID", blog);
        model.addAttribute("comments", comments);
        model.addAttribute("editedBlog", blog);
        model.addAttribute("newcomment", new Comment()); 
        return "post";
    }
    
    // Hàm xử lý cập nhật bài viết khi người dùng sử dụng chức năng edit
    @RequestMapping(value = "/{blogname}/{id}/{title}", method = RequestMethod.POST, params = "action=edit")
    public String editBlog(@ModelAttribute("editedBlog") Blog editedBlog, @PathVariable("id") String id,
                           @PathVariable("blogname") String name, @PathVariable("title") String title) {
        Blog blogToUpdate = blogService.getByID(id);
        
        // Kiểm tra xem người dùng có quyền sửa bài viết hay không (phải là chủ sở hữu của bài viết) và cập nhật
        if (blogToUpdate != null && blogToUpdate.getUsername().equals(SecurityContextHolder.getContext().getAuthentication().getName())) {
            blogToUpdate.setTitle(editedBlog.getTitle());
            blogToUpdate.setContent(editedBlog.getContent());

            blogService.update(blogToUpdate);
        }

        return "redirect:/" + name + "/" + id + "/" + title;
    }


    // Hàm xử lý khi người dùng thêm bình luận mới cho bài viết
    @RequestMapping(value = "/{blogname}/{id}/{title}", method = RequestMethod.POST)
    public String addComment(@ModelAttribute("newcomment") Comment comment, Principal principal,
                             @PathVariable("id") String id, @PathVariable("blogname") String name,
                             @PathVariable("title") String title) {
        // Kiểm tra xem người dùng đã đăng nhập hay chưa
        if (principal == null) {
            return "redirect:/login";
        }

        // Kiểm tra xem người dùng có quyền ROLE_USER hoặc ROLE_ADMIN hay không
        if (!principal.getName().equals(comment.getUsername()) &&
                !hasRole(principal, "ROLE_USER") && !hasRole(principal, "ROLE_ADMIN")) {
            return "redirect:/error"; 
        }

        String commentContent = comment.getCmt();
        comment.setId(id);
        comment.setUsername(principal.getName());
        comment.setDate(new Date());
        comment.setCmt(commentContent);
        commentService.create(comment);

        // Chuyển hướng về trang chi tiết bài viết sau khi thêm bình luận
        return "redirect:/" + name + "/" + id + "/" + title;
    }
    
    // Hàm hỗ trợ kiểm tra quyền truy cập của người dùng
    private boolean hasRole(Principal principal, String role) {
        return principal != null && principal instanceof Authentication &&
                ((Authentication) principal).getAuthorities().stream()
                        .anyMatch(grantedAuthority -> role.equals(grantedAuthority.getAuthority()));
    }

}
