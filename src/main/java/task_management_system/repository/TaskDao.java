package task_management_system.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import jakarta.transaction.Transactional;
import task_management_system.model.Task;

@Repository
public class TaskDao {
	
	// In repository layer, we write logic to save the data in database
	
	// @PersistenceContext will create the object for EntityManager
	@PersistenceContext
	private EntityManager em;
	
	// logic to save data in DB: This method is responsible to save the data, call this method in controller class
	@Transactional
	public boolean addTaskDao(Task task) {
		if(task != null) {
			em.persist(task);
			return true;
		}
		
		return false;
	}
	
    // create a method to retrieve data from DB
	public List<Task> getAllTask(){
		TypedQuery<Task> query = em.createQuery("select e from Task e", Task.class);
		
		return query.getResultList();
	}
	
	// this method is responsible to delete employee record by id
	@Transactional
	public boolean delelteTaskById(int id) {
		//To delete the record we have to perform two steps
		//1.fetch the data from database
		//2.then delete the record
		Task task = em.find(Task.class, id);
		if(task!=null) {
			em.remove(task);
			return true;
		}else {
			return false;
		}
	}
	
	//design method to get Task by id
	@Transactional
	public Task getTaskByID(int id) {
		return em.find(Task.class, id);
	}
		
	// design method to update the task
	@Transactional
	public boolean updateTaskDao(Task task) {
		if(task!=null) {
			em.merge(task);
			return true;
		}
		
		return false;
	}
}
