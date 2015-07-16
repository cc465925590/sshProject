package springdemo.cc.dao.common;

import java.io.Serializable;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import springdemo.cc.model.Page;

import com.google.common.base.Preconditions;

public abstract class AbstractHibernateDao<T extends Serializable> implements
		IOperations<T> {
	private Class<T> clazz;

	@Resource(name = "sessionFactory")
	private SessionFactory sessionFactory;

	protected final void setClazz(final Class<T> clazzToSet) {
		this.clazz = Preconditions.checkNotNull(clazzToSet);
	}

	protected final Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public final T findOne(final String id) {
		return (T) getCurrentSession().get(clazz, id);
	}

	@Override
	public final List<T> findAll() {
		return getCurrentSession().createQuery("from " + clazz.getName())
				.list();
	}

	@Override
	public final void create(final T entity) {
		Preconditions.checkNotNull(entity);
		// getCurrentSession().persist(entity);
		getCurrentSession().saveOrUpdate(entity);
	}

	@Override
	public final T update(final T entity) {
		Preconditions.checkNotNull(entity);
		getCurrentSession().update(entity);
		return entity;
		// return (T)getCurrentSession().merge(entity);
	}

	@Override
	public final void delete(final T entity) {
		Preconditions.checkNotNull(entity);
		getCurrentSession().delete(entity);
	}

	@Override
	public final void deleteById(final String entityId) {
		final T entity = findOne(entityId);
		Preconditions.checkState(entity != null);
		delete(entity);
	}

	/**
	 * 分页功能
	 * 
	 * @param queryHql
	 *             查询sql
	 * @param countHql
	 *            查询记录总个数
	 * @param paramMap
	 *            查询条件
	 * @param currentPage
	 *            当前页号
	 * @param pageSize
	 *            页面最大记录数
	 */
	@Override
	public Page<T> showPage(String queryHql, String countHql,
			Map<String, Object> paramMap, int currentPage, int pageSize)
			throws Exception {
		Page<T> page = new Page<T>(currentPage, pageSize);
		try {
			int dataCount = queryForInt(countHql, paramMap);
			page.setResult(queryForList(queryHql, paramMap, page.getOffset(),
					pageSize));
			page.setTotalsCount(dataCount);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return page;
	}

	/** 查询记录总数 */
	private final int queryForInt(String queryIntHQL,
			Map<String, Object> paramMap) {
		Query query = this.getCurrentSession().createQuery(queryIntHQL);
		setQueryParameterValues(paramMap, query);
		int result = Integer.parseInt(query.uniqueResult().toString());
		return result;
	}

	/** 根据查询条件进行查询 */
	@SuppressWarnings("unchecked")
	private final List<T> queryForList(String queryHql,
			Map<String, Object> paramMap, int offset, int pageSize) {
		Query query = this.getCurrentSession().createQuery(queryHql);
		setQueryParameterValues(paramMap, query);
		if (offset >= 0) {
			query.setFirstResult(offset);
		}
		if (pageSize > 0) {
			query.setMaxResults(pageSize);
		}

		return query.list();
	}

	/** 设置查询参数 */
	private final void setQueryParameterValues(Map<String, Object> paramMap,
			Query query) {
		if (paramMap == null || paramMap.isEmpty())
			return;

		for (Entry<String, Object> entry : paramMap.entrySet()) {
			query.setParameter(entry.getKey(), entry.getValue());
		}

	}

}
