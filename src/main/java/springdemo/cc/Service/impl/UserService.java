package springdemo.cc.Service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import springdemo.cc.Service.IUserService;
import springdemo.cc.Service.common.AbstractService;
import springdemo.cc.dao.common.IOperations;
import springdemo.cc.dao.impl.UserDao;
import springdemo.cc.model.User;

@Service("userService")
public class UserService extends AbstractService<User> implements IUserService{

    @Resource(name="usersDao")
    private UserDao dao;
    
    public UserService() {
        super();
    }

    @Override
    protected IOperations<User> getDao() {
        return this.dao;
    }

}
