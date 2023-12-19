package service;

import dao.UserDao;
import dao.UserDaoImpl;
import model.User;

public class UserServiceImpl implements UserService {
    private UserDao userDao;
    private User user;
    @Override
    public boolean validateUser(String username, String password) {
        userDao = new UserDaoImpl();
        user = userDao.getPasswordByUsername(username);
        if (user != null && password.equals(user.getPassword())) {
            return true;
        }
        return false;
    }

    @Override
    public User getUerByUsername(String username) {
        userDao = new UserDaoImpl();
        return userDao.getPasswordByUsername(username);
    }

}
