package service;

import model.User;

public interface UserService {
    public boolean validateUser(String username, String password);
    public User getUerByUsername(String username);
}
