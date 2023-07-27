package personalBlog.Model;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class User {
	@Size(min = 6 , max = 12)
	@Pattern(regexp="^[a-zA-Z0-9]")
	private String username;
	@Pattern(regexp="^[a-zA-Z0-9]")
	private String password;
	@Pattern(regexp="^[a-zA-Z0-9]")
	private String userdomain;
	private Boolean enabled;

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserdomain() {
		return userdomain;
	}

	public void setUserdomain(String userdomain) {
		this.userdomain = userdomain;
	}

}
