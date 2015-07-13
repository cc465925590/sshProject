package springdemo.cc.dao.impl;

import org.springframework.stereotype.Repository;

import springdemo.cc.dao.IUserDao;
import springdemo.cc.dao.common.AbstractHibernateDao;
import springdemo.cc.model.User;

@Repository("usersDao")
public class UserDao extends AbstractHibernateDao<User> implements IUserDao {
	public UserDao() {
		super();
		setClazz(User.class);
	}
}
