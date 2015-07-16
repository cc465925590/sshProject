package springdemo.cc.Service.common;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import springdemo.cc.dao.common.IOperations;
import springdemo.cc.model.Page;

@Transactional
public abstract class AbstractService<T extends Serializable> implements
		IOperations<T> {
	protected abstract IOperations<T> getDao();

	@Override
	public T findOne(final String id) {
		return getDao().findOne(id);
	}

	@Override
	public List<T> findAll() {
		return getDao().findAll();
	}

	@Override
	public void create(final T entity) {
		getDao().create(entity);
	}

	@Override
	public T update(final T entity) {
		return getDao().update(entity);
	}

	@Override
	public void delete(final T entity) {
		getDao().delete(entity);
	}

	@Override
	public void deleteById(String entityId) {
		getDao().deleteById(entityId);
	}

	@Override
	public Page<T> showPage(String queryHql, String countHql,
			Map<String, Object> paramMap, int currentPage, int pageSize)
			throws Exception {
		// TODO Auto-generated method stub
		return getDao().showPage(queryHql, countHql, paramMap, currentPage, pageSize);
	}
}
