package joinMembership;

public class JoinMembership {
    private String id;
    private String password;
    private String name;
    private String address;
    private String permission;

    public JoinMembership(String id, String password, String name, String address, String permission) {
        this.id = id;
        this.password = password;
        this.name = name;
        this.address = address;
        this.permission = permission;
    }

    // Getters and setters for the fields

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }
}
