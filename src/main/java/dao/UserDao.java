package dao;

import model.User;

public interface UserDao {
    public User getPasswordByUsername(String username);

}
