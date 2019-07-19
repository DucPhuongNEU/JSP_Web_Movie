package model.entity;

public class Account {
    private int id;
    private String username;
    private String pass;
    private String email;
    private String avatar;

    public Account(int id, String username, String pass, String email) {
        this.id = id;
        this.username = username;
        this.pass = pass;
        this.email = email;
    }

    public Account(String username, String pass, String email) {
        this.username = username;
        this.pass = pass;
        this.email = email;
    }

    public Account(int id, String username, String pass, String email, String avatar) {
        this.id = id;
        this.username = username;
        this.pass = pass;
        this.email = email;
        this.avatar = avatar;
    }

    public Account() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
}
