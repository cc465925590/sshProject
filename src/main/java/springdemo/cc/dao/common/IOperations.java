package springdemo.cc.dao.common;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import springdemo.cc.model.Page;

public interface IOperations<T extends Serializable> {
	T findOne(final String userid);

	List<T> findAll();

	void create(final T entity);

	T update(final T entity);

	void delete(final T entity);

	void deleteById(final String entityId);
	
	/**
	 * <b>function:</b> 传入查询语句和查询参数名key对应value，page指定currentPage和pageSize
	 * @param queryHql 查询语句
	 * @param paramMap 参数
	 * @param page 当前页和每页几条数据
	 * @throws Exception
	 */
	public Page<T> showPage(String queryHql,String countHql, Map<String, Object> paramMap,int currentPage, int pageSize) throws Exception;

}
